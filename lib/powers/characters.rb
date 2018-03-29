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

    def all
      @characters
    end

    def get(&block)
      @characters.select block
    end
  end
end
