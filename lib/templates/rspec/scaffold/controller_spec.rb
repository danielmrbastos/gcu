# encoding: utf-8
require 'spec_helper'

describe <%= controller_class_name %>Controller do
  describe "as guest" do
    it_should_require_login_for_actions :index, :show, :new, :create, :edit, :update, :destroy
  end

  describe "as basic user" do
    before { login_as_basic_user }

    it_should_require_admin_for_actions :index, :show, :new, :create, :edit, :update, :destroy
  end
end

describe <%= controller_class_name %>Controller, "as admin" do
  render_views

  before do
    login_as_admin
    @<%= file_name %> = Factory(:<%= file_name %>)
  end

<% unless options[:singleton] -%>
  describe "GET to index" do
    before { get :index }

    it { assigns[:<%= table_name %>].should_not be_nil }
    it { flash[:notice].should be_blank }
    it { response.should be_success }
    it { response.should render_template('index') }

    it "should assign breadcrumbs names" do
      breadcrumb_names = assigns(:breadcrumbs).collect {|e| e[0]}
      breadcrumb_names.should == ['Home', '<%= human_name.pluralize %>', 'Listando']
    end
  end
<% end -%>

  describe "GET to show" do
    before { get :show, :id => @<%= file_name %>.id }

    it { assigns[:<%= file_name %>].should == @<%= file_name %> }
    it { flash[:notice].should be_blank }
    it { response.should be_success }
    it { response.should render_template('show') }

    it "should assign breadcrumbs names" do
      breadcrumb_names = assigns(:breadcrumbs).collect {|e| e[0]}
      breadcrumb_names.should == ['Home', '<%= human_name.pluralize %>', @<%= file_name %>.to_s]
    end
  end

  describe "GET to new" do
    before { get :new }

    it { assigns[:<%= file_name %>].should_not be_nil }
    it { flash[:notice].should be_blank }
    it { response.should be_success }
    it { response.should render_template('new') }

    it "should assign breadcrumbs names" do
      breadcrumb_names = assigns(:breadcrumbs).collect {|e| e[0]}
      breadcrumb_names.should == ['Home', '<%= human_name.pluralize %>', 'Criando novo <%= human_name %>']
    end
  end

  describe "GET to edit" do
    before { get :edit, :id => @<%= file_name %>.id }

    it { assigns[:<%= file_name %>].should == @<%= file_name %> }
    it { flash[:notice].should be_blank }
    it { response.should be_success }
    it { response.should render_template('edit') }

    it "should assign breadcrumbs names" do
      breadcrumb_names = assigns(:breadcrumbs).collect {|e| e[0]}
      breadcrumb_names.should == ['Home', '<%= human_name.pluralize %>', @<%= file_name %>.to_s, 'Editando']
    end
  end

  describe "POST to create" do
    context "with sucessful save" do
      before { post :create, :<%= file_name %> => Factory.attributes_for(:<%= file_name %>) }

      it { assigns[:<%= file_name %>].should_not be_nil }
      it { flash[:notice].should match('criado') }
      it { response.should redirect_to(<%= file_name %>_url(assigns(:<%= file_name %>))) }
    end

    context "with failed save" do
      before do
        <%= class_name %>.any_instance.stub(:save).and_return(false)        
        post :create, :<%= file_name %> => {}
      end

      it { assigns[:<%= file_name %>].should_not be_nil }
      it { flash[:notice].should be_blank }
      it { response.should render_template('new') }
    end
  end

  describe "PUT to update" do
    context "with sucessful save" do
      before { put :update, :id => @<%= file_name %>.id,  :<%= file_name %> => { :name => 'alt' } }

      it { assigns[:<%= file_name %>].should == @<%= file_name %> }
      it { flash[:notice].should match('atualizado') }
      it { response.should redirect_to(<%= file_name %>_url(assigns(:<%= file_name %>))) }
    end

    context "with failed save" do
      before do
        <%= class_name %>.any_instance.stub(:save).and_return(false)
        put :update, :id => @<%= file_name %>.id,  :<%= file_name %> => { :name => '' }
      end

      it { assigns[:<%= file_name %>].should == @<%= file_name %> }
      it { flash[:notice].should be_blank }
      it { response.should render_template('edit') }
    end
  end

  context "DELETE to destroy" do
    before { delete :destroy, :id => @<%= file_name %>.id }

    it { assigns[:<%= file_name %>].should == @<%= file_name %> }
    it { flash[:notice].should be_blank }
    it { response.should redirect_to(<%= index_helper %>_url) }
  end

end

