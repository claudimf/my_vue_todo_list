require 'rails_helper'

RSpec.describe ToDo, type: :model do
  it "is valid with a title" do
    to_do = build(:to_do)
    expect(to_do).to be_valid
  end
end
