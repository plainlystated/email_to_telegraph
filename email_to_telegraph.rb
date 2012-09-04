require 'rubygems'
require 'gmail'
require 'yaml'

config = YAML.load_file("config.yml")

Gmail.new(config[:username], config[:password]) do |gmail|
  puts "unread: #{gmail.inbox.count(:unread)}"

  gmail.inbox.find(:unread).each do |email|
    puts email.subject
    email.read!
  end
end
puts
