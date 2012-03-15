class FunctionalityDataTypesController < ApplicationController
  unloadable

  menu_item :apf
  before_filter :current_project
  before_filter :authorize, :only => [:index, :show, :edit, :new, :destroy]

  def index
    @functionality_data_types = FunctionalityDataType.find(:all)
    @functionality_data_type_count = @functionality_data_types.size
    @functionality_data_type_pages = Paginator.new self, @functionality_data_type_count, per_page_option, params['page']
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @functionality_data_types }
    end
  end

 def show
   @functionality_data_type = FunctionalityDataType.find(params[:id])

  end

  def new
    @functionality_data_type = FunctionalityDataType.new
    @type_of_functionalities = TypeOfFunctionality.find_all_by_id([1,2]).collect{|type| [type.name, type.id]}

    respond_to do |format|
      format.html # new.html.erb
    end
  end



  def edit
    @functionality_data_type = FunctionalityDataType.find(params[:id])
    @type_of_functionalities = TypeOfFunctionality.find_all_by_id([1,2]).collect{|type| [type.name, type.id]}
  end

  def create
    @functionality_data_type = FunctionalityDataType.new(params[:functionality_data_type])
    @functionality_data_type.project_id = @project.id

    respond_to do |format|
      if @functionality_data_type.save
        format.html { redirect_to(project_functionality_data_types_url, :notice => 'Functionality created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @functionality_data_type = FunctionalityDataType.find(params[:id])
    respond_to do |format|
     if @functionality_data_type.update_attributes(params[:functionality_data_type])
       format.html { redirect_to(project_functionality_data_types_url, :notice => l(:notice_successful_updated)) }
       format.xml  { head :ok }
     else
       format.html { render :action => "edit" }
       format.xml  { render :xml => @functionality_data_type.errors, :status => :unprocessable_entity }
    end
    end
  end

  def destroy
    @functionality_data_type = FunctionalityDataType.find(params[:id])
    @functionality_data_type.destroy

    respond_to do |format|
      format.html { redirect_to(project_functionality_data_types_url(@project)) }
      format.xml  { head :ok }
    end
  end

  private
   def current_project
      @project = Project.find(params[:project_id])
   end
end

