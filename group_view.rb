require 'tty-prompt'
require 'artii'

class GroupView 
    def initialize
        @prompt = TTY::Prompt.new
        @art = Artii::Base.new
    end
    
    def menu_selection(question, choices)
        choice = @prompt.select(question, choices)
        return choice
    end
    
    def display_random_group(group)
        group.each do |member|
            puts "..."
            sleep(0.5)
            puts member
        end
    end
    
    def input_name 
        @prompt.ask("Please enter a name: ") do |q| 
            q.required true 
            q.modify :capitalize
        end 
    end

    def display_group_name(input)
        system "clear"
        puts "You have selected:"
        p "."
        sleep(0.2)
        p "."
        sleep(0.2)
        p "."
        sleep(0.2)
        puts @art.asciify(input)
    end 
    
    def display_member_message(length)
        if length == 1 
            puts "There is one member in the group"
        elsif length == 0 
            puts "There are no members in the group"
        else 
            puts "There are #{length} members in the group"
        end 
    end
    
    def input_group_name
        @prompt.ask("Please enter group name:") do |q|
            q.required true 
        end 
    end
end 