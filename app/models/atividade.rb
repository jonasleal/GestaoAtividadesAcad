class Atividade < ApplicationRecord
  has_many  :historico_atividades
  belongs_to :projeto
end
