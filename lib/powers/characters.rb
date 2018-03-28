module Powers
  class Characters
    attr_reader :characters
    def initialize
      @characters = []
    end

    def load(from)
      Pathname.new(from).children.each do |path|
        puts "Loading file: #{path}"
        file = File.read(path)
        @characters.push eval(file)
      end
    end

    def get_by_name(name)
      @characters.select {|a| a.name == name}
    end


  end
end
