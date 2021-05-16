# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
20.times do |n|
    Customer.create!(
      email: "test#{n + 1}@test.com",
      first_name: "名#{n + 1}",
      last_name: "姓#{n + 1}",
      kana_first_name: "セイ",
      kana_last_name: "メイ",
      password: "123456",
      postal_code: "1234567",
      address: "東京都渋谷区神南1丁目19-11 パークウェースクエア2 4階#{n + 1}",
      phone_number: "09012345678"
    )
end

  Admin.create!(
    email: "admin@admin",
    password: "adminadmin"
  )

  15.times do |n|
    Item.create!(
      genle_id: 0,
      name: "いちごのショートケーキ（ホール）#{n + 1}",
      introduction: "栃⽊県産のとちおとめを贅沢に使⽤しています。",
      price: 2750,
      is_active: TRUE,
      image: open("./app/assets/images/ホールケーキ.jpg")
    )

  5.times do |n|
    Item.create!(
      genle_id: 0,
      name: "ガトーショコラ#{n + 1}",
      introduction: "こだわったチョコレートを贅沢に使⽤しています。",
      price: 800,
      is_active: FALSE,
      image: open("./app/assets/images/ガトーショコラ.jpg")
    )
