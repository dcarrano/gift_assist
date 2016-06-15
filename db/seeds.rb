# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

charlie_brown = User.create(username: "charliebrown", email: "charliebrown@peanuts.com", password: "goodgrief", password_confirmation: "goodgrief")
christmas = Event.create(title: "Christmas", date: DateTime.new(2016, 12, 25), description: "white, sometimes")
linus_birthday = Event.create(title: "Linus' Birthday", date: DateTime.new(2016, 9, 19), description: "big day for Linus")
lucy_birthday = Event.create(title: "Lucy's Birthday", date: DateTime.new(2016, 6, 24), description: "big day for Lucy")
linus = Recipient.create(name: "Linus", relationship: "friend")
lucy = Recipient.create(name: "Lucy", relationship: "frenemy")
blanket = Gift.create(name: "blanket", url: "http://amzn.to/1OqTnmU", price: 24.99, priority: 1)
robot = Gift.create(name: "robot", url: "http://amzn.to/1OqTor7", price: 50.99, priority: 5)
bible = Gift.create(name: "Bible", url: "http://amzn.to/24Rw2wL", price: 11.69, priority: 3)
toy_piano = Gift.create(name: "toy piano", url: "http://amzn.to/24Rwn2x", price: 14.95, priority: 4)
crab = Gift.create(name: "crab", url: "http://amzn.to/1Q5T15M", price: 9.99, priority: 4)
rolling_pin = Gift.create(name: "rolling pin", url: "http://amzn.to/1YsF43m", price: 7.27, priority: 3)
coal = Gift.create(name: "coal", url: "http://amzn.to/21ncI9W", price: 12.99, priority: 1)
freud_book = Gift.create(name: "Freud book", url: "http://amzn.to/1tx1Hsi", price: 7.84, priority: 2)

charlie_brown.events << christmas
charlie_brown.events << linus_birthday
charlie_brown.events << lucy_birthday
charlie_brown.recipients << lucy
charlie_brown.recipients << linus

linus.events << linus_birthday
linus.events << christmas
lucy.events << lucy_birthday
lucy.events << christmas

blanket.event = linus_birthday
robot.event = linus_birthday
bible.event = christmas
crab.event = lucy_birthday
rolling_pin.event = lucy_birthday
coal.event = christmas

blanket.recipient = linus
robot.recipient = linus
bible.recipient = linus
toy_piano.recipient = linus
crab.recipient = lucy
rolling_pin.recipient = lucy
coal.recipient = lucy
freud_book.recipient = lucy

blanket.save
robot.save
bible.save
toy_piano.save
crab.save
rolling_pin.save
coal.save
freud_book.save
