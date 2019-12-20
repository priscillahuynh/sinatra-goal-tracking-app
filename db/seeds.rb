cilla = User.create(name: "Cilla", email: "cilla@flatiron.com", password: "password")
allen = User.create(name: "Allen", email: "allen@flatiron.com", password: "badpassword")


Goal.create(title: "Educational", description: "Read one book a week", user_id: cilla.id)

allen_goal = allen.goals.build(title: "Health", description: "Exercise 5 days a week")
allen_goal.save #.build method provides a foreign key but does not save to database(similar to .new)

cilla.goals.create(title: "Spiritual", description: "Meditate 20 min a day")