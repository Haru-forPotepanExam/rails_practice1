class Plan < ApplicationRecord
    validates :title, presence: true, length: { maximum: 20 }
    validates :start, presence: true
    validates :end, presence: true
    validate :date_control
    validates :memo, length: {maximum: 500}

    def date_control
        errors.add(:end, "は開始日以降の日付で選択してください") unless 
        self.start <= self.end
    end

end
