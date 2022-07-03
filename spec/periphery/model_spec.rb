RSpec.describe "Model", type: :model do

    class Citizen < Periphery::Model

        attribute :age, :race, :gender

        def initialize(**parameters) 
            super(parameters)
        end

    end


    let(:model) { Citizen.new }

    context "model" do


        it 'generates with parameters' do
            citizen = Citizen.new(age: 32, race: :human, gender: :male )
            expect(citizen.age).to eq 32
        end
            

    end
end