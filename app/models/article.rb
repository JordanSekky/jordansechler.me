class Article < ActiveRecord::Base
    validates :title, presence: true,
                      length: { minimum: 5 }
    validates :body, presence: true
    validate :author, presence: true,
                      length: { minimum: 5 }
end
