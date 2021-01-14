require_relative 'group_model'
require_relative 'group_view'

class GroupController

    def initialize
        @model = nil 
        @view = GroupView.new 
        @groups = Group.all 
    end
    
    def select_group 
        choice = @view.menu_selection("Please select a group: ", @groups)
        selected_group = @groups.find {|group| group[:name] == choice}
        @model = Group.new(selected_group[:name], selected_group[:path])
        puts @model
    end 

    def group_menu 
        options = {
            "Display Random Order" => 1,
            "Add a Member" => 2,
            "Remove a Member" => 3,
            "Save" => 4, 
            "Go Back" => 5
        }
        
        while true 
            choice = @view.menu_selection("Please Choose:", options)
            case choice 
            when 1 
                puts "Display group"
            when 2 
                puts "Add Member"
            when 3
                puts "Remove Member"
            when 4 
                puts "Save"
            when 5 
                break
            end
        end 
    end 

    def main_menu
        options = {
            "Create a group" => 1,
            "Select a group" => 2,
            "Quit" => 3
        } 
        while true 
            choice = @view.menu_selection("What would you like to do?", options)
            case choice 
            when 1 
                puts "Create a Group"
            when 2
                select_group
            when 3 
                puts "goodbye"
                break 
            end 
        end 
    end 
end

controller = GroupController.new 
controller.main_menu