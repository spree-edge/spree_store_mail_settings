module Spree
  class EmailSetting < ApplicationRecord
    belongs_to :store
  end
end
