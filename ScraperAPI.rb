#!/usr/bin/env ruby
require 'net/http'
require 'net/https'
require 'rubygems'
require 'json'
require 'date'
require 'csv'
require 'mechanize'
require 'uri'

pictureURL = ""
pid = ""
piddetailURL = ""
fulltextpara = ""
organization = ''
summary = ""
category = ""
p4h = Mechanize.new
  #{|a| a.ssl_version, a.verify_mode = 'SSLv3', OpenSSL::SSL::VERIFY_NONE}
page = p4h.get("https://p4h.skild.com/skild2/p4h/viewEntryVoting.action")
page = p4h.get("https://p4h.skild.com/skild2/p4h/publicVotingGetEntryList.action?sortBy=title&filteryBy=0&viewType=list")
# page.body will have the HTML content we now parse
entrylist = page.parser.xpath("//div[@class='entry post-1 rounded']")
# we want to iterate through the entry items
puts entrylist.count
entrylist.each_with_index do |item, i|
  pictureURL = item.xpath("//div[@class='candidate-intro-image']/img/@src")[i].text.strip
  piddetailURL = item.xpath("//div[@class='post-content']/h4/a/@href")[i].text.strip
  # Splits the string according to the specified delimiter ? - we want whats after the ? in a zero indexed array, and four chars in
  pid = piddetailURL.split('?')[1][4..-1]
  fulltextpara = item.xpath("//div[@class='full-text paragraph']/p")[i].text.strip
  #puts "PictureURL: " + pictureURL
  puts "pid: " + pid
  #puts "Full text: " + fulltextpara
  # Everything we can get from the listing page is scraped. Now go to the individal listing page
  page = p4h.get("https://p4h.skild.com/skild2/p4h/viewEntryDetail.action?pid=" + pid)
  title = page.parser.xpath("//div[@class='formel textbox']/span[@type='text']")[0].text
  puts "Title: " + title
  organization = page.parser.xpath("//div[@class='formel textarea'][span='Organization(s) Applying (one per line)  ']/span")[1]
  unless organization.nil? # Not all entries listed an organization
    organization = organization.text
    puts "Organization: " + organization
  end
  summary = page.parser.xpath("//div[@class='formel textarea'][span='Application Summary  ']/span")[1].text
  #puts "Summary: " + summary
  category = page.parser.xpath("//div[@class='formel radio'][legend='Category']/input[@checked='checked']/label")[0].text
  #type =
  #location =
  #contact =
end
