module Powers
  class CharacterClass
    attr_accessor :level, :name, :type
    def initialize
      yield(self)
      @level = 0
    end

    def gain(&block)
      @gain = block
    end

    def to_a
      [@name, @type, @level, tgain]
    end

    def tgain
      instance_eval(&@gain)
    end
  end
end
