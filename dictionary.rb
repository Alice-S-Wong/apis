require 'http'
require 'awesome_print'

while true

  p "Enter a word to define. Type q to quit."

  user_word = gets.chomp.downcase

  if user_word == "q"
    break
  else
    response1 = HTTP.get("https://api.wordnik.com/v4/word.json/#{user_word}/definitions?limit=200&includeRelated=false&useCanonical=false&includeTags=false&api_key=")

    definition = response1.parse[0]["text"]
    # p definition

    response2 = HTTP.get("https://api.wordnik.com/v4/word.json/#{user_word}/pronunciations?useCanonical=false&limit=50&api_key=")

    pronunciation = response2.parse[0]["raw"]
    # ap pronunciation

    p "#{user_word} - Definition: #{definition} Pronunciation: #{pronunciation}."
  end

end