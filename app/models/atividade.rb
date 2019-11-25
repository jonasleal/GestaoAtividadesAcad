class Atividade < ApplicationRecord
  has_many  :historico_atividades
  belongs_to :projeto

  #Validações

  validates :titulo, presence: {message: "Campo obrigatório" },
            length: {minimum: 3,too_short: "Mínimo de 3 caracteres" }
  validate :validar_data_inicio
  validate :validar_data_fm
  validate :carga_prev_negativo
  validate :carga_real_negativo
  validates :cargaPrev, presence: {message: "Campo obrigatório" },
            numericality: { only_integer:true,message:"Deve conter apenas números" }
  validates :cargaReal, presence: {message: "Campo obrigatório" },
            numericality: { only_integer:true,message:"Deve conter apenas números" }
  validates :descricao, presence: {message: "Campo obrigatório" },
            length: {minimum: 5,too_short: "Mínimo de 5 caracteres" }

  def carga_prev_negativo
    errors.add(:cargaPrev, "A carga horaria prevista nao pode ser negativa") if cargaPrev.to_i.negative?
  end
  def carga_real_negativo
  errors.add(:cargaReal, "A carga horaria realizada nao pode ser negativa") if cargaReal.to_i.negative?
  end
  def validar_data_inicio
    errors.add(:dataInicio, "A data de inicio não pode ser no passado") if dataInicio < Date.current
  end
  def validar_data_fm
    errors.add(:dataFim, "O termino não pode ser antes do inicio") if dataFim < dataInicio
  end
end
