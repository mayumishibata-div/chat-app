class Message < ApplicationRecord

  belongs_to :user
  belongs_to :room
  has_one_attached :image

  validates :content, presence: true, unless: :was_attached
  # validatesのunlessオプションにメソッド名を指定することで、「メソッドの返り値がfalseならばバリデーションによる検証を行う」という条件

  def was_attached
    self.image.attached?
    # 画像があればtrue、なければfalseを返す
  end
end
