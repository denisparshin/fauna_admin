module ApiHelper

  def to_underscore(val)
    val.gsub!(/(.)([A-Z])/,'\1_\2').downcase
  end

  def permited_params
    params.require(symbol_params_one).permit(to_permit)
  end

  def serializer_name
    ("::Api::" + class_one + "Serializer").constantize
  end

  def to_permit
    loaded_class.attribute_names.map{|a| a.to_sym} - loaded_class.try(:except_attrs).to_a.push(:id, :created_at, :updated_at)
  end

  def symbol_params_one
    to_underscore(class_one).to_sym
  end

  def symbol_params_many
    to_underscore(class_many).to_sym
  end

  def loaded_class
    class_one.constantize
  end

  def loaded_resource
    instance_variable_get("@" + to_underscore(class_one))
  end

  def loaded_resources
    instance_variable_get("@" + to_underscore(class_many))
  end

  def class_one
    self.class.to_s.gsub(/^Api::/, '').gsub(/sController$/, '')
  end

  def class_many
    self.class.to_s.gsub(/^Api::/, '').gsub(/Controller$/, '')
  end

end
