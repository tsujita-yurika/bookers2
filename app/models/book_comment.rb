class BookComment < ApplicationRecord
  belongs_to:user
  belongs_to:book
  validates :comment, presence: true,length:{maximum:140}
  #バリデーションも追記してあります。長さ最大１４０字、空欄はNG!
end
