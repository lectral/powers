module Powers
  class Story
    attr_accessor :name,:classes,:level
    def initialize
      @classes = []
    end

    def class(name,level,type=:set)
      c = find_or_create(name)
      if(type == :set)
        c.level = level
      elsif(type == :+)
        c.level += level
      end
    end

    def total_level
      @classes.sum(&:level)
    end

    def find_or_create(name)
      c = @classes.find {|a| a.name == name}
      if(c.nil?)
        a = CharacterClasses.instance.get(name).dup
        if(a.nil?)
          raise "Failed to find class"
        end
        @classes.push(a).last
      else
        c
      end
    end
  end

end
