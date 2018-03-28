module Powers

  class App
    def initialize
    end

    def run
      a = CharacterClasses.instance
      a.load("classes/")

      b = Characters.new
      b.load("characters/")
      pp b.get_by_name("Vegeta").first.total_level("Sayian Saga")
      pp b.get_by_name("Vegeta").first.total_level("Namek Saga")
      
    end

  end

end
