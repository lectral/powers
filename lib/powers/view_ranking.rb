module Powers
  class ViewRanking
    include ActionView::Helpers::NumberHelper
    HEADINGS = %w[name source story lvl bp bph].freeze
    def initialize(result)
      @data = result
    end

    def print
      to_print = []
      @data.each do |char|
        char.stories.each do |story|
          to_print.push [char.name,char.source,story.name,story.total_level,story.total_gain]
        end
      end
      to_print = to_print.sort_by {|a| a[4] }.reverse
      to_print.map do |a| 
        a[5] = number_to_human(a[4])
        a[4] = number_with_delimiter(a[4], :delimiter => " ")
      end
      print_ranking to_print
    end

    def print_ranking to_print
      title = "Ranking"
      puts table(title, to_print) 
    end

    def table(title, rows)
      Terminal::Table.new headings: HEADINGS,
                          rows:  rows,
                          title: title
    end
  end
end
