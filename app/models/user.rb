class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :boards, dependent: :destroy
  has_many :comments, dependent: :destroy

  def own?(object)
    id == object.user_id
  end
end
