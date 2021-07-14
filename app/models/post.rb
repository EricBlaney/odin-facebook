class Post < ApplicationRecord

    validates :body, presence: true

    has_many :comments
    has_many :likes

    belongs_to :user
end
