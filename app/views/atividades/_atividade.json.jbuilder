json.extract! atividade, :id, :titulo, :dataInicio, :dataFim, :cargaPrev, :cargaReal, :descricao,:projeto_id, :created_at, :updated_at
json.url atividade_url(atividade, format: :json)
