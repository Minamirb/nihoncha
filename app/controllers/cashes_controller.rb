class CashesController < ApplicationController
  before_filter :authenticate_user!
  # GET /cashes
  # GET /cashes.xml
  def index
    @cashes = current_user.cashes.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @cashes }
    end
  end

  # GET /cashes/1
  # GET /cashes/1.xml
  def show
    @cash = current_user.cashes.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @cash }
    end
  end

  # GET /cashes/new
  # GET /cashes/new.xml
  def new
    @cash = current_user.cashes.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @cash }
    end
  end

  # GET /cashes/1/edit
  def edit
    @cash = current_user.cashes.find(params[:id])
  end

  # POST /cashes
  # POST /cashes.xml
  def create
    @cash = current_user.cashes.new(params[:cash])
    @cash.user_id = current_user.id if user_signed_in?

    respond_to do |format|
      if @cash.save
        format.html { redirect_to(@cash, :notice => 'Cash was successfully created.') }
        format.xml  { render :xml => @cash, :status => :created, :location => @cash }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @cash.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /cashes/1
  # PUT /cashes/1.xml
  def update
    @cash = current_user.cashes.find(params[:id])

    respond_to do |format|
      if @cash.update_attributes(params[:cash])
        format.html { redirect_to(@cash, :notice => 'Cash was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @cash.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /cashes/1
  # DELETE /cashes/1.xml
  def destroy
    @cash = current_user.cashes.find(params[:id])
    @cash.destroy

    respond_to do |format|
      format.html { redirect_to(cashes_url) }
      format.xml  { head :ok }
    end
  end
end
