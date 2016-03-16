class ApiController < ApplicationController
  respond_to :json

  load_and_authorize_resource except: [:create]

  skip_before_action :verify_authenticity_token if Rails.env == "development"

  include SerializeHelper
  include ApiHelper
  
  def index
    render json: {symbol_params_many => serialize_objects(loaded_resources.page(params[:page]).per(ENV["PER_PAGE"]), serializer_name)}
  end

  def show
    render json: {symbol_params_one => serialize_object(loaded_resource, serializer_name)}
  end

  def destroy
    if loaded_resource.delete
      render json: {id: params[:id]}
    else
      render_error
    end
  end

  def create
    resource = loaded_class.new permited_params
    if resource.save
      render json: {symbol_params_one => serialize_object(resource, serializer_name)}
    else
      render_error
    end
  end

  private

  def render_error
    render json: {error: I18n.t("info.something_went_wrong") }
  end

end

