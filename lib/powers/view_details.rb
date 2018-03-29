module Powers
  class ViewDetails
    HEADINGS = %w[class type level gain].freeze
    def initialize(result)
      @data = result
    end

    def print
      @data.each do |char|
        char.stories.each do |story|
          print_story(story)
        end
      end
    end

    def print_story(story)
      title = "#{story.name} (#{story.total_level} lvl)"
      rows = story.to_a
      rows << :separator
      rows << ['Sum', '', story.total_level, story.total_gain]
      puts table(title, rows)
    end

    def table(title, rows)
      Terminal::Table.new headings: HEADINGS,
                          rows:  rows,
                          title: title
    end
  end
end
