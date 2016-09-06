words = ["ancient", "alien", "mainstream", "archaelogy", "crystal", "skull", "mystery", "legendary", "portal", "sightings", "vortex", "gravity"]
bad_guesses_array = []
good_guesses_array = []
# alphabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K",
# "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
characters = []
blank_characters = []
guesses = 6

word = words[rand(words.length)]
puts word

word_length = word.length.to_i
blank_characters << "_ "*word_length
print blank_characters
characters << word.chars
print characters

while guesses > 0
 puts "You have #{guesses} guess(es) left.  Enter a letter:"
 attempt = gets.chomp
 if characters.include?(attempt)
  puts "yes, #{attempt} is in the word."
 else
  puts "Nope.  #{attempt} is not in the word.  Try again."
  bad_guesses_array << attempt
  guesses -= 1
 end
end

puts "You lose.  The word was '#{word}.'"
