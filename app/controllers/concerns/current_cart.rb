module CurrentCart
  private
  def set_cart
    @cart = Cart.find(session[:cart_id])
  rescue Mongoid::Errors::DocumentNotFound, Mongoid::Errors::InvalidFind
    @cart = Cart.create
    session[:cart_id] = @cart.id
  end
end