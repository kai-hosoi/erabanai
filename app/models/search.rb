class Search < ApplicationRecord
    VALID_EMAIL_REGEX = /\A[0-9０-９]+\z/
    validates :number, format:{with: VALID_EMAIL_REGEX,message:"1-9の数字で回答してください"}#全角半角の数字のみ
end
