module SdadHelper
  def sdad_button_row(form_builder)
    render :partial => '/sdad_button_row', :locals => {:f => form_builder}
  end
end