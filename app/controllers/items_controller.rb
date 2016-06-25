class ItemsController < ApplicationController
  def show
    @item = Item.find(params[:id])
  end

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to "/items/#{@item.id}"
  end

# 編集画面に渡すデータをDBから取得
# paramsで取得したIDに該当するデータをFIND(見つける)
# 見つけた結果を変数にセット
  def edit
    @item = Item.find(params[:id])
  end

# 更新機能
  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to "/items/#{@item.id}"
  end

# 削除
  def destroy
    # URLから値を取得して、削除対象を編集にセット
    @item = Item.find(params[:id])
    # 変数の中身を削除
    @item.destroy
    redirect_to "/items"
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :seller_id, :description, :email, :image_url)
  end

end
