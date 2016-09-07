words = ["HULLABALOO", "CLAPTRAP", "IDIOPATHIC", "BOBBIN", "BAMBOO", "POPPYCOCK", "PERSNICKETY", "IRKED", "NOODLES", "FRIPPERY", "BEFUDDLEMENT", "HABERDASHERY", "DIPHTHONG", "BRITCHES", "SASSAFRAS", "GADABOUTS", "BAZOOKA", "COCKAMAMIE", "EGAD", "MAGMA"]

turns = 7
secret_word = words.sample
guesses = []

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

output = "-"

until turns == 0 || !output.include?("-")

  stab = gets.chomp.upcase

  if guesses.include?(stab)
    puts "You already guessed '#{stab}'.  Try again."
  elsif (stab.length != 1) || (stab.to_i.to_s == stab) || (stab.to_f.to_s == stab)
    puts "'#{stab}' is not a valid guess.  Try again."
  else

    if secret_word.include?(stab)
      puts "'#{stab}' IS in the word!"
    else
      puts "'#{stab}' is not in the word."
      turns-=1
    end

    guesses << stab

  end

    output = display(secret_word, guesses)
    puts output
    puts "Already guessed: #{guesses.join(", ")}"
    puts "Turns left: #{turns}"

end

win_lose(output, secret_word)
