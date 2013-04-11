# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create [
  {
    name: 'Admin',
    email: 'admin@mail.ru',
    password: 'admin',
    prev: 3,
  },
  {
    name: 'Moderator',
    email: 'moder@mail.ru',
    password: 'moder',
    prev: 2,
  },
  {
    name: 'User',
    email: 'user@mail.ru',
    password: 'user',
    prev: 1,
  }
]

Mediatype.create [
  {
    name: 'Image'
  },
  {
    name: 'Video'
  },
]