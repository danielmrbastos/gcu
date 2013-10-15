# encoding: utf-8
class ProjetosController < ApplicationController
  #before_filter :require_admin

  #add_breadcrumb 'Projetos', 'projetos_path'
  #add_breadcrumb 'Listando', '', :only => [:index]
  #add_breadcrumb 'Criando novo Projeto', '', :only => [:new, :create]

  def index
    @projetos = Projeto.page(params[:page])
  end

  def show
    @projeto = Projeto.find(params[:id])
		add_breadcrumb @projeto.to_s, ''
  end

  def new
    @projeto = Projeto.new
  end

  def edit
    @projeto = Projeto.find(params[:id])
    add_breadcrumb @projeto.to_s, projeto_path(@projeto)
    add_breadcrumb 'Editando'
  end

  def create
    @projeto = Projeto.new(params[:projeto])

    if @projeto.save
      redirect_to(projeto_path(@projeto), :notice => 'Projeto foi criado com sucesso.')
    else
      render :action => "new"
    end
  end

  def update
    @projeto = Projeto.find(params[:id])

    if @projeto.update_attributes(params[:projeto])
      redirect_to(projeto_path(@projeto), :notice => 'Projeto foi atualizado com sucesso.')
    else
      render :action => "edit"
    end
  end

  def destroy
    @projeto = Projeto.find(params[:id])
    @projeto.destroy
    redirect_to(projetos_url)
  end
end
