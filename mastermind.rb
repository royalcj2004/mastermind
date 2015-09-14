require "colorize"


class Messages

  def self.mastermind_welcome
    puts "WELCOME TO THE MASTERMIND GAME. \n\n\n"
  end

  def self.mastermind_instructions
    puts "Enter a sequence of 4 colours containing the generated colors e.g RYBG or YGRB.\nIf you enter fewer than 4 or more than 4 colors, you would recieve an error message. \n\n\n\n"
  end

  def self.mastermind_background
    puts "THIS IS THE BACKGROUND OF THE GAME.THIS IS THE BACKGROUND OF THE GAME.THIS IS THE BACKGROUND OF THE GAME.THIS IS THE BACKGROUND OF THE GAME.THIS IS THE BACKGROUND OF THE GAME.THIS IS THE BACKGROUND OF THE GAME.THIS IS THE BACKGROUND OF THE GAME.\n\n\n\n"
  end

  def self.mastermind_not_same_length
    "Enter the correct number of letters."
    
  end

  def self.mastermind_no_match
      "There are no matches. Try again"
  end




end




class Evaluator

  def initialize (secret_code, guess)
    @secret_code = secret_code
    @guess = guess
  end

  def self.compare

    matched = 0
    partial = 0
    matched_array = []
    partial_array_comp = []
    partial_array_user = []
  
    combined = @secret_code.zip(@guess)
  
    combined.each do |one_combination|
      if one_combination[0] == one_combination[1]
        matched += 1
        matched_array << one_combination
      else
        partial += 1
        partial_array_comp << one_combination[0]
        partial_array_user << one_combination[1]
      end
    end


    
    
    




   

    


  end
end





class Game






  def self.compare
    code_choice_array = generate_comp_code
    
    user_choice_array = get_user_guess
    
    if code_choice_array.length != user_choice_array.length
        message =  Messages.mastermind_not_same_length
    else
        message =  Evaluator.compare(code_choice_array, user_choice_array)
    end

    puts message
  end








  

  def self.generate_comp_code
    computer_code = []
    colours = {"R"=>"Red", "Y"=>"Yellow", "G"=>"Green", "B"=>"Blue"}
    code_colours = colours.keys
    (colours.length).times do
        computer_code << code_colours[rand(code_colours.length)].downcase
    end
    computer_code
  end



  def self.intro
    puts "I have generated a beginner sequence with four elements made up of: #{'(r)ed'.red}, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.\n"
  end

  def self.get_user_guess
    puts "What's your guess?"
    user_input_string = gets.chomp
    user_guess_array = user_input_string.downcase.split("")
    user_guess_array
  end



end








class Mastermind
  Messages.mastermind_welcome
  
  loop do
    puts "Enter #{'p'.green} to #{'start the game'.green}, #{'q'.red} to #{'quit the game'.red}, #{'i'.blue} to load #{'instructions'.blue} or #{'b'.yellow} to view #{'backgrounds'.yellow} of the game. "

    start_input = gets.chomp
    
    case start_input
      when "p"
        Game.intro
        Game.compare

      when "i"
        Messages.mastermind_instructions
      when "b"
        Messages.mastermind_background        
      when "q"
        break
      else
        puts "Enter either 'p', 'q', 'b', or 'i'."
    end
  end
end


  
  