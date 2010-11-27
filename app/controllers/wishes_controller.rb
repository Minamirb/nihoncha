# -*- coding: utf-8 -*-
class WishesController < ApplicationController
  respond_to :html, :json
  before_filter :authenticate_user!
  def index
    @wishes = current_user.wishes.order('created_at DESC').all
    @wish = current_user.wishes.new
    respond_to do |format|
      format.html
      format.xml  { render :xml => @wishes }
    end
  end

  def show
    @wish = current_user.wishes.find(params[:id])

    respond_to do |format|
      format.html
      format.xml  { render :xml => @wish }
    end
  end

  def create
    @wish = current_user.wishes.new(params[:wish])
    if @wish.save
      flash[:notice] = '登録しました'
    else
      flash[:alert] = '登録に失敗しました'
    end
    respond_with(@wish)
  end

  def destroy
    @wish = current_user.wishes.find(params[:id])
    @wish.destroy

    respond_to do |format|
      format.html { redirect_to(wishes_url) }
      format.xml  { head :ok }
    end
  end

  def preview
    @wish = current_user.wishes.new(params[:wish])
    @wish.fetch
    respond_with(@wish)
  end
end
