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

Character Generation

```ruby
+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
|                                                                                                  Characters                                                                                                   |
+-----------------------+------+--------+--------+------------------+----------------------+-------------------------+------------------------------------------------------------------------------------------+
| Name                  | Age  | Race   | Gender | Occupation       | Personality          | Factions                | History                                                                                  |
+-----------------------+------+--------+--------+------------------+----------------------+-------------------------+------------------------------------------------------------------------------------------+
| Petronelle Bungay     |  77  |  Human |  ♀     |  Mercer          | sad, aloof           | minotaurs               | Donated 172 gold coins to rid the world of kobolds, Sick with malaria, Burns on her shin |
| Gnaddle Claimjes      |  80  |  Gnome |  ♀     |  Cheesemaker     | bitter, perverted    | Society of Cheesemakers | Affinity for skeletons, Sick with diphtheria, Scars on her cheek                         |
| Nilnass Smileddnass   |  79  |  Gnome |  ♀     |  Chemist         | haughty, cautious    | rats                    | Found chainmail breastplate, Greedy, Close encounter with a fairy                        |
| Durimoudeth Bilgabar  |  194 |  Dwarf |  ♀     |  Zookeeper       | bitter, close-minded | the temple              | Sick with diphtheria, Found 59 copper coins, Burns on her bicep                          |
| Hamalitia Phikalyn    |  523 |  Elf   |  ♀     |  Merchant        | humorous, cautious   | Society of Merchants    | Affinity for fairies, Adept at conjuration, Close encounter with a fairy                 |
| Durrout Tumunzar      |  236 |  Dwarf |  ♂     |  Roofer/Thatcher | gloomy, close-minded | dwarfkind               | Burns on his cheek, Sick with malaria, Adept at staying out of sight                     |
| Taanogbem Gnimwem     |  154 |  Gnome |  ♀     |  Illuminator     | bitter, aloof        | the temple              | Master at herbalist, Scars on her bicep, Adept at administration                         |
| Ettrian Phikalyn      |  236 |  Elf   |  ♂     |  Banker          | angry, rational      | humans                  | Is addicted to alcohol, Sick with smallpox, Adept at engineering                         |
| Knanamtort Klafansnen |  312 |  Gnome |  ♂     |  Botanist        | joyful, carefree     | Society of Botanists    | Close encounter with a half orc, Committed theft, Affinity for kobolds                   |
| Lavinia Newbury       |  82  |  Human |  ♀     |  Illuminator     | depressed, cautious  | Illuminator's union     | Affinity for vampires, Donated bread to trolls, Close encounter with a fairy             |
+-----------------------+------+--------+--------+------------------+----------------------+-------------------------+------------------------------------------------------------------------------------------+
```

### Character Sheets

```ruby

+----------------------------------------------------------------------------------------------------------------------+
|                                                   Freya Coleshill                                                    |
+-------------------+-------------------+-------------------+-------------------+-------------------+------------------+
| age               | race              | gender            | occupation        | personality       | supports         |
+-------------------+-------------------+-------------------+-------------------+-------------------+------------------+
| 90                | human             | female            | Banker            | sad, dismissive   |                  |
+-------------------+-------------------+-------------------+-------------------+-------------------+------------------+
+----------------------------------------------------------------------------------------------------------------------+
|                                                    Ability Scores                                                    |
+--------------+--------------+--------------+--------------+--------------+--------------+--------------+-------------+
| strength     | dexterity    | constitution | intelligence | wisdom       | charisma     | agility      | luck        |
+--------------+--------------+--------------+--------------+--------------+--------------+--------------+-------------+
| 18           | 17           | 18           | 18           | 9            | 17           | 17           | 6           |
+--------------+--------------+--------------+--------------+--------------+--------------+--------------+-------------+
+----------------------------------------------------------------------------------------------------------------------+
|                                                      Appearance                                                      |
+--------------+--------------+--------------+--------------+--------------+--------------+--------------+-------------+
| hair_color   | hair_length  | hair_style   | eye_color    | height       | weight       | complexion   | build       |
+--------------+--------------+--------------+--------------+--------------+--------------+--------------+-------------+
| brown        | long         | straight     | hazel        | 155          | 84           | brown        | average     |
+--------------+--------------+--------------+--------------+--------------+--------------+--------------+-------------+
+----------------------------------------------------------------------------------------------------------------------+
|                                                       History                                                        |
+----------------------------------------------------------------------------------------------------------------------+
| events                                                                                                               |
+----------------------------------------------------------------------------------------------------------------------+
| Is Cursed With Weakness                                                                                              |
| Prideful                                                                                                             |
| Burns On Her Bicep                                                                                                   |
+----------------------------------------------------------------------------------------------------------------------+

```
