class Usuario < ApplicationRecord
  validates :email, presence: true, length: {minimum: 5}
  validates_confirmation_of :senha, presence: true, length: {minimum: 5}
  validates :nome, presence: true, length: {minimum: 5}
  validates :cpf, presence: true, length: {minimum: 11}, :numericality => {:only_integer => true}
  validates :curso, presence: true, length: {minimum: 5}
  validates :especificao, presence: true, length: {minimum: 5}
end
