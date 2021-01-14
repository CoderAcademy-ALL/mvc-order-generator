class Group

    def self.create(name)
        path = name.split(" ").map {|word| word.downcase}.join("-") + ".txt"
        File.open("./groups/#{path}", "w") do |file|
            file.write("")
        end
        puts "Created File" 
    end 

    def self.all 
        contents = Dir.entries("./groups").select {|file| file =~ /^.+\.txt/ }
        contents.map do |file_name|
            words = file_name.split("-")
            words[-1].delete_suffix!(".txt")
            words.map! {|word| word.capitalize}
            {name: words.join(" "), path: "./groups/#{file_name}"}
        end 

    end 
    
    attr_reader :name, :file_path, :names_array
    def initialize(name, path)
        @name = name 
        @file_path = path
        @names_array = path_to_array || []
    end
    
    def path_to_array 
        array = File.readlines(@file_path).map {|name| name.strip}
        return array
    end 

    def add_name(name)
       return @names_array.push(name)
    end

    def remove_name(name)
       return @names_array.delete(name)
    end 
     
    def save 
        File.open(@file_path, "w+") do |file|
            file.puts(@names_array)
        end 
    end
    
    def randomise_order
        return @names_array.shuffle
    end 

    def who_am_i
        return self
    end 
end 
















































































