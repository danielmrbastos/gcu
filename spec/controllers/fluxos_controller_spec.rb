# encoding: utf-8
require 'spec_helper'

describe FluxosController, "as admin" do

  before do
		@caso  = FactoryGirl.create(:caso_de_uso)
    @fluxo = FactoryGirl.create(:fluxo)
  end

  describe "GET to edit" do
    before { get :edit, :id => @fluxo.id }

    it { assigns[:fluxo].should == @fluxo }
    it { flash[:notice].should be_blank }
    it { response.should be_success }
    it { response.should render_template('edit') }

  end

  describe "PUT to update" do
    context "with sucessful save" do
      before { put :update, :id => @fluxo.id, :caso_de_uso_id => @caso.id, :fluxo => { :nome => 'alt' } }

      it { assigns[:fluxo].should == @fluxo }
      it { flash[:notice].should match('atualizado') }
      it { response.should redirect_to(caso_de_uso_url(assigns(:caso))) }
    end

    context "with failed save" do
      before do
        Fluxo.any_instance.stub(:save).and_return(false)
        put :update, :id => @fluxo.id, :caso_de_uso_id => @caso.id, :fluxo => { :nome => '' }
      end

      it { assigns[:fluxo].should == @fluxo }
      it { flash[:notice].should be_blank }
      it { response.should render_template('edit') }
    end
  end

#  context "DELETE to destroy" do
#    before { delete :destroy, :id => @fluxo.id }

#    it { assigns[:fluxo].should == @fluxo }
#    it { flash[:notice].should be_blank }
#    it { response.should redirect_to(fluxos_url) }
#  end

end
