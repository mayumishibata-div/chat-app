FactoryBot.define do
  factory :room_user do
    association :user
    association :room
  end
  # 中間テーブルのテスト用モデルにアソシエーションが定義


end