# encoding: utf-8
class ProjetosController < ApplicationController

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

	def gerar_estimativa
    @projeto = Projeto.find(params[:projeto_id])
		if estimativa = @projeto.estima_esforco
	    redirect_to(projeto_path(@projeto), :notice => "Estimativa - #{estimativa} horas/homem")
		else
			redirect_to(projeto_path(@projeto), :alert => "Preenche o fator ténico e ambiental")
		end
  end

end
