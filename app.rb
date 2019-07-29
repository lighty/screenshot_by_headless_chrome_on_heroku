require 'sinatra'

get '/screenshot' do
  "url: #{params['url']}"
end

  
# cmd = "#{headless_chrome_exe} --headless --no-sandbox --disable-gpu --screenshot=#{f.path} --window-size=1480,1110 #{self.url}"
