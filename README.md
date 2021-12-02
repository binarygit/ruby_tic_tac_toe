# Tic Tac Toe

This is a simple Tic Tac Toe game that I made using ruby.

You can play it by cloning it into your machine and running `ruby lib/main.rb` or play it here: https://replit.com/@binarygit/tictactoe#.replit

I wanted to get better at writing OO code, and get familiar with Testing which is why I wrote this program. I think that I still have space to improve as I donot belive I've uncovered most of the abstractions the code holds. However, I have learned tons about program design and code arrangement. Many times while writing this, I thought perhaps a more procedural or functional approach would have been appropriate for writing this program. But as I was trying to practice OOP, I have tried to keep the code as faithful to OO as I could.

![main_menu](https://user-images.githubusercontent.com/87677429/143662036-03277437-4053-4b7b-8701-f87a650016ac.png)

![game_scr](https://user-images.githubusercontent.com/87677429/143662112-1afdba2a-08f9-4bba-ab2e-d5ba00b010c4.png) 
![game_scr1](https://user-images.githubusercontent.com/87677429/143662202-9579481d-0bf5-4c96-96c3-d63e100bba5a.png)

# Functionality

The main functionality that I wrote is the Play method, which ties the Board and Player object together and makes it possible to play the game. 

As you can see, it is a simple infinite loop, it uses this instead of a finite loop that could also keep track of (say) num_of_turns because I didn't want the method to do too many things. It already does enough. The legal? method which is included in the Rules module tells play to not mark an illegal move. Thus an invalid move is treated like it never happened and so makes it unnecessary to track the number of moves. 

The game ends when, the game_over_conditions (win or draw, which verdict method handles) are met.

![play](https://user-images.githubusercontent.com/87677429/143662417-dc0a511a-df58-4443-a308-cfa25fbb4224.png)

The red and green markers as you see in the ss have been made by modifying the String class.

![string](https://user-images.githubusercontent.com/87677429/143662936-4fb7467b-1622-428e-bb29-3817582888c8.png)

# Testing

The game employs tests on the two most important methods which are legal? and verdict. It makes use of Rspec's double/mock feature to do so.

# What I Learned
* Testing with Rspec 
* That I still have some way to go inorder to master OOP, and that this was the right direction






