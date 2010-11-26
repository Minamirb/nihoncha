class WishesController < ApplicationController
  def index
    @wishes = Wish.all

    respond_to do |format|
      format.html 
      format.xml  { render :xml => @wishes }
    end
  end

  def show
    @wish = Wish.find(params[:id])

    respond_to do |format|
      format.html
      format.xml  { render :xml => @wish }
    end
  end

  def create
    @wish = Wish.new(params[:wish])

    respond_to do |format|
      if @wish.save
        format.html { redirect_to(@wish, :notice => 'Wish was successfully created.') }
        format.xml  { render :xml => @wish, :status => :created, :location => @wish }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @wish.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @wish = Wish.find(params[:id])
    @wish.destroy

    respond_to do |format|
      format.html { redirect_to(wishes_url) }
      format.xml  { head :ok }
    end
  end
end
