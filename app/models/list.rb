class List < ApplicationRecord
  # Une liste a plusieurs signets
  has_many :bookmarks, dependent: :destroy
  # Une liste a plusieurs films avec des signets
  has_many :movies, through: :bookmarks

  validates :name, presence: true, uniqueness: true
end
