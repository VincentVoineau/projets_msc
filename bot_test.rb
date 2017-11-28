#!/usr/bin/env ruby

require 'rubygems'
require 'twitter'
require 'json'

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ""
  config.consumer_secret     = ""
  config.access_token        = ""
  config.access_token_secret = ""
end
  

  promotion = {
		"photo" => "/home/vincent/Bureau/index.jpeg",
  		"text" => "Code réduction Kinguin : '20%' sur votre comande avec le code promo : GNET #promo #codepromo #Kinguin https://www.kinguin.net/fr/"
  	}


client.search("overwatch").take(100).each do |tweet|
  puts "#{tweet.user.screen_name}: #{tweet.text}"
      users = []
      users.push(tweet.user.id)
      puts tweet
      client.favorite(tweet)
      client.update_with_media("@#{tweet.user.screen_name} " + promotion["text"], open(promotion["photo"]), {})

end

def run(client)
  retweetKeyword = "overwatch"
  while true
    re = client.search(retweetKeyword).first.id
    client.retweet(re);
    puts "Retweet: #{re} #{Time.now}";
    sleep(60);
  end

  
end

#run(client);