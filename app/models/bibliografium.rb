class Bibliografium < ApplicationRecord
  belongs_to :projeto
  validates :titulo, presence: { message: "nao pode ser em branco ou conter acentuacao"},
            length: { minimum: 3, too_short: "deve ter pelo menos 3 caracteres" },
            format: { with: /\A[^0-9`!@#\$%\^&*+_=]+\z/, message: "nao pode conter caracteres especiais ou numeros" }
  validates :descricao, presence: { message: "nao pode ser em branco ou conter acentuacao"},
            length: { minimum: 3, too_short: "deve ter pelo menos 3 caracteres" }
end
