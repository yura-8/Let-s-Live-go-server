# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Song.create!(title:'aaa',lyrics:'AAaa',songer:'aaaaaaA')
Song.create!(title:'BB',lyrics:'bbbbbbbbbb',songer:'Bb')
Song.create!(title:'cccc',lyrics:'CCCC',songer:'Cc')

Board.create!(song_id: 1, username: 'x', post: 'こんにちは')
Board.create!(song_id: 1, username: 'y', post: 'おはよう')
Board.create!(song_id: 2, username: 'i', post: 'あいうえお')
Board.create!(song_id: 2, username: 'j', post: 'かきくけこ')