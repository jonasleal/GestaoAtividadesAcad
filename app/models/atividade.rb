class Atividade < ApplicationRecord
  has_many  :historico_atividades
  belongs_to :projeto

  #Validações

  validates :titulo, presence: {message: "Campo obrigatório" },
            length: {minimum: 3,too_short: "Mínimo de 3 caracteres" }
  validate :validarDataInicio
  validate :validarDataFim
  validates :cargaPrev, presence: {message: "Campo obrigatório" },
            numericality: { only_integer:true,message:"Deve conter apenas números" }
  validates :cargaReal, presence: {message: "Campo obrigatório" },
            numericality: { only_integer:true,message:"Deve conter apenas números" }
  validates :descricao, presence: {message: "Campo obrigatório" },
            length: {minimum: 5,too_short: "Mínimo de 5 caracteres" }


  def validarDataInicio
    errors.add(:dataInicio, "A data de inicio não pode ser no passado") if dataInicio < Date.current
  end
  def validarDataFim
    errors.add(:dataFim, "O termino não pode ser antes do inicio") if dataFim < dataInicio
  end
end
