# Periphery
Grammar-based demographic generator with details that solidify like a dream.
![image](https://user-images.githubusercontent.com/4501/176780452-9ed83dc2-ec8b-4943-8588-ca17504024f9.png)



## Usage

### Just-In-Time, wave collapse detail generation


<img width="1154" alt="image" src="https://user-images.githubusercontent.com/4501/176720817-f0a4268e-24e8-424b-a838-bffc9295902e.png">


```ruby

  city = City.new(name: "Millgulch", population: 2114)
  #=> { name: "Millgulch",
  #      population: 2114,
  #      temperature: 39,
  #      elevation: 6644,
  #      specialization: [:forestry, :trade],
  #      nearby_resources: [:forest]
  #    }
```

### Populations are defined abstractly and solidified the further down you go. 

<img width="1086" alt="image" src="https://user-images.githubusercontent.com/4501/176726945-69123820-92e8-478a-9235-45fcdcfbde9e.png">

<img width="1052" alt="image" src="https://user-images.githubusercontent.com/4501/176727119-e50dd9ad-991e-4fc5-8fb5-0f4b8ca30b16.png">

```ruby
  citizen = city.citizens.first 
  # Calin is now solidified
  #=> {
  #     "name": "Calin Bumberton",
  #     "race": "human",
  #     "gender": "male",
  #     "age": 37,
  #     "occupation": "farmer"
  #   }
  
  citizen.about
  # => "Calin Bumberton is a 37 year old farmer who tends to apples trees just outside of the city of Millgulch."
  
  citizen.relationships
  # => "Calin lives with his spouse, Cassiel. They've been married for 12 years."
  
  citizen.relationships.spouse
  #=> {
  #     "name": "Cassiel Bumberton",
  #     "race": "human",
  #     "gender": "female",
  #     "age": 33,
  #     "occupation": "farmer"
  #   }
  
  
```

## Grammars
Grammars use a cascading `type`.`specific`.grammar naming convention. For example, to create a set of grammars for race:

```
  lib/
  |-- grammars/
    |-- races/
      |-- races.common.grammar # Default
      |-- races.human.grammar # Human specific details
```


## Models

