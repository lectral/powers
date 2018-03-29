module Powers
  class App
    def initialize
      c = CharacterClasses.instance
      c.load('classes/')
      @characters = Characters.new
      @characters.load('characters/')
    end

    def run
      opts = {}
      OptionParser.new do |o|
        o.on('-n', '--name NAME') do |n|
          opts[:name] = n
        end
        o.on('-s', '--source NAME') do |n|
          opts[:source] = n
        end

        o.on('-t', '--story NAME') do |n|
          opts[:story] = n
        end

        o.on('-r', '--ranking') do |_n|
          opts[:view] = :ranking
        end

        o.on('-d', '--details') do |_n|
          opts[:view] = :details
        end
      end.parse!
      result = find(opts)
      print(opts[:view], result)
    end

    def find(opts)
      result = @characters.all
      result = result.select { |c| c.name == opts[:name] } if opts[:name]
      result = result.select { |c| c.source == opts[:source] } if opts[:source]
      result
    end

    def print(view, result)
      ViewDetails.new(result).print if view == :details
    end
  end
end
