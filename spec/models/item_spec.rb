require 'rails_helper'

RSpec.describe Item, type: :model do
  let!(:item) { Item.create(name: "TestItem") }
  let!(:item2) { Item.create(name: "TestItem2", deleted_at: Time.now) }

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(item).to be_valid
      expect(item.deleted_at).to be_nil
    end  

    it "is not valid without name" do
      item.name = nil
      expect(item).to_not be_valid
    end
  end

  describe "Default Scope" do
    it "does include items where deleted_at equals nil" do
      expect(Item.all).to include(item)
    end
    
    it "does not include soft deleted items" do
      expect(Item.all).to_not include(item2)
      expect(Item.all.length).to eq(1)
    end
  end

  describe "#soft_delete" do
    before { item.soft_delete }
    
    it "updates deleted_at attribute to current timestamp" do
      expect(item.deleted_at.utc.to_s).to eq(Time.now.utc.to_s)
    end

    it "removes the item from the default scope" do
      expect(Item.all).to be_empty
    end
  end

  describe "#restore" do
    before { item2.restore }

    it "updates deleted_at attribute to nil" do
      expect(item2.deleted_at).to be_nil
    end

    it "restores item into default scope" do
      expect(Item.all).to include(item2)
      expect(Item.all.length).to eq(2)
    end
  end
end
