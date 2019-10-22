class Projeto < ApplicationRecord
  #Validacoes
  validates :titulo, presence: {message: " nao pode ser em branco" },
            length: {minimum: 5,too_short: "deve ter pelo menos 5 caracteres" }
  validates :area, presence: {message: " nao pode ser em branco" },
            length: {minimum: 5,too_short: "deve ter pelo menos 5 caracteres" }
  validates :tipoProjeto, presence: {message: " nao pode ser em branco" },
            length: {minimum: 5,too_short: "deve ter pelo menos 5 caracteres" }
end
