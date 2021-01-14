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
end 