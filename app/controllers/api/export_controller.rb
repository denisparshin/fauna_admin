class Api::ExportController < ApplicationController
  def products
    if current_user.has_role? :admin
      render json: {products: [[:id, :category_id, :name, :title, :description]].concat(Product.where(category_id: params[:category_ids]).pluck(:id, :category_id, :name, :title, :description))}
    end
  end
end
