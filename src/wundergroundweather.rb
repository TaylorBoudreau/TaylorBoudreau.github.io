require 'httparty'
require 'json'

wunderground_key = 07cfb8918dc0fcd7
state = 'OR'
city = 'Portland'

response = HTTParty.get('http://http://api.wunderground.com/api/' + wunderground_key + '/conditions/q/' + state + '/' + city + '.json')

puts response.body