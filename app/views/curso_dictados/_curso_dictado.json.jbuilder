json.extract! curso_dictado, :id, :estado, :fecha_inicio, :fecha_fin, :curso_id, :created_at, :updated_at
json.url curso_dictado_url(curso_dictado, format: :json)