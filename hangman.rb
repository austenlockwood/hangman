require "pry"
# TODO: handle invalid input (non-letters, already-guessed, more than one character)
# TODO: show what letters already guessed
# TODO: ask if they want to play
# TODO: fix the initial display to show blanks

# TODO: fix turns and don't display the answer at getgo

words = ["HULLABALOO", "CLAPTRAP", "IDIOPATHIC", "BOBBIN", "BAMBOO", "POPPYCOCK", "PERSNICKETY", "IRKED", "NOODLES", "FRIPPERY", "BEFUDDLEMENT", "HABERDASHERY", "DIPHTHONG", "BRITCHES", "SASSAFRAS", "GADABOUTS", "BAZOOKA", "COCKAMAMIE", "EGAD", "MAGMA"]

turns = 7
secret_word = words.sample
guesses = []

def valid_guess(info, guesses)
  if guesses.include?(info)
    puts "You already guessed that.  Try again."
  elsif (info.length == 1) && (info.to_i.to_s != info) && (info.to_f.to_s != info)
    info = info
  else
    puts "'#{info}' is not a valid guess.  Try again."
  end
end

def display(word, guesses)
  masked_word = ""
  word.each_char do |char|
    if guesses.include?(char)
      masked_word = masked_word + char
    else
      masked_word = masked_word + "-"
    end
  end
  masked_word
end

def win_lose(output, secret_word)
  if !output.include?("-")
    puts "You win!  The word is #{secret_word}."
  else
    puts "Sorry, you lose.  The word is #{secret_word}."
  end
end

puts "We're playing hangman now.  The word is #{secret_word.length} letters long.  Guess a letter."
# puts secret_word #get rid of this
output = "-"
until turns == 0 || !output.include?("-")

  stab = gets.chomp.upcase

  worth_checking = valid_guess(stab, guesses)
  if secret_word.include?(worth_checking)
    binding.pry
    puts "'#{worth_checking}' IS in the word!"
  else
    puts "'#{worth_checking}' is not in the word."
    turns-=1
  end
  # win_lose_next(output, turns, secret_word)
  guesses << worth_checking
  output = display(secret_word, guesses)
  puts output
  puts "Already guessed: #{guesses.join(", ")}"
  puts "Turns left: #{turns}"

end

win_lose(output, secret_word)
