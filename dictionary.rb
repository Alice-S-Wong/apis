require 'http'
require 'awesome_print'

while true

  p "Enter a word to define. Type q to quit."

  user_word = gets.chomp.downcase

  if user_word == "q"
    break
  else
    response = HTTP.get("https://api.wordnik.com/v4/word.json/#{user_word}/definitions?limit=200&includeRelated=false&useCanonical=false&includeTags=false&api_key=")

    # ap response.parse

    definition = response.parse[0]["text"]
    pronunciation = response.parse[0]["textProns"]

    p "#{user_word} - Definition: #{definition} Pronunciation: #{pronunciation}."
  end

end