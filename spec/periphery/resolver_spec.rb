RSpec.describe "Resolver", type: :model do

    let(:resolver) { Periphery::Resolver.new(File.expand_path('../app/grammars', __dir__)) }

    context "resolver" do

        context 'grammars' do

            it 'has grammar path' do
                expect(resolver.default_grammar_path).to include("app/grammars")
            end

            it 'can set grammar path' do
                resolver.default_grammar_path = "custom/grammars"
                expect(resolver.default_grammar_path).to include("custom/grammars")
            end

            # {type}/common.grammar || {type}.common.grammar
            # {type}/{specific}.grammar
            it 'builds common grammar path' do
                common_grammar = resolver.path_to_grammar(:race)
                expect(common_grammar).to include("app/grammars/races/common.grammar")
            end

            it 'builds specific grammar path' do
                grammar = resolver.path_to_grammar(:race, :human)
                expect(grammar).to include("app/grammars/races/human.grammar")
            end

            it 'merges grammars' do
                grammar = resolver.resolve(:events, :human)
                expect(grammar.symbols[:sickness]).to include('#humanDisease#')
            end

        end

    end
end