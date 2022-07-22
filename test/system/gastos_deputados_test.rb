require "application_system_test_case"

class GastosDeputadosTest < ApplicationSystemTestCase
  setup do
    @gastos_deputado = gastos_deputados(:one)
  end

  test "visiting the index" do
    visit gastos_deputados_url
    assert_selector "h1", text: "Gastos Deputados"
  end

  test "creating a Gastos deputado" do
    visit gastos_deputados_url
    click_on "New Gastos Deputado"

    click_on "Create Gastos deputado"

    assert_text "Gastos deputado was successfully created"
    click_on "Back"
  end

  test "updating a Gastos deputado" do
    visit gastos_deputados_url
    click_on "Edit", match: :first

    click_on "Update Gastos deputado"

    assert_text "Gastos deputado was successfully updated"
    click_on "Back"
  end

  test "destroying a Gastos deputado" do
    visit gastos_deputados_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Gastos deputado was successfully destroyed"
  end
end
