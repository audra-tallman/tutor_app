# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# :username, :name, :email, :password, :admin, :provider, :uid)

User.create(id: '1', name: 'Audra', email: 'audra@example.com', password: 'testing', admin: true, provider: 'null', uid:  'null')

DATA = {
  :tutor_keys =>
    ["name", "gender", "email", "subject", "bio"],
  :tutors => [
    ["Darth Vader", "male", "vader@example.com", "History", "Come to the dark side."],
    ["Princess Leia", "female", "leia@example.com", "Government", "Not so helpless princess."],
    ["Luke Skywalker", "male", "luke@example.com", "Technology", "Even a whiner can be a hero."],
    ["Chewbacca", "male", "chewy@example.com", "Languages", "Sasquatch ain't got nothing on me."],
    ["Obi-Wan Kenobi", "male", "aka.ben@example.com", "Science", "Jedi master to legends."],
    ["Han Solo", "male", "solo@example.com", "Geography", "Smuggler turned hero."],
    ["C3P0", "male", "golden@example.com", "Math", "I overanalyze everything."],
    ["Yoda", "male", "yoda@example.com", "English", "Good at language I am"]
  ],
  :subject_keys =>
    ["name", "user_id", "tutor_id"],
  :subjects => [
    ["History", 1, 1],
    ["Government", 1, 2],
    ["Technology", 1, 3],
    ["Foreign Languages", 1, 4],
    ["Science", 1, 5],
    ["Geography", 1, 6],
    ["Math", 1, 7],
    ["English", 1, 8]
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

def make_subjects
  DATA[:subjects].each do |subject|
    new_subject = Subject.new
    subject.each_with_index do |attribute, i|
      new_subject.send(DATA[:subject_keys][i]+"=", attribute)
    end
    new_subject.save
  end
end

make_tutors
make_subjects
