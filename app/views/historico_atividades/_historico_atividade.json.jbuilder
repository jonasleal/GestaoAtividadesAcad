json.extract! historico_atividade, :id, :status,:atividade_id, :created_at, :updated_at
json.url historico_atividade_url(historico_atividade, format: :json)
