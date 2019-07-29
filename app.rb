require 'sinatra'
require 'cgi'

def take_screenshot(url)
  filename = CGI.escape(url) + '.png'
  directory = './public/'
  command = ENV.fetch('GOOGLE_CHROME_BIN')
  options = %W(--headless --no-sandbox --disable-gpu --screenshot=#{directory + filename} --window-size=1000,1000)
  system(command, *options, url)
  filename
end

get '/screenshot' do
  url = params['url']
  filename = take_screenshot(url)
  "url: #{url} <img src='/#{URI.encode(filename)}' />"
end
