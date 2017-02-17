# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.find_or_create_by(email: 'info@prog-8.com') do |new_user|
  new_user.name = 'ninjwanko'
  new_user.image = '/images/default_user.jpg'
  new_user.password = BCrypt::Password.create('password')
end

post = user.posts.create!([
  {
    content: 'Railsコースがより分かりやすく進化する予定です！',
  },
  {
    content: '事業が伸びすぎていて人が足りません。。。インスタ使ったプロモーション事業の営業とマーケで、興味があるかたDMください。 ほんとにください！',
  },
  {
    content: 'プログラミング奨学金にエントリーしてくれた大学生に会ってみたら、即日で投資先スタートアップでフルタイムインターン決まった！プログラミング学ぶ人が増えるのもいいけどスタートアップに来る人が増えるのもいいことだ。',
  },
  {
    content: '「第1回Progate Sunday School 」始まりました！！',
  },
])
