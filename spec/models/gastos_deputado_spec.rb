require "rails_helper"

RSpec.describe GastosDeputado, type: :model do
  before do
    @gastos = create(:gastos_deputado)
  end

  it "É valido?" do
    expect(@gastos).to be_valid
  end
end
