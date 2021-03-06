require "pry"

class Owner
attr_accessor :name, :pets
attr_reader :species

@@all = []

def initialize(name)
  @name = name
  @species = "human"
  @pets = {:fishes => [], :dogs => [], :cats => []}
  @@all << self
end

def buy_fish(name)
  @pets[:fishes] << Fish.new(name)
end

def buy_cat(name)
  @pets[:cats] << Cat.new(name)
end

def buy_dog(name)
  @pets[:dogs] << Dog.new(name)
end

def walk_dogs
  @pets[:dogs].map do |dog|
    dog.mood = "happy"
  end
end

def play_with_cats
  @pets[:cats].map do |cat|
    cat.mood = "happy"
  end
end

def feed_fish
  @pets[:fishes].map do |fish|
    fish.mood = "happy"
  end
end

def sell_pets
  @pets.each_value do |animal_array|
      animal_array.map do |animal|
        animal.mood = "nervous"
    end
    animal_array.clear
  end
end

def self.all
  @@all
end

def self.count
  @@all.count
end

def self.reset_all
  @@all.clear
end

def say_species
  "I am a #{@species}."
end

def list_pets

  "I have #{@pets[:fishes].count} fish, #{@pets[:dogs].count} dog(s), and #{@pets[:cats].count} cat(s)."
end

end
