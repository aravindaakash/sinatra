$stderr.puts "loading"
require 'sinatra'

configure do
  set :foo, :bar
end

get '/app_file' do
  content_type :txt
  settings.app_file
end

get '/ping' do
  'pong'
end

get '/stream' do
  stream do |out|
    sleep 0.1
    out << "a"
    sleep 1.2
    out << "b"
  end
end

get '/mainonly' do
  object = Object.new
  begin
    object.send(:get, '/foo') { }
    'false'
  rescue NameError
    'true'
  end
end

$stderr.puts "starting"