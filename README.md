# COMP327 Assignment 1 - 98%

### Developing a Mobile App based on the Mastermind game.

### Your Task

You will design and develop an application written in Swift 5 (or later) for iPhone 8.

The App will play a version of the game Mastermind (see https://en.wikipedia.org/wiki/Mastermind_(board_game) for details of the game).

**Rules of the game:**
1. A code-maker creates a pattern of four coloured pegs (from six colour choices), and hides it from the player (note that the pattern may contain several pegs of the same colour).
2. The player makes a guess at the code pattern by selecting a sequence of four coloured pegs.
3. If the player’s pattern matches that of the code-maker, then the player wins the game.
4. If the player’s pattern does not match that of the code-maker then the code-maker compares the player’s pattern against the hidden code pattern and reports back to the player:
    - The number of pegs of the correct colour and in the correct position in the pattern (indicated by a black symbol in the feedback).
    - The number of pegs of the correct colour but in the wrong position in the pattern (indicated by a white symbol in the feedback).
5. If the player has made ten guesses without successfully guessing the hidden code, the code-maker wins the game.
6. If the player has made fewer than ten guesses, the game repeats from step 2.

**The App should:**
1. Allow the user to play the game of Mastermind, against the App which acts as code-maker. **(worth 25%)**
2. Provide an interface that allows the player to select four coloured pegs. The user must be able to select the pegs they want using a sensible UI. **(worth 20%)**
3. Provide feedback on the user’s choice (in some versions of this game, this is done using a smaller white or black peg, that the code-maker places to the right of the player’s code sequence for each type of match – note that the code-maker does not tell the player which of the coloured pegs matches, just simply the amount of them that do). **(worth 10%)**
4. Previous patterns that the user has chosen in this particular game and the feedback on them, must be displayed so that the user can use the information to inform their next choice. **(worth 20%)**
5. Use a persistent storage mechanism to save the number of games won by the code-maker and by the player, so that on starting the app, a count of the games won and lost can be viewed. **(worth 10%)**
6. The app must work in portrait orientation, on both an iPhone 8, and an iPad (e.g. iPad Pro 9.7”), maintaining a sensible UI in both **(worth 10%)**
7. Please ensure that your code is appropriately commented and meaningful variable and constant names are used. **(worth 5%)**
