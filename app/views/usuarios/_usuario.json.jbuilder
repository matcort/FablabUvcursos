json.extract! usuario, :id, :nombre, :rut, :mail, :fechaingreso, :foto, :rol, :activo, :password_digest, :created_at, :updated_at
json.url usuario_url(usuario, format: :json)