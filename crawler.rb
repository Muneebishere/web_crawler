require 'Mechanize'
require 'Cgi'

agent = Mechanize.new
page = agent.get('https://www.google.com/search?q=xoho+tech')

link_count = 6

puts ":::::::::::::::Crawling Google:::::::::::::::::"
puts ":::::::::::::::::::Results:::::::::::::::::::::"
page.links.each do |link|
  if link.href.start_with? '/url'
    link_count -= 1
    uri = URI.parse(link.href)
    puts CGI.parse(uri.query)["q"]
  end

  unless link_count > 0
    break
  end
end
puts ":::::::::::::::::::End:::::::::::::::::::::::::"