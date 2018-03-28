module Powers
  class CharacterClass
    attr_accessor :level,:name,:type
    def initialize()
      yield(self)
      @level = 0
    end

    def gain(&block)
      @gain = block
    end

    def tgain
      @gain.call
    end
   
  end

end
