require 'net/http'
require 'net/https'
require 'uri'
require 'json'
require 'openssl'
require 'base64'
require 'securerandom'
require_relative 'rest_client'
require_relative 'credentials'
require_relative 'parser'

credentials = Credentials.new
token = credentials.token
payload = credentials.payload

response = RestClient.post(token, payload)
routes_with_ip = response[:report].split("\n")

parsed_routes  = Parser.new(routes_with_ip).parse
parsed_routes.each do |route, ips|
  puts "#{route} - #{ips.uniq.count}"
end
