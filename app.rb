require 'sinatra'
require 'cgi'

filename = CGI.escape(params['url']) + '.png'
Tempfile.create(filename) do |f|
  system(ENV.fetch('GOOGLE_CHROME_SHIM'), "--screenshot=#{f.path}", "--window-size=1480,1110", params['url'])
end

get '/screenshot' do
  "url: #{params['url']} <img src='/#{filename}' />"
end
