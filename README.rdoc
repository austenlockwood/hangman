# Hangman
### A console game in basic Ruby
This is a homework assignment completed in the Backend Engineering course at The Iron Yard in 2016.
This app is not on Rails and uses no gems or helper files.  It demonstrates my understanding of basic Ruby.

## Rules and setup
[Wikipedia basics on hangman](https://en.wikipedia.org/wiki/Hangman_(game)#Example_game)

- A static selection of all-caps words is in an array called `words`
- User has 7 turns to guess the word, stored at the start of the game in a variable called `turns`
- User guesses are stored in an initially empty array called `guesses`

## The breakdown
User types `ruby hangman.rb` in the console to start the program.

Computer selects a random item from `words` using the `.sample` method.  This value is assigned to the variable `secret_word`.

Console displays a welcome message to the user including how long the word is, gleaned from calling `.length` on `secret_word` and interpolating that string into the welcome message.  The welcome message prompts the user to make a guess.

A Ruby loop begins that will end when `turns` are equal to zero or the `output` includes no unguessed letters.

### Overarching game loop
(`output` is defined on the line above the beginning of the loop as one unguessed letter (`"-"`) so the `until` condition will not abort the game before it starts, as there have been no guessed or unguessed letters displayed yet and so `!output.include?("-")` would evaluate to *true*.)

Within the loop, the letter the user guesses is captured with `gets.chomp.` It is made all-caps by concatenating the .upcase method to prevent any mismatches when compared to `secret_word` due to a different case from the characters in `secret_word`.` This value--the user's guess at the letter properly formatted to be compared against the secret word--is assigned the variable name `stab`.

`stab` travels through an if/else statement to determine if it is a valid guess, and if it is, then through another nested if/else statement to determine if it is in `secret_word`.`

#### Validity
To determine if `stab` is a valid entry, it is initially checked in the `if` block against the elements of `guesses`; if present, a message to that effect is displayed in the console and `stab` is not pushed into guesses nor does the user lose a turn.

If not present in `guesses`, `stab` continues to the `elsif` block where it is run through a series of booleans to see if it is either the wrong length or the wrong format (not a letter).  If any of these conditions are true, a message is displayed in the console and `stab` is not pushed into guesses nor does the user lose a turn.

If `stab` is indeed a valid guess, it continues to the `else` block, where it runs through a nested if/else statement to check if `secret_word` includes `stab`.

#### Good guess/bad guess
A message for each outcome (present or not present) is displayed, and if it is NOT present in `secret_word` (i.e. a "bad guess") `turns` is reduced by 1.  In both instances, the valid guess is pushed into `guesses.`  The nested if/else statement ends here and the rest of the loop is executed.

The `output` variable is here defined as the method `display.`  `display` is defined above the loop and takes two arguments, `word` and `guesses`.  Here it is fed the arguments `secret_word`, the value of which was determined at the outset of the game and `guesses`, the value of which is the current array of guessed letters.

#### Jumping out of the loop momentarily to explain `display`
- In this method, a variable called `masked_word` is defined as an empty string.  The method has been fed `secret_word`, which it calls `word` inside the method.  (So what is always `word` inside the display method is whatever `secret_word` happens to be on the outside.)

- `word` is broken into its individual letters and cycled through a do/end loop with .each_char (roughly the string version of an array's .each method).

- Within the do/end loop, these letters are fed through an if/else statement where the guesses array is iterated through to see if there is a match, i.e. if the guesses already made by the user include any of the letters in `secret_word`.  This means that for each turn, the display method is starting fresh, processing all guesses one by one, and building what to display.

- If `guesses` includes a letter in `secret_word`, that letter is added to masked_word; if not, a hyphen representing an unguessed letter is added to masked_word.  In both the if and else blocks, `masked_word` is then redefined as itself (the original empty string), plus the letter just added.  The do/end loop ends and `masked_word` is returned.  If masked_word was not redefined in the if/else blocks using `masked_word = masked_word + char` and then returned, masked_word would ultimately return an empty string each time because the added letter would only exist in the if/else block.  Redefining the variable allows it to be added to incrementally.

#### Back to the game loop
`output`, which is display with the arguments du jour, is then displayed to the console as a series of hyphens and letters.

Already guessed letters are displayed below that by calling `.join` on the `guesses` array with a comma and a space between each element.

Turns left are displayed on the console with a simple string interpolation of `turns` inside a message.

The `until` loop code ends and is repeated until a condition of the until boolean is met.  At that point, the `win_lose` method is executed to display a win or lose message.

`win_lose` will only be dealt with when the player is out of turns.  It takes two arguments, `output`, defined in the until loop and `secret_word`, set at the outset of the game.

If `output` does not include any unguessed letters (`"-"`), the console displays a win message; if it does, the console displays a lose message, and the game ends.

## Potential improvements
- Ask the user if they want to play
- Clean up spacing
- Pull words from outside source (instead of static list)
- Hint function
- ASCII art!
