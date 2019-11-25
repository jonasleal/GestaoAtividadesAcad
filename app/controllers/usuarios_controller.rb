class UsuariosController < ApplicationController
  before_action :set_usuario, only: [:show]
  before_action :authenticate_usuario!
  # GET /usuarios
  # GET /usuarios.json
  def index
    #@usuarios = Usuario.all
  end

  # GET /usuarios/1
  # GET /usuarios/1.json
  def show
    @usuario = Usuario.find_by_email(current_usuario.email)
  end
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_usuario
    @usuario = Usuario.find_by_email(current_usuario.email)
  end
  end

