# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

firstUser = User.create({ nickname: 'lesserevil', mail: 'lesser@evil.com', password: 'WhichOneToChoose' })

Category.create({ title: 'General' })

Test.create({ title: 'The very first test', level: 1, category_id: 1, user_id: 1 })

Question.create({ title: 'Which do you choose?', test_id: 1 })
Answer.create({ title: 'Lesser', correct: false, question_id: 1 })
Answer.create({ title: 'Bigger', correct: false, question_id: 1 })
Answer.create({ title: 'Prefer not to choose at all', correct: true, question_id: 1 })

Question.create({ title: 'Is cat alive?', test_id: 1 })
Answer.create({ title: 'Yes', correct: false, question_id: 2 })
Answer.create({ title: 'No', correct: false, question_id: 2 })
Answer.create({ title: 'I\'m not sure', correct: true, question_id: 2 })

Category.create({ title: 'Music' })
Test.create({ title: 'Test about Led Zeppelin!', level: 2, category_id: 2, user_id: 1 })

Question.create({ title: 'What is pictured on the cover of the "Led Zeppelin IV" album?', test_id: 2 })
Answer.create({ title: 'A young hunter', correct: false, question_id: 3 })
Answer.create({ title: 'A purple lion', correct: false, question_id: 3 })
Answer.create({ title: 'An old countryman', correct: true, question_id: 3 })

puts "Titles of tests of General category: #{Test.sortedTestsNamesOfCategory('General')}"
puts "Titles of tests of Music category: #{Test.sortedTestsNamesOfCategory('Music')}"

UserPassedTest.create({ test_id: 1, user_id: 1 })
UserPassedTest.create({ test_id: 2, user_id: 1 })

# Можно сменить level на 2, тогда будет выеден другой тест
level = 1
puts "User #{firstUser.nickname} completed level #{level} tests: #{firstUser.completedTestsOfLevel(level)}"
