class Api::ImportController < ApplicationController
  def products
    if current_user.has_role? :admin
      data = params.require(:products)
      ActiveRecord::Base.transaction do
        data.each do |item|
          Product.where(id: item[:id]).update_or_create(item.permit(:name, :title, :description, :category_id))
        end
      end
      Product.where.not(id: Slider.where(sliderable_type: "Product").pluck(:sliderable_id)).pluck(:id).map{|i| Slider.create(sliderable_id: i, sliderable_type: "Product") }
      render json: {success: true}
    end
  end
end
