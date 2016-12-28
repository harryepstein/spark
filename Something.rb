require 'rubygems'
require 'crack'
require 'open-uri'
require 'rest-client'
require 'pp'
require 'Nokogiri'
require 'Mechanize'


base_url='http://www.springfieldspringfield.co.uk/'
url ="#{base_url}/view_episode_scripts.php?tv-show=its-always-sunny-in-philadelphia"
puts url

page = Nokogiri::HTML(open(url))
links = page.css("a.season-episode-title")
puts links
links.each{|link|

 	 episodePage = Nokogiri::HTML(open("#{base_url}" + link['href']))
 		script = episodePage.css("div.scrolling-script-container").text
 		puts script
 		#File.write("#{link['href']}", script)#Write to individual files named and numbered according to their season and episode numbers.	 
 	}

# ONCE IT FINDS THE SPECIFIC EPISODE PAGE RUN THIS SCRIPT TO OBTAIN THE SCRIPT TEXT
# script = episodePage.css("div.scrolling-script-container").text


