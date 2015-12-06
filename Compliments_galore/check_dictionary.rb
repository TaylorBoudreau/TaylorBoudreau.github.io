require './complimentgetter.rb'


def get_compliment_string
	gotten_compliment = Compliment.new
	compliment_string = gotten_compliment.get_a_compliment
	compliment_string
end


def process_string_to_palatable_array(string)
	compliment_string = string.downcase
	compliment_string = compliment_string.gsub(/[^a-z0-9\- ']/, "")
	compliment_string = compliment_string.gsub(/[-]/, " ")
	compliment_string = compliment_string.gsub(/'s/, "")
	compliment_string = compliment_string.gsub(/'d/, "")
	compliment_string = compliment_string.split(" ")
end

def palatable_dictionary_array
	words = File.open('./dictionary').read
	words = words.downcase
	words_array = words.split(" ")
	words_array
end

def check_word_in_dictionary(word, array)
	array.include?(word)
end

#Get an array of the words in the received compliment
#Get a palatable dictionary array to compare the words in the compliment array
#Iterate over the compliment array and check if each word in the compliment array is in the dictionary array
#Save the unknown words to an unknown words array

def check_compliment_words
	
	loaded_compliment = get_compliment_string
	my_compliment_array = process_string_to_palatable_array(loaded_compliment)

	known_words = palatable_dictionary_array
	unknown_words = []
	display = {}
	
	my_compliment_array.each do |i|
		if !check_word_in_dictionary(i, known_words)
			possible_unknown = i[0...-1]
			if !check_word_in_dictionary(possible_unknown, known_words)
				unknown_words.push(i)
			end
		end
	end

	display['original'] = loaded_compliment
	display['missing_words'] = unknown_words
	display

end

check_compliment_words

