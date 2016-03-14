module SdadHelper
  def sdad_button_row(form_builder)
    render :partial => '/sdad_button_row', :locals => {:f => form_builder}
  end
  
  def sdad_for_select(collection, name_method, id_method, selected_items: nil)
    o = {}
    ['published', 'drafts'].each do |pub_stat|
      arr = []
      collection.send(pub_stat).each do |i|
        arr << [i.send(name_method), i.send(id_method).to_s]
      end
      o[pub_stat.titlecase] = arr.sort{ |x, y| x[0] <=> y[0] } unless arr.empty?
    end
    
    grouped_options_for_select(o, selected_items) 
  end
end