class Bug < ApplicationRecord

    has_many :project

    has_many :comments
    validates :title, presence: true
    validates :body, presence: true, length: { minimum: 10 }

end