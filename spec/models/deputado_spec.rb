require "rails_helper"

RSpec.describe Deputado, type: :model do
  before do
    @deputado = create(:deputado)
  end

  it "É valido?" do
    expect(@deputado).to be_valid
  end
end
