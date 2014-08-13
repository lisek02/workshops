class ProductsController < ApplicationController
  before_action :signed_in, only: [:create, :update, :edit, :destroy]
  before_action :another_user_signed, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show, :destroy]

  expose(:category)
  expose(:products)
  expose(:product)
  expose(:review) { Review.new }
  expose_decorated(:reviews, ancestor: :product)

  def index
    #@category = Category.find(params[:category_id])
    #@products = @category.products.all.limit(5)
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    self.product = Product.new(product_params)
    product.user_id = current_user.id

    if product.save
      category.products << product
      redirect_to category_product_url(category, product), notice: 'Product was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if self.product.update(product_params)
      redirect_to category_product_url(category, product), notice: 'Product was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /products/1
  def destroy
    product.destroy
    redirect_to category_url(product.category), notice: 'Product was successfully destroyed.'
  end

  private
    def product_params
      params.require(:product).permit(:title, :description, :price, :category_id)
    end

    def signed_in
      redirect_to new_user_session_path unless user_signed_in?
    end

    def another_user_signed
      unless current_user == Product.find(params[:id]).user
        redirect_to category_product_path
        flash[:error] = 'You are not allowed to edit this product.'
      end
    end
end
