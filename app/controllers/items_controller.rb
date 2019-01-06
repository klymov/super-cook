class ItemsController < ApplicationController

  before_action :find_item, only: [ :show, :edit, :update, :destroy, :upvote]
  #before_action :find_item, only: [:new, :create, :show, :edit, :update, :destroy, :upvote]


  def index
    @items = Item.all
    #render text: @items.map { |i| "#{i.name} #{i.price}"}.join('<br/>')

  end



  # Показ только дорогих товаров
  def expensive
    @items = Item.where('price > 1000')
    render 'index'
  end


  # /items/1  GET
  def show
    # params[:id]
    #if @item = Item.where(id: params[:id]).first
    # render 'items/show' # автоматически подставляет с таким же именем
    #else
    #render :text => "Page not found",
    # render text: 'Page not found', status: 404
    #end
    #
    unless @item = Item.where(id: params[:id]).first
      render text: 'Page not found', status: 404
    end

  end

  # new -> create
  # /items/1  GET
  def new
    @item = Item.new
  end

  # /items POST
  def create
    @item = Item.create(item_params)
    if @item.errors.empty?
      redirect_to item_path(@item)
    else
      render 'new'
    end
  end

  # edit -> update
  # /items/1/edit  GET
  def edit
    #@item = Item.find(params[:id])
  end

  # /items/1  PUT
  def update
    item_params
    #@item = Item.find(params[:id])
    @item.update_attributes(item_params)

    if @item.errors.empty?
      redirect_to item_path(@item)
    else
      render 'edit'
    end
  end

  # /items/1  DELETE
  def destroy
    #@item = Item.find(params[:id])
    @item.destroy
    redirect_to action: 'index'
  end

  # голосование
  def upvote
    @item.increment!(:votes_count)
    redirect_to action: :index
  end



  # When using strong_parameters or Rails 4+, you have to sanitize inputs before
  # saving the record, in actions such as :create and :update
  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :weight, :available, :quantity, :category, :category_id, :available, {images: []}, {remove_images: []})
  end

  def find_item
    #@item = Item.find(params[:id])
    @item = Item.where(id: params[:id]).first
    render_404 unless @item
  end

  def render_404
    render file: '/public/404.html', status: 404
  end

end
