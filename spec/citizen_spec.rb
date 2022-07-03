RSpec.describe "Character" do


    class Character < Periphery::Model
        def initialize(**parameters)
            super(**parameters)
            @state = grammar(:races)
            @state.setRace!
            @state.setStats!
            merge_grammar(:races, self.race!)
            @state.birth!
            @state.setAppearance!
        end

        def ability_scores
            collect_attributes(:strength!, :dexterity!, :constitution!, :intelligence!, :wisdom!, :charisma!, :agility!, :luck!)
        end

        def appearance
            collect_attributes(:hair_color!, :hair_length!, :hair_style!, :eye_color!, :height!, :weight!, :complexion!, :build!)
        end

        def character_sheet
            table_width = 120
            summary = collect_attributes(:age!, :race!, :gender!, :occupation!, :personality, :supports)
            info = self.to_table(title: self.name!, headings: summary.keys, rows: [summary.values], style: {width: table_width} )
            abilities = self.to_table(title: "Ability Scores", headings: self.ability_scores.keys, rows: [self.ability_scores.values], style: {width: table_width})
            background = collect_attributes(:events, join_arrays: false)
            history = self.to_table(title: "History", headings: background.keys.uniq, rows: background.values.transpose, style: {width: table_width})

            [info, abilities, history]
        end

        protected

        def collect_attributes(*attrs, join_arrays: true)
            attrs.inject({}) do |memo, key| 
                value = self.send("#{key}".to_sym)
                memo[key.to_s.gsub(/!$/,'')] = (value.is_a?(Array) && join_arrays) ? value.join(', ') : value
                memo 
            end
        end

    end

    let(:character) { Character.new }

    context "model" do

        it  'builds a random character' do
            rows = 105.times.map do 
                npc = Character.new
                state = npc.state.flatten("#name#, #age#, #race.capitalize#, #gender_sign#, #occupation#").split(',')
                state.push(npc.personality.join(', '))
                state.push([npc.supports!, npc.supports].flatten.uniq.join(', ')) #.join(', '))
                state.push(npc.events.uniq.map(&:capitalize).join(", "))
            end

            puts Terminal::Table.new title: "Characters", headings: ['Name', 'Age', 'Race', 'Gender', 'Occupation', 'Personality', 'Factions', 'History'], rows: rows

        end

        it 'builds stats' do

            [:strength!, :dexterity!, :constitution!, :intelligence!, :wisdom!, :charisma!, :agility!, :luck!].each do |ability_score|
                expect(character.send("#{ability_score}".to_sym)).to be_present
            end
            # puts Terminal::Table.new title: "Stats", headings: ['Name', 'Age', 'Race', 'Strength', 'Dexterity', 'Constitution', 'Intelligence', 'Wisdom', 'Charisma', 'Agility', 'Luck'], rows: characters
        end
        
        it 'builds appearance' do
            # character.state.flatten("#name#, #age#, #gender_sign#, #race#, #hair_color#, #hair_length#, #hair_style#, #eye_color#, #height#, #weight#, #complexion#, #build#").split(',')

            [:hair_color, :hair_length, :hair_style, :eye_color, :height, :weight, :complexion, :build].each do |attribute|
                expect(character.send("#{attribute}!".to_sym)).to be_present
            end
            # puts Terminal::Table.new title: "Appearance", headings: ['Name', 'Age', 'Gender', 'Race', "Hair Color", "Hair Length", "Hair Style", "Eye Color", "Height", "Weight", "Complexion", "Build" ], rows: characters
        end

        it 'applies race ability score modifiers' do
            dex = character.dexterity!
            dex_mod = character.flatten("[dexterity:SET#dexterity.add(2)#]#dexterity#")
            expect(dex_mod.to_i).to eq(dex.to_i + 2)
        end

        context 'table' do
            it 'returns a table' do
                table = character.to_table(title: "#{character.name!}\nAbility Scores", headings: character.ability_scores.keys, rows: [character.ability_scores.values])
                expect(table).to be_a(Terminal::Table)
            end

            it 'displays character sheet' do
                sheet = character.character_sheet
               
                expect(sheet).to be_a(Array)
                sheet.each do |table|
                    expect(table).to be_a(Terminal::Table)
                end
                puts sheet 
            end
        end

        context 'grammars' do

            it 'merges grammars' do
            end



        end

    end

end

