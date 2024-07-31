User.create!(email: 'test@example.com', password: 'password', password_confirmation: 'password')

saunas = [
  { name: 'ととのえる温泉', location: '東京都新宿区', sauna_temperature: 100, water_temperature: 15 },
  { name: '極楽サウナ', location: '大阪府大阪市', sauna_temperature: 90, water_temperature: 18 },
  { name: '山の湯サウナ', location: '長野県軽井沢町', sauna_temperature: 80, water_temperature: 10 }
]

saunas.each do |sauna_data|
  Sauna.create!(sauna_data)
end

puts "サンプルデータを作成しました。"
