require 'rails_helper'

RSpec.describe Scratcher, type: :model do
  it {should validate_presence_of(:name)}
  it {should validate_presence_of(:description)}
  it {should validate_presence_of(:size)}
  it {should validate_presence_of(:price)}
end
