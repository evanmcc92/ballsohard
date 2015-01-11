# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create({ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
@sports = ["Football (Soccer)","Cricket","Basketball","Baseball","American Football","Ice Hockey","Rugby","Volleyball","Tennis","Water Sports","Adventure Sports","Badminton","Motor Sports","Golf","Softball","Running","Table Tennis","Field Hockey","Cycling","Winter Sports","Gymnastics","Lacrosse","Boxing","Martial Arts","Other"]
@sports.each { |x| Sports.create(name: x) }