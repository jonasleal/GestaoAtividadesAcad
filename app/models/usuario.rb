class Usuario < ApplicationRecord
  validates :email, presence: true, length: {minimum: 5}
  validates :senha, presence: true, length: {minimum: 5}
  validates :nome, presence: true, length: {minimum: 5}
  validates_format_of  :nome, :with => /\A[^0-9`!@#\$%\^&*+_=]+\z/
  validates :cpf, presence: true, length: {minimum: 11}, :numericality => {:only_integer => true}
  validates :curso, presence: true, length: {minimum: 3}
  validates :especificao, presence: true, length: {minimum: 5}
end