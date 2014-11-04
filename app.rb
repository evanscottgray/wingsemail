require 'sinatra'
require 'haml'
require 'json'

require './lib/is_pwnd.rb'

configure do
  # Don't log them. We'll do that ourself
  set :dump_errors, false

  # Don't capture any errors. Throw them up the stack
  set :raise_errors, false

  # Disable internal middleware for presenting errors
  # as useful HTML pages
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