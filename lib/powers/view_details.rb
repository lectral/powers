module Powers
  class ViewDetails
    include ActionView::Helpers::NumberHelper
    HEADINGS = %w[class type level gain hgain].freeze
    def initialize(result)
      @data = result
    end

    def print
      @data.each do |char|
        puts "=== #{char.name} ==="
        char.stories.each do |story|
          print_story(story)
        end
        puts "\n"
      end
    end

    def print_story(story)
      title = "#{story.name} (#{story.total_level} lvl)"
      story_a = story.to_a
      story_a.map do |a|
        a[0] = a[0]
        a[4] = number_to_human(a[3])
        a[3] = number_with_delimiter(a[3], :delimiter => " ")
      end
      rows = story_a 
      rows << :separator
      rows << ['Sum', '', story.total_level, 
               number_with_delimiter(story.total_gain, :delimiter => " "),
               number_to_human(story.total_gain)]
      puts table(title, rows)
    end

    def table(title, rows)
      Terminal::Table.new headings: HEADINGS,
        rows:  rows,
        title: title
    end
  end
end
