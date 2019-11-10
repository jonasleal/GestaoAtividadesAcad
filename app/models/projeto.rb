class Projeto < ApplicationRecord
  has_many :trabalhos ,dependent: :destroy
  has_many :usuarios,:through=>:trabalhos
  has_many  :bibliografia
  #Validacoes
  validates :titulo, presence: {message: " nao pode ser em branco" },
            length: {minimum: 3,too_short: "deve ter pelo menos 3 caracteres" }
  validates :area, presence: {message: " nao pode ser em branco" },
            length: {minimum: 3,too_short: "deve ter pelo menos 3 caracteres" }
  validates :tipoProjeto, presence: {message: " nao pode ser em branco" },
            length: {minimum: 3,too_short: "deve ter pelo menos 3 caracteres" }
  validate :validarData

  def validarData
    errors.add(:dataFin, "não pode ser antes da data de inicio") if dataFin < dataInicio
  end


end
