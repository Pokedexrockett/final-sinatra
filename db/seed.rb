User.create!(email: "test@test.com", username: "test")
Strain.create!(name: "first strain", date: "2021-03-18", form: "joint", thc: 19.2, cbd: .03, review: "alright", user_id: 1)
Strain.create!(name: "second strain", date: "2021-03-18", form: "bowl", thc: 17.5, cbd: .02, review: "okay",, user_id: 1)