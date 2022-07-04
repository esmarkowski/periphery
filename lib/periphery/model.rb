module Periphery
    class Model
        include Periphery::Attributes
        # @@load_path = ["app/models"]
        @@load_path = ''
        mattr_accessor :load_path
        attr_accessor :state
        delegate_missing_to :@state



        def initialize(**parameters)
            # @grammar_path ||= "app/grammars"
            # @parameters = parameters
            parameters.each do |key, value|
                send("#{key}=", value)
            end

            @resolver = Periphery::Resolver.new(File.expand_path(@@load_path, __dir__))
            load_world_data!
        end

        def merge_grammar(type, name = 'common')
            @state.push(load_grammar(type, name).as_json)
        end

        def load_grammar(type, name = 'common')
            @resolver.resolve(type, name)
        end
        
        def load_world_data!(type = :world)
            @state ||= load_grammar(type)

            Dir.glob("#{File.expand_path(@@load_path, __dir__)}/#{type.to_s.tableize}/**/*.grammar").map { |d| File.basename(d, '.*') }.each do |grammar_name|
                merge_grammar(type, grammar_name)
            end
        end

        def to_table(**options)
            Terminal::Table.new **options
        end
        ## Load common grammars first

    end
end