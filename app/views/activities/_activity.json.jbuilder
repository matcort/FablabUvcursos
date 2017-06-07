json.extract! activity, :id, :user_id, :browser, :ip_address, :controller, :action, :params, :note, :created_at, :updated_at
json.url activity_url(activity, format: :json)