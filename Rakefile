require "rake"

class InstallfileLoader
  attr_reader :installables

  def initialize(file = File.new("Installfile"))
    @installables = []

    instance_eval(file.read)
  end

  def link(origin, destination)
    @installables << [:link, origin, destination]
  end

  def copy(origin, destination)
    @installables << [:copy, origin, destination]
  end
end

task :default => :install

desc "Execute the Installfile."
task :install do
  skip_all = false
  overwrite_all = false
  backup_all = false

  installfile = InstallfileLoader.new
  installables = installfile.installables
  installables.each do |installable|
    overwrite = false
    backup = false

    origin = File.expand_path(installable[1])
    destination = File.expand_path(installable[2])

    if File.exists?(destination) || File.symlink?(destination)
      unless skip_all || overwrite_all || backup_all
        puts "File already exists: #{destination}, what do you want to do? [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all"
        case STDIN.gets.chomp
        when 'o' then overwrite = true
        when 'b' then backup = true
        when 'O' then overwrite_all = true
        when 'B' then backup_all = true
        when 'S' then skip_all = true
        end
      end
      FileUtils.rm_rf(destination) if overwrite || overwrite_all
      `mv "#{destination}" "#{destination}.backup"` if backup || backup_all
    end

    case installable[0]
    when :link then `ln -s "#{origin}" "#{destination}"`
    when :copy then `cp "#{origin}" "#{destination}"`
    end
  end
end

desc "Execute the OSX installer script."
task :osx do
  sh "~/.dotfiles/plugin/osx/install.sh"
end
