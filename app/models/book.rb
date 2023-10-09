class Book < ApplicationRecord
  has_many :favorites, dependent: :destroy

 def favorited_by?(user)
   favorites.exists?(user_id: user.id)
 end

  has_one_attached :image
  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 }

end
