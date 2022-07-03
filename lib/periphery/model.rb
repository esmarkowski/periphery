module Periphery
    class Model
        include Periphery::Attributes
        # @@load_path = ["app/models"]
        attr_accessor :state
        delegate_missing_to :@state



        def initialize(**parameters)
            # @grammar_path ||= "app/grammars"
            # @parameters = parameters
            parameters.each do |key, value|
                send("#{key}=", value)
            end

            @resolver = Periphery::Resolver.new(File.expand_path('../../spec/app/grammars', __dir__))

        end

        def merge_grammar(type, name = 'common')
            @state.push(grammar(type, name).as_json)
        end

        def grammar(type, name = 'common')
            @resolver.resolve(type, name)
        end
        


        def to_table(**options)
            Terminal::Table.new **options
        end
        ## Load common grammars first

    end
end