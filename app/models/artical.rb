class Artical < ApplicationRecord
  validates :title, :body, presence: true
end
