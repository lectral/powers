module Powers
  class Story
    attr_accessor :name, :classes, :level
    def initialize
      @classes = []
    end

    def class(name, level, type = :set)
      c = find_or_create(name)
      if type == :set
        c.level = level
      elsif type == :+
        c.level += level
      end
    end

    def total_level
      @classes.sum(&:level)
    end

    def total_gain
      @classes.sum(&:tgain)
    end

    def to_a
      @classes.map(&:to_a)
    end

    def find_or_create(name)
      c = @classes.find { |a| a.name == name }
      if c.nil?
        a = CharacterClasses.instance.get(name).dup
        raise 'Failed to find class' if a.nil?
        @classes.push(a).last
      else
        c
      end
    end
  end
end
