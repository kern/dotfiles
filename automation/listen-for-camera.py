#!/usr/bin/env python3

from meross_iot.http_api import MerossHttpClient
from meross_iot.manager import MerossManager
import asyncio
import os
import re
import requests
import subprocess
import threading
import time

ELGATO_LIGHT_HOST = os.environ.get('ELGATO_LIGHT_HOST')
EMAIL = os.environ.get('MEROSS_EMAIL')
PASSWORD = os.environ.get('MEROSS_PASSWORD')

loop = asyncio.new_event_loop()
asyncio.set_event_loop(loop)

def toggle_desk_light(on):
    url = "http://" + ELGATO_LIGHT_HOST + ":9123/elgato/lights"
    data = {
        'Lights': [{
            'Temperature': 344,
            'Brightness': 20,
            'On': 1 if on else 0,
        }],
        'NumberOfLights': 1
    }
    res = requests.put(url=url, json=data)
    print(res)
    print(res.json())

async def async_toggle_hallway_light(on):
    # Setup the HTTP client API from user-password
    http_api_client = await MerossHttpClient.async_from_user_password(email=EMAIL, password=PASSWORD)

    # Setup and start the device manager
    manager = MerossManager(http_client=http_api_client)
    await manager.async_init()

    # Retrieve all the MSS310 devices that are registered on this account
    await manager.async_device_discovery()
    plugs = manager.find_devices(device_type="msl430")

    if len(plugs) < 1:
        print("No MSL430 lights found...")
    else:
        # Turn it on channel 0
        # Note that channel argument is optional for MSS310 as they only have one channel
        dev = plugs[0]
        print(f"Turning on {dev.name}...")
        await dev.async_update()
        await dev.async_turn_on(channel=0)
        if on:
            await dev.async_set_light_color(rgb=(255, 0, 0), luminance=100)
        else:
            await dev.async_set_light_color(rgb=(255, 255, 255), luminance=50)

    # Close the manager and logout from http_api
    manager.close()
    await http_api_client.async_logout()

def toggle_hallway_light(on):
    loop.run_until_complete(async_toggle_hallway_light(on))

def output_reader(proc):
    for line in iter(proc.stdout.readline, b''):
        decoded = line.decode('utf-8')
        x = re.search("^\s*\"VDCAssistant_Power_State\"\s+=\s+(Off|On);\s*$", decoded)
        if x:
            on = x.group(1) == 'On'
            toggle_desk_light(on)
            toggle_hallway_light(on)

def main():
    proc = subprocess.Popen(['log', 'stream', '--predicate', 'subsystem contains "com.apple.UVCExtension" and composedMessage contains "Post PowerLog"'],
                            stdout=subprocess.PIPE,
                            stderr=subprocess.STDOUT)

    t = threading.Thread(target=output_reader, args=(proc,))
    t.start()
    t.join()

main()
