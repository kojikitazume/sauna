# frozen_string_literal: true

require 'faker'

# 関連するレコードの削除
Bookmark.delete_all
SaunaVisit.delete_all
Sauna.delete_all
User.delete_all

# ユーザーのサンプルデータ
User.create!(email: 'test@example.com', password: 'password', password_confirmation: 'password')

10.times do
  User.create!(
    email: Faker::Internet.unique.email,
    password: 'password',
    password_confirmation: 'password'
  )
end

saunas = [
  { name: '青空温泉', location: '東京都渋谷区', sauna_temperature: 75, water_temperature: 15, rolyu: false, aufguss: true,
    onsen: false },
  { name: '金の湯サウナ', location: '大阪府大阪市', sauna_temperature: 100, water_temperature: 28, rolyu: false, aufguss: true,
    onsen: false },
  { name: '湖の湯サウナ', location: '京都府京都市', sauna_temperature: 86, water_temperature: 29, rolyu: false, aufguss: false,
    onsen: false },
  { name: '桜の里サウナ', location: '神奈川県横浜市', sauna_temperature: 93, water_temperature: 29, rolyu: false, aufguss: true,
    onsen: false },
  { name: '山の谷サウナ', location: '静岡県静岡市', sauna_temperature: 78, water_temperature: 15, rolyu: false, aufguss: true,
    onsen: false },
  { name: '深い森の湯', location: '北海道札幌市', sauna_temperature: 96, water_temperature: 29, rolyu: true, aufguss: false,
    onsen: false },
  { name: '清水温泉サウナ', location: '福岡県福岡市', sauna_temperature: 90, water_temperature: 16, rolyu: false, aufguss: true,
    onsen: false },
  { name: 'あずま温泉サウナ', location: '広島県広島市', sauna_temperature: 88, water_temperature: 29, rolyu: false, aufguss: true,
    onsen: false },
  { name: '安らぎの湯', location: '愛知県名古屋市', sauna_temperature: 87, water_temperature: 29, rolyu: false, aufguss: false,
    onsen: false },
  { name: '風の温泉', location: '東京都新宿区', sauna_temperature: 82, water_temperature: 18, rolyu: true, aufguss: false,
    onsen: true },
  { name: '霧の里サウナ', location: '埼玉県さいたま市', sauna_temperature: 80, water_temperature: 20, rolyu: true, aufguss: true,
    onsen: false },
  { name: '水辺の湯', location: '千葉県船橋市', sauna_temperature: 85, water_temperature: 22, rolyu: false, aufguss: false,
    onsen: false },
  { name: '星の丘サウナ', location: '兵庫県神戸市', sauna_temperature: 90, water_temperature: 25, rolyu: true, aufguss: true,
    onsen: false },
  { name: '夕陽の湯', location: '奈良県奈良市', sauna_temperature: 77, water_temperature: 17, rolyu: false, aufguss: false,
    onsen: true },
  { name: '虹の湯サウナ', location: '広島県福山市', sauna_temperature: 84, water_temperature: 26, rolyu: true, aufguss: true,
    onsen: false },
  { name: '穏やかの湯', location: '山口県下関市', sauna_temperature: 78, water_temperature: 19, rolyu: false, aufguss: false,
    onsen: true },
  { name: '風車の湯', location: '福岡県北九州市', sauna_temperature: 83, water_temperature: 21, rolyu: true, aufguss: false,
    onsen: false },
  { name: '灯りの湯', location: '茨城県水戸市', sauna_temperature: 88, water_temperature: 30, rolyu: false, aufguss: true,
    onsen: false },
  { name: '深夜の湯', location: '群馬県前橋市', sauna_temperature: 91, water_temperature: 27, rolyu: true, aufguss: false,
    onsen: true },
  { name: '雪の温泉', location: '新潟県新潟市', sauna_temperature: 80, water_temperature: 23, rolyu: false, aufguss: true,
    onsen: true },
  { name: '月の湯', location: '長野県松本市', sauna_temperature: 89, water_temperature: 25, rolyu: true, aufguss: false,
    onsen: false },
  { name: '桜の湯サウナ', location: '岡山県岡山市', sauna_temperature: 76, water_temperature: 20, rolyu: false, aufguss: true,
    onsen: false },
  { name: '滝の湯サウナ', location: '三重県四日市市', sauna_temperature: 82, water_temperature: 22, rolyu: true, aufguss: false,
    onsen: true },
  { name: '緑の湯', location: '滋賀県大津市', sauna_temperature: 78, water_temperature: 18, rolyu: false, aufguss: true,
    onsen: false },
  { name: '星降る湯', location: '京都府亀岡市', sauna_temperature: 92, water_temperature: 26, rolyu: true, aufguss: true,
    onsen: false },
  { name: '湖の温泉', location: '栃木県宇都宮市', sauna_temperature: 77, water_temperature: 24, rolyu: false, aufguss: false,
    onsen: true },
  { name: '白い湯', location: '愛媛県松山市', sauna_temperature: 85, water_temperature: 22, rolyu: true, aufguss: false,
    onsen: false },
  { name: '日の出の湯', location: '岐阜県岐阜市', sauna_temperature: 86, water_temperature: 23, rolyu: false, aufguss: true,
    onsen: true },
  { name: '天の湯サウナ', location: '福井県福井市', sauna_temperature: 79, water_temperature: 20, rolyu: true, aufguss: false,
    onsen: false },
  { name: '小さな湯', location: '岡山県倉敷市', sauna_temperature: 84, water_temperature: 25, rolyu: false, aufguss: true,
    onsen: false },
  { name: '古い湯', location: '熊本県熊本市', sauna_temperature: 90, water_temperature: 30, rolyu: true, aufguss: false,
    onsen: true },
  { name: '青い湯', location: '長崎県長崎市', sauna_temperature: 81, water_temperature: 19, rolyu: false, aufguss: true,
    onsen: true },
  { name: '灯りの湯サウナ', location: '佐賀県佐賀市', sauna_temperature: 93, water_temperature: 28, rolyu: true, aufguss: false,
    onsen: false }
]

saunas.each do |sauna_data|
  Sauna.create!(sauna_data)
end

puts 'サンプルデータを作成しました。'
