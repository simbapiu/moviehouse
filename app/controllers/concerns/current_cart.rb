module CurrentCart
  private
  def set_cart
    if Cart.find(session[:cart_id]) == nil
      @cart = Cart.create
      session[:cart_id] = @cart.id
    else
      @cart = Cart.find(session[:cart_id])      
    end
  rescue Mongoid::Errors::DocumentNotFound, Mongoid::Errors::InvalidFind
    @cart = Cart.create
    session[:cart_id] = @cart.id
  end
end