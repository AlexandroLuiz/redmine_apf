class FunctionalityTransactionTypesController < ApplicationController
  unloadable

  menu_item :APF
  before_filter :current_project
  before_filter :authorize, :only => [:index, :show, :edit, :new, :destroy]

  def index
    @functionality_transaction_types = FunctionalityTransactionType.find_all_by_project_id(:project_id)
    @functionality_transaction_type_count = @functionality_transaction_types.size
    @functionality_transaction_type_pages = Paginator.new self, @functionality_transaction_type_count, per_page_option, params['page']
  end

  def show
    @functionality_transaction_type = FunctionalityTransactionType.find(params[:id])
  end

  def new
    @functionality_transaction_type = FunctionalityTransactionType.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
     @functionality_transaction_type = FunctionalityTransactionType.find(params[:id])

  end

  def create
    @functionality_transaction_type = FunctionalityTransactionType.new(params[:functionality_transaction_type])
    @functionality_transaction_type.project_id = @project.id


    respond_to do |format|
      if @functionality_transaction_type.save
        format.html { redirect_to(project_functionality_transaction_types_url, :notice => l(:notice_successful_create)) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
     @functionality_transaction_type = FunctionalityTransactionType.find(params[:id])
    respond_to do |format|
     if @functionality_transaction_type.update_attributes(params[:functionality_transaction_type])
       format.html { redirect_to(project_functionality_transaction_types_url, :notice => l(:notice_successful_updated)) }
       format.xml  { head :ok }
     else
       format.html { render :action => "edit" }
       format.xml  { render :xml => @functionality_transaction_type.errors, :status => :unprocessable_entity }
    end
    end
  end

  def destroy
    @functionality_transaction_type = FunctionalityTransactionType.find(params[:id])
    @functionality_transaction_type.destroy

    respond_to do |format|
      format.html { redirect_to(project_functionality_transaction_types_url(@project)) }
      format.xml  { head :ok }
    end
  end

   private
   def current_project
      @project = Project.find(params[:project_id])
   end
end

