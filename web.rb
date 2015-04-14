require 'sinatra'

set :port, ENV["PORT"] || 8778

get '/' do
  whom = ENV["POWERED_BY"] || "USPTO CODE"
  container = `hostname`.strip || "unknown"
  "Powered by " + whom + "\nRunning on container ID " + container + "\n"
end
