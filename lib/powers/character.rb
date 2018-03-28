module Powers
  class Character
    attr_accessor :name, :source
    def initialize(&block)
      @stories = []
      instance_eval(&block) 
    end
    
    def story(name,&block)
      story = Story.new
      story.name = name
      @stories.push story
      block.call(@stories.last)
    end

    def import(name,s)
      s.classes = @stories.find {|a| a.name == name}.classes.map {|e| e.dup}
    end

    def cur_story
      @stories.last
    end

    def prev_story
      @stories[@stories.length-1]
    end

    def total_level(story) 
      story = @stories.find {|a| a.name == story }
      story.total_level 
    end

  end
end

  
