json.extract! usuario, :nome, :cpf, :curso, :especificao,:email,:encrypted_password,:reset_password_token, :created_at, :updated_at
json.url usuario_url(usuario, format: :json)
