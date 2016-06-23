words_array = ["ancient", "alien", "mainstream", "archaelogy", "crystal", "skull", "mystery", "legendary", "portal", "sightings", "Giorgio", "vortex", "gravity"] # list of words
bad_guesses_array = []
secret_word_chars = [] # make array with characters with .char
guesses = 6 # guesses = 6 (head, torso, left arm, right arm, left leg, right leg)
bad_guesses = 0


secret_word = words_array[rand]
puts secret_word# pick randomly from list
letters_to_guess = secret_word.length
puts letters_to_guess.to_i # determine character length with .length
secret_word_chars << secret_word.chars
print secret_word_chars
print letters_to_guess."_ ".times
while guesses > 0
  puts "You have #{guesses} guesses left."
  gets.chomp
  # if gets.chomp #if this is a letter character
end
# puts letters_to_guess.to_i."_".times
# set while loop with count down for each wrong count
#
# display "_" for each character
#
# puts "You have () guesses."
# ask for a guess
# ensure input is a character
# =>
# =>
#
#
#
#
#
#
#
#
