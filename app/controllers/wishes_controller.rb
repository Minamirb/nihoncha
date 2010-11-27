# -*- coding: utf-8 -*-
class WishesController < ApplicationController
  respond_to :html, :json
  def index
    @wishes = Wish.order('created_at DESC').all
    @wish = Wish.new
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
    if @wish.save
      flash[:notice] = '登録しました'
    else
      flash[:alert] = '登録に失敗しました'
    end
    respond_with(@wish)
  end

  def destroy
    @wish = Wish.find(params[:id])
    @wish.destroy

    respond_to do |format|
      format.html { redirect_to(wishes_url) }
      format.xml  { head :ok }
    end
  end

  def preview
    @wish = Wish.new(params[:wish])
    @wish.fetch
    respond_with(@wish)
  end
end
