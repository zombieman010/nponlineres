class Photo < ApplicationRecord

  CATEGORIES = ['One']

  def self.category(category)
    if category
      where('category = ?', "#{category}")
    end
  end
end
