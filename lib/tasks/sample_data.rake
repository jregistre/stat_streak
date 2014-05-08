namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_microposts
    make_entries
  end
end

def make_users
  admin = User.create!(name:     "Jerel Registre",
                       email:    "jregistre@gmail.com",
                       password: "password",
                       password_confirmation: "password",
                       nick_name: "JFreedom",
                       sex: "Male",
                       start_weight: "285",
                       target_weight: "220",
                       height_ft: "6",
                       height_in: "3",
                       admin: true)
  admin = User.create!(name:     "Tonya Registre",
                       email:    "tonyaday9@gmail.com",
                       password: "password",
                       password_confirmation: "password",
                       nick_name: "Boss",
                       sex: "Female",
                       start_weight: "120",
                       target_weight: "115",
                       height_ft: "5",
                       height_in: "3",
                       admin: false)
end

def make_microposts
  users = User.all(limit: 6)
  5.times do
    content = Faker::Lorem.sentence(5)
    users.each { |user| user.microposts.create!(content: content) }
  end
end

def make_entries
  users = User.all(limit: 6)
  5.times do
    weight = 200
    users.each { |user| user.microposts.create!(weight: weight) }
  end
end