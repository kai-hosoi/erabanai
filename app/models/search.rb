class Search < ApplicationRecord
    VALID_EMAIL_REGEX = /\A[0-9０-９]+\z/
    validates :number, format:{with: VALID_EMAIL_REGEX,message:"1-9の数字で回答してください"}#全角半角の数字のみ
    validates :place, presence: {message: "場所を入力してください"}
    validates :budget, presence: {message: "予算を入力してください"}
    validates :style, presence: {message: "入力してください"}
    validates :age, presence: {message: "場所を入力してください"}
    validates :personality, presence: {message: "場所を入力してください"}
    validates :color, presence: {message: "場所を入力してください"}
    validates :sleep, presence: {message: "場所を入力してください"}
    validates :season, presence: {message: "場所を入力してください"}
end
