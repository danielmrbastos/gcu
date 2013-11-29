# encoding: utf-8
class CasosDeUsoController < ApplicationController

  def index
    @casos_de_uso = CasoDeUso.page(params[:page])
  end

  def show
    @caso_de_uso = CasoDeUso.find(params[:id])
  end

  def new
    @caso_de_uso = CasoDeUso.new
  end

  def edit
    @caso_de_uso = CasoDeUso.find(params[:id])
   end

  def create
    @caso_de_uso = CasoDeUso.new(params[:caso_de_uso])

    if @caso_de_uso.save
      redirect_to(caso_de_uso_path(@caso_de_uso), :notice => 'Caso de uso foi criado com sucesso.')
    else
      render :action => "new"
    end
  end

  def update
    @caso_de_uso = CasoDeUso.find(params[:id])

    if @caso_de_uso.update_attributes(params[:caso_de_uso])
      redirect_to(caso_de_uso_path(@caso_de_uso), :notice => 'Caso de uso foi atualizado com sucesso.')
    else
      render :action => "edit"
    end
  end

	def aprova_caso
		@caso_de_uso = CasoDeUso.find(params[:caso_de_uso_id])

		if @caso_de_uso.aprovar
			redirect_to(casos_de_uso_url)
		end

	end

	def mostra_atores
		@caso_de_uso = CasoDeUso.find(params[:caso_de_uso_id])
		@atores_do_projeto = Ator.where(:projeto_id => @caso_de_uso.projeto)
	end

	def associar_ator
		@caso_de_uso = CasoDeUso.find(params[:caso_de_uso_id])
		@caso_de_uso.associa_atores(params[:caso_de_uso][:ator])

		redirect_to(caso_de_uso_path(@caso_de_uso))
	end

  def destroy
    @caso_de_uso = CasoDeUso.find(params[:id])
    @caso_de_uso.destroy
    redirect_to(casos_de_uso_url)
  end

end
