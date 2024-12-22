class Admin::VariantsController < ApplicationController
  before_action :set_variant, only: %i[edit update destroy]
  before_action :set_products, only: %i[new edit]

  def index
    @variants = Variant.includes(:product).all
  end

  def new
    @variant = Variant.new
  end

  def create
    @variant = Variant.new(variant_params)
    if @variant.save
      redirect_to admin_variants_path, notice: 'Variant created successfully.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @variant.update(variant_params)
      redirect_to admin_variants_path, notice: 'Variant updated successfully.'
    else
      render :edit
    end
  end

  def destroy
    @variant.destroy
    redirect_to admin_variants_path, notice: 'Variant deleted successfully.'
  end

  private

  def set_variant
    @variant = Variant.find(params[:id])
  end

  def set_products
    @products = Product.all
  end

  def variant_params
    params.require(:variant).permit(:name, :price, :product_id)
  end
end
