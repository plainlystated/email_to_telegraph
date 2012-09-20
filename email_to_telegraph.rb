require 'rubygems'
require 'gmail'
require 'yaml'
require File.expand_path("./lib/morse_code.rb")
require File.expand_path("./lib/telegraph_sounder.rb")

config = YAML.load_file("config.yml")

Gmail.new(config[:username], config[:password]) do |gmail|
  puts Time.now
  puts "unread: #{gmail.inbox.count(:unread)}"
  gmail.inbox.find(:unread).each do |email|
    morse_code = MorseCode.encode(email.subject)
    puts " - #{email.subject}"
    puts "   #{morse_code}"

    TelegraphSounder.say(morse_code)
    email.read!
  end
end

puts
