require 'httparty'
require 'json'


#This returns a random compliment from www.emergencycompliment.com
class Compliment

	attr_reader :url, :compliment_hash
	
	def initialize
		@url = 'http://spreadsheets.google.com/feeds/list/1eEa2ra2yHBXVZ_ctH4J15tFSGEu-VTSunsrvaCAV598/od6/public/values?alt=json'
		@compliment_hash = {}
	end


	#def random_compliment_from_parsed_list(parsed_compliment_list)
		
		#Get the length of the feed from the list so a random compliment can be selected
		
		#compliment1
	#end

	#begin
		
	def get_a_compliment	
		json_list = HTTParty.get(@url)

		case json_list.code
		when 200
			
			parsed_list = JSON.parse(json_list.body)
			total = parsed_list['feed'].length
			random_position = rand(total)
			
			picked_compliment = parsed_list['feed']['entry'][random_position]['gsx$compliments']['$t']
			
			@compliment_hash['gotten_compliment'] = picked_compliment
		else
			raise 'Nope Nope Nope'
		end
	end
		
end

#a = Compliment.new
#puts a.inspect

#a = a.get_a_compliment
#puts a.inspect


#a = Compliment.new
#b = a.get_compliment_list
#parsed_list = a.parse_list(b)
#give = a.random_compliment_from_parsed_list(parsed_list)
#puts give

