class Class

  # Defines an abstract method.
  # The method will throw a {NotImplementedError} when invoked.
  # This requires that the method be defined in a sub-class.
  # Using this helps document methods in base classes that all sub-classes have.
  # @param method [Symbol] Name of the method to make abstract.
  # @return [void]
  def abstract(method)
    define_method(method) do
      fail NotImplementedError, "#{self.class}##{method} is abstract and cannot be called directly."
    end
  end

end
