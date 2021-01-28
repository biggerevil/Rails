# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or create!d alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create!([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create!(name: 'Luke', movie: movies.first)

first_user = User.create!({ nickname: 'lesserevil', mail: 'lesser@evil.com', password: 'WhichOneToChoose' })

general_category = Category.create!({ title: 'General' })

first_test = Test.create!({ title: 'The very first test', level: 1, category: general_category, author: first_user })

first_question = Question.create!({ title: 'Which do you choose?', test: first_test })
Answer.create!([
  { title: 'Lesser', correct: false, question: first_question },
  { title: 'Bigger', correct: false, question: first_question },
  { title: 'Prefer not to choose at all', correct: true, question: first_question }
])

second_question = Question.create!({ title: 'Is cat alive?', test: first_test })
Answer.create!([
  { title: 'Yes', correct: false, question: second_question },
  { title: 'No', correct: false, question: second_question },
  { title: 'I\'m not sure', correct: true, question: second_question }
  ])


second_user = User.create!({ nickname: 'Second boy', mail: 'second@hand.com', password: 'secondman' })

music_category = Category.create!({ title: 'Music' })
second_test = Test.create!({ title: 'Test about Led Zeppelin!', level: 2, category: music_category, author: second_user })

third_question = Question.create!({ title: 'What is pictured on the cover of the "Led Zeppelin IV" album?', test: second_test })
Answer.create!([
  { title: 'A young hunter', correct: false, question: third_question },
  { title: 'A purple lion', correct: false, question: third_question },
  { title: 'An old countryman', correct: true, question: third_question }
  ])

puts "Titles of tests of General category: #{Test.sorted_tests_names_of_category('General')}"
puts "Titles of tests of Music category: #{Test.sorted_tests_names_of_category('Music')}"

# Для tests_users:
first_user.tests.push(first_test)
first_user.tests.push(second_test)

# Можно сменить level на 2, тогда будет выведен другой тест
level = 1
puts "User #{first_user.nickname} completed level #{level} tests: #{first_user.completed_tests_of_level(level).inspect}"
