class Task < ApplicationRecord
    validates :text, presence: true
    after_initialize :init

    def init
        self.done ||= false
    end
end
