require 'sinatra'
require 'cgi'

def take_screenshot(url)
  filename = CGI.escape(url) + '.png'
  Tempfile.create(filename) do |f|
    system(ENV.fetch('GOOGLE_CHROME_SHIM'), "--screenshot=#{f.path}", "--window-size=1480,1110", url)
  end
  filename
end

get '/screenshot' do
  url = params['url']
  filename = take_screenshot(url)
  "url: #{url} <img src='/#{filename}' />"
end
