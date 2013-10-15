# encoding: utf-8
require 'spec_helper'

describe PassosController, "as admin" do

  before do
    @passo = FactoryGirl.create(:passo)
  end

  describe "GET to edit" do
    before { get :edit, :id => @passo.id, :fluxo_id => @passo.fluxo, :caso_de_uso_id => @passo.fluxo.caso_de_uso }

    it { assigns[:passo].should == @passo }
    it { flash[:notice].should be_blank }
    it { response.should be_success }
    it { response.should render_template('edit') }

  end

  describe "PUT to update" do
    context "with sucessful save" do
      before { put :update, :id => @passo.id, :fluxo_id => @passo.fluxo, :passo => { :nome => 'alt' } }

      it { assigns[:passo].should == @passo }
      it { flash[:notice].should match('atualizado') }
      it { response.should redirect_to(caso_de_uso_url(assigns(:caso))) }
    end

    context "with failed save" do
      before do
        Passo.any_instance.stub(:save).and_return(false)
        put :update, :id => @passo.id, :fluxo_id => @passo.fluxo, :passo => { :nome => '' }
      end

      it { assigns[:passo].should == @passo }
      it { flash[:notice].should be_blank }
      it { response.should render_template('edit') }
    end
  end

#  context "DELETE to destroy" do
#    before { delete :destroy, :id => @passo.id }

#    it { assigns[:passo].should == @passo }
#    it { flash[:notice].should be_blank }
#    it { response.should redirect_to(passos_url) }
#  end

end
