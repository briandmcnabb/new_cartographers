module ClassifyInstanceMethods
  def method_missing(method, *args, &block)
    if instance_methods.include?(method)
      new(*args).send(method)
    else
      super
    end
  end

  def respond_to?(method, include_private=false)
    if instance_methods.include?(method)
      true
    else
      super
    end
  end
end