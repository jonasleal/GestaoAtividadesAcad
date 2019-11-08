class Usuario < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :trabalhos ,dependent: :destroy
  has_many :projetos,:through=>:trabalhos
  validates :nome, presence: { message: "nao pode ser em branco ou conter acentuacao"},
            length: { minimum: 3, too_short: "deve ter pelo menos 3 caracteres" },
            format: { with: /\A[^0-9`!@#\$%\^&*+_=]+\z/, message: "nao pode conter caracteres especiais ou numeros" }
  validates :cpf, presence: { message: "nao pode ser em branco"},
            length: { is:11, message:"deve ter 11 digitos"},
            numericality: { only_integer:true,message:"deve conter apenas numeros" }
  validates :senha, presence: {message: " nao pode ser em branco" },
            length: {minimum: 6,too_short: "deve ter pelo menos 6 caracteres" }
  validates :especificao, presence: {message: " nao pode ser em branco" },
            length: {minimum: 3,too_short: "deve ter pelo menos 3 caracteres" }
  validates :curso, presence: {message: " nao pode ser em branco" },
            length: {minimum: 3,too_short: "deve ter pelo menos 3 caracteres" }
  validates :email, presence: {message: " e-mail nao pode ser em branco" },
             format: { with: URI::MailTo::EMAIL_REGEXP, message: "apenas permite emails validos" }
end