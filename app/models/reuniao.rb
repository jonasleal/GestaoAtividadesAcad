class Reuniao < ApplicationRecord
  belongs_to :projeto

  validates :nome, presence: {message: "Campo obrigatório" },
            length: {minimum: 3,too_short: "Mínimo de 3 caracteres" }
  validates :tempoReuniao, presence: {message: "Campo obrigatório" }
  validates :observacao, presence: {message: "Campo obrigatório" },
            length: {minimum: 5,too_short: "Mínimo de 5 caracteres" }
  validates :descricao, presence: {message: "Campo obrigatório" },
            length: {minimum: 5,too_short: "Mínimo de 5 caracteres" }

  def validarData
    errors.add(:data, "A data de inicio não pode ser no passado") if data < Date.current
  end
end
