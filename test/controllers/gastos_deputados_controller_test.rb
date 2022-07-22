require 'test_helper'

class GastosDeputadosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gastos_deputado = gastos_deputados(:one)
  end

  test "should get index" do
    get gastos_deputados_url
    assert_response :success
  end

  test "should get new" do
    get new_gastos_deputado_url
    assert_response :success
  end

  test "should create gastos_deputado" do
    assert_difference('GastosDeputado.count') do
      post gastos_deputados_url, params: { gastos_deputado: {  } }
    end

    assert_redirected_to gastos_deputado_url(GastosDeputado.last)
  end

  test "should show gastos_deputado" do
    get gastos_deputado_url(@gastos_deputado)
    assert_response :success
  end

  test "should get edit" do
    get edit_gastos_deputado_url(@gastos_deputado)
    assert_response :success
  end

  test "should update gastos_deputado" do
    patch gastos_deputado_url(@gastos_deputado), params: { gastos_deputado: {  } }
    assert_redirected_to gastos_deputado_url(@gastos_deputado)
  end

  test "should destroy gastos_deputado" do
    assert_difference('GastosDeputado.count', -1) do
      delete gastos_deputado_url(@gastos_deputado)
    end

    assert_redirected_to gastos_deputados_url
  end
end
