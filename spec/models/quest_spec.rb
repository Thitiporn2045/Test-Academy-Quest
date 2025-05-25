require 'rails_helper'

RSpec.describe Quest, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe 'attributes' do
    it 'has name and status attributes' do
      quest = Quest.new(name: 'Test Quest', status: 'false')

      expect(quest.name).to eq('Test Quest')
      expect(quest.status).to eq(false)
    end

    it 'can has name status true' do
      quest = Quest.new(name: 'Test Quest', status: true)

      expect(quest.name).to eq('Test Quest')
      expect(quest.status).to eq(true)
    end
  end

  describe 'validations' do
    it 'is valid with only a name' do
      quest = Quest.new(name: 'Test Quest')
      expect(quest).to be_valid
    end

    it 'is not valid with only a status' do
      quest = Quest.new(status: true)
      expect(quest).not_to be_valid
      expect(quest.errors[:name]).to include("can't be blank")
    end

    it 'is not valid with no attributes' do
      quest = Quest.new
      expect(quest).not_to be_valid
      expect(quest.errors[:name]).to include("can't be blank")
    end
  end
end
