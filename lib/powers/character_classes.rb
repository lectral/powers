module Powers
  class CharacterClasses
    include Singleton
    def initialize
      @classes = []
    end

    def load(path)
      Pathname.new(path).children.each do |path|
        puts "Loading file: #{path}"
        file = File.read(path)
        @classes.push eval(file)
      end
    end

    def get(name)
      @classes.find { |a| a.name == name }
    end

    private
  end
end
