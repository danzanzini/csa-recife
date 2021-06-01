module ApplicationHelper

  def invalid_class(object, attribute)
    return 'is-invalid' if object.errors[attribute].any?
  end
end
