require 'sinatra'
require 'haml'
require 'json'
require 'newrelic_rpm'

require './lib/is_pwnd.rb'

configure do
   set :dump_errors, false
   set :raise_errors, false
   set :show_exceptions, false
end

EMAIL_LIST = JSON.parse(File.read('/tmp/config.json'))

get '/' do
  haml :home
end

post '/is_pwnd' do
  begin
    resp = {:was_owned => is_pwnd?(@params[:email], EMAIL_LIST['emails'])}
    resp.to_json
  rescue Exception => e
    status 400
    body e.inspect.to_s
  end
end