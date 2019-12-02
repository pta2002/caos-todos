class Task < ApplicationRecord
    validates :text, presence: true
    after_initialize :init

    belongs_to :user

    def init
        self.done ||= false
    end
end
