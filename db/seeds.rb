# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


DATA = {
  :tutor_keys =>
    ["name", "email", "subject", "bio"],
  :tutors => [
    ["Darth Vader", "vader@example.com", "History", "Come to the dark side."],
    ["Princess Leia", "leia@example.com", "Government", "Not so helpless princess."],
    ["Luke Skywalker", "luke@example.com", "Technology", "Even a whiner can be a hero."],
    ["Chewbacca", "chewy@example.com", "Foreign Languages", "Sasquatch ain't got nothing on me."],
    ["Obi-Wan Kenobi", "aka.ben@example.com", "Science", "Jedi master to legends."],
    ["Han Solo", "solo@example.com", "Geography", "Smuggler turned hero."],
    ["C3P0", "golden@example.com", "Math", "I overanalyze everything."],
    ["Yoda", "yoda@example.com", "English", "Good at language am I"]
  ]
}

def make_tutors
  DATA[:tutors].each do |tutor|
    new_tutor = Tutor.new
    tutor.each_with_index do |attribute, i|
      new_tutor.send(DATA[:tutor_keys][i]+"=", attribute)
    end
    new_tutor.save
  end
end

make_tutors
