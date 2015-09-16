module SdadHelper
  def sdad_button_row(record, form_builder)
    render :partial => '/sdad_button_row', :locals => {:record => record, :f => form_builder}
  end
end