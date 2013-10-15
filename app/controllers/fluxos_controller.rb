# encoding: utf-8
class FluxosController < ApplicationController

  def edit
    @fluxo = Fluxo.find(params[:id])
  end

  def update
    @fluxo = Fluxo.find(params[:id])
		@caso  = @fluxo.caso_de_uso

    if @fluxo.update_attributes(params[:fluxo])
      redirect_to(caso_de_uso_path(@caso), :notice => 'Fluxo foi atualizado com sucesso.')
    else
      render :action => "edit"
    end
  end

#  def destroy
#    @fluxo = Fluxo.find(params[:id])
#    @fluxo.destroy
#    redirect_to(fluxos_url)
#  end
end
