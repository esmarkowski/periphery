module Periphery
    class Resolver

        attr_accessor :default_grammar_path, :modifiers
        @@cache = {}

        def initialize(load_path = 'app/grammars')
            @default_grammar_path ||= load_path
            #TODO: #1 auto load modifiers based on locale
            @modifiers = [Tracery::Modifiers::English, Tracery::Modifiers::Numerical]
        end


        def resolve(type, name = nil)
            grammar = Tracery::Grammar.new({}, modifiers)
            # ['common', name].compact.each do |grammar_name|
                grammar_data = load_grammar(type, name) || {}
                grammar.push(grammar_data)
            # end
            return grammar
        end


        def path_to_grammar(type, name = 'common')
            "#{default_grammar_path}/#{type.to_s.tableize}/#{name.to_s.underscore}.grammar"
        end


        def load_grammar(type, name = 'common')
            path = path_to_grammar(type, name)
            @@cache["#{type}_#{name}"] ||= JSON.parse(File.read(path)) if File.exists?(path)
        end

    end
end
