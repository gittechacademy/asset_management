module BlandsHelper
  def current_bland(id)
    @current_bland ||= Bland.find(params[:id])
  end
end
