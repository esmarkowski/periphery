module Periphery
    module Attributes
        extend ActiveSupport::Concern

        class_methods do
            def attribute(*names)

                @@attributes ||= []
                names.each do |method_name|
                    @@attributes << method_name.to_sym

                    inst_variable_name = "@#{method_name}".to_sym

                    # @grammars[__method__] ||= Tracery::Grammar.from_json("#{grammar_path}/races/races.#{@parameters[__method__]}.grammar", modifiers)
                    # @parameters[__method__] ||= @grammars[__method__].flatten("#race#")

                    define_method method_name do
                        if @grammars[__method__].blank?
                             #Tracery::Grammar.from_json("#{grammar_path}/races/races.#{@parameters[__method__]}.grammar", modifiers)
                            @grammars[__method__] = self.send("#{method_name}=",  @resolver.resolve(__method__).flatten("##{__method__}#"))
                        end
                        instance_variable_get inst_variable_name
                    end

                    define_method "#{method_name}=" do |new_value|
                        instance_variable_set inst_variable_name, new_value
                    end
                end
            end
        end
    end
end