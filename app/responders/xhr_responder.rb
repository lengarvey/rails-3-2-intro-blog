class XhrResponder < ActionController::Responder
  def xhr?
    @controller.request.xhr?
  end

  # xhr the "format" when you request html but do so via AJAX.
  #
  def respond
    if xhr? && format == :html
      method = "to_xhr"
    else
      method = "to_#{format}"
    end
    respond_to?(method) ? send(method) : to_format
  end

  # render the appropriate partial for the resource
  #
  def to_xhr
    controller.default_render(@resource, options.merge(:partial => true))
  end
end
