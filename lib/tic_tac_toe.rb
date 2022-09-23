require 'pry'
class TicTacToe
    attr_accessor :board
    def initialize
        @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end
    WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Left column
  [1,4,7], # Middle column
  [2,5,8], # Right column
  [0,4,8], #left diagonal
  [2,4,6] # right diagonal
]
    def display_board
        puts " #{board[0]} | #{board[1]} | #{board[2]} "
        puts "-----------"
        puts " #{board[3]} | #{board[4]} | #{board[5]} "
        puts "-----------"
        puts " #{board[6]} | #{board[7]} | #{board[8]} "
    end
    def input_to_index(user_input)
        user_input.to_i - 1

    end
    def move(index, players_token = X)
        board[index] = players_token

    end
    def position_taken?(index)
        if (board[index] == " ") #|| (board[index] == "") || (board[index] == nil)
            return false 
         else
            return true
         end

    end
    def valid_move?(index)
        if !position_taken?(index) && index < 9 
            true
        else 
            false
        end
    end
    
    def turn_count
        counter = 0
        board.each do |t| 
            if t == "X"||t=="O"
                counter += 1
            end
        end
        counter
    end
    def current_player
        turn_count % 2==0 ?  "X" : "O"
    end
    def turn
        puts "Please enter 1-9"
        input = gets.strip
        index = input_to_index(input)
        if valid_move?(index)
            token = current_player
            move(index,token)
        else
            turn
        end
        display_board
    end

    def won?
        WIN_COMBINATIONS.any? do |combo|
            if position_taken?(combo[0]) && @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
                return combo
            end
        end
    end
    def full?

    end
    def draw?
    end
    def over?
    end
    def winner
    end
    def play
    end
end