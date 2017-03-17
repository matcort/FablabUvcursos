require 'test_helper'

class CursoDictadosControllerTest < ActionController::TestCase
  setup do
    @curso_dictado = curso_dictados(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:curso_dictados)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create curso_dictado" do
    assert_difference('CursoDictado.count') do
      post :create, curso_dictado: { curso_id: @curso_dictado.curso_id, estado: @curso_dictado.estado, fecha_fin: @curso_dictado.fecha_fin, fecha_inicio: @curso_dictado.fecha_inicio }
    end

    assert_redirected_to curso_dictado_path(assigns(:curso_dictado))
  end

  test "should show curso_dictado" do
    get :show, id: @curso_dictado
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @curso_dictado
    assert_response :success
  end

  test "should update curso_dictado" do
    patch :update, id: @curso_dictado, curso_dictado: { curso_id: @curso_dictado.curso_id, estado: @curso_dictado.estado, fecha_fin: @curso_dictado.fecha_fin, fecha_inicio: @curso_dictado.fecha_inicio }
    assert_redirected_to curso_dictado_path(assigns(:curso_dictado))
  end

  test "should destroy curso_dictado" do
    assert_difference('CursoDictado.count', -1) do
      delete :destroy, id: @curso_dictado
    end

    assert_redirected_to curso_dictados_path
  end
end
