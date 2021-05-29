# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
test_board = Board.new(title: 'test')
test_board.save

q1 = Question.new
q1.text = 'This is a test question. Is there something you need to know?'
q1.board = test_board
q1.save
