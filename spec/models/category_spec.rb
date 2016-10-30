require 'rails_helper'

RSpec.describe Category, type: :model do
  describe "Name in ['Entertainment', 'Learning', 'Everything Else']
[]" do
    it "name can not be 'Music'" do 
      category = Category.new name: "Music"
      expect(category.save).to eq false
    end

    it "name must uniquess" do
      cate1 = Category.create! name: "Entertainment"
      cate2 = Category.new name: "Entertainment"

      expect(cate2.save).to eq false
    end
  end
end
