# encoding: utf-8
class PassosController < ApplicationController

  def edit
    @passo = Passo.find(params[:id])
  end

  def update
    @passo = Passo.find(params[:id])
		@caso  = @passo.fluxo.caso_de_uso

    if @passo.update_attributes(params[:passo])
      redirect_to(caso_de_uso_path(@caso), :notice => 'Passo foi atualizado com sucesso.')
    else
      render :action => "edit"
    end
  end

#  def destroy
#    @passo = Passo.find(params[:id])
#    @passo.destroy
#    redirect_to(passos_url)
#  end
end
