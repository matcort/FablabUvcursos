require 'test_helper'

class UsuariosControllerTest < ActionController::TestCase
  setup do
    @usuario = usuarios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:usuarios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create usuario" do
    assert_difference('Usuario.count') do
      post :create, usuario: { activo: @usuario.activo, fechaingreso: @usuario.fechaingreso, foto: @usuario.foto, mail: @usuario.mail, nombre: @usuario.nombre, password_digest: @usuario.password_digest, rol: @usuario.rol, rut: @usuario.rut }
    end

    assert_redirected_to usuario_path(assigns(:usuario))
  end

  test "should show usuario" do
    get :show, id: @usuario
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @usuario
    assert_response :success
  end

  test "should update usuario" do
    patch :update, id: @usuario, usuario: { activo: @usuario.activo, fechaingreso: @usuario.fechaingreso, foto: @usuario.foto, mail: @usuario.mail, nombre: @usuario.nombre, password_digest: @usuario.password_digest, rol: @usuario.rol, rut: @usuario.rut }
    assert_redirected_to usuario_path(assigns(:usuario))
  end

  test "should destroy usuario" do
    assert_difference('Usuario.count', -1) do
      delete :destroy, id: @usuario
    end

    assert_redirected_to usuarios_path
  end
end
