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
      kana_first_name: "メイ",
      kana_last_name: "セイ",
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

  Genre.create!(
     name: "ホールケーキ",
  )

  Genre.create!(
     name: "カットケーキ",
  )

  Genre.create!(
     name: "マカロン",
  )

  15.times do |n|
    Item.create!(
      genre_id: 1,
      name: "いちごのショートケーキ（ホール）#{n + 1}",
      introduction: "栃⽊県産のとちおとめを贅沢に使⽤しています。",
      price: 2750,
      is_active: [['販売中', true], ['販売停止', false]],
      image: open("./app/assets/images/ホールケーキ.jpg")
    )
  end

  5.times do |n|
    Item.create!(
      genre_id: 1,
      name: "ガトーショコラ#{n + 1}",
      introduction: "こだわったチョコレートを贅沢に使⽤しています。",
      price: 800,
      is_active: [['販売中', true], ['販売停止', false]],
      image: open("./app/assets/images/ガトーショコラ.jpg")
    )
  end

  9.times do |n|
    Addresse.create!(
      name: "test#{n + 1}",
      postal_code: "123456#{n + 1}",
      address: "東京都渋谷区神南1丁目19-11 パークウェースクエア2 4階#{n + 1}",
      customer_id: n + 1
    )
  end

  5.times do |n|
    Order.create!(
      customer_id: n +1,
      address: "東京都渋谷区神南1丁目19-11 パークウェースクエア2 4階#{n + 1}",
      postal_code: "123456#{n + 1}",
      name: "test#{n + 1}",
      shipping_cost: "800",
      total_payment: "#{1000 + (n * 1000) +800}",
      payment_method: "クレジットカード",
      status: "入金待ち"
    )
  end

  5.times do |n|
    OrderDetail.create!(
      item_id: n + 1,
      order_id: n + 1,
      count: n + 3,
      price: "#{1000 + (n * 1000)}",
      making_status: "着手不可"
    )
  end
