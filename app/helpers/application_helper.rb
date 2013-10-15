# encoding: utf-8
module ApplicationHelper

	def icon_tag(klass)
  	content_tag(:i,'', :class => klass)
  end

  def error_messages(target, full=false)
  	if target.errors.any?
    	messages_array = full ? target.errors.full_messages : target.errors[:base]
    	error_messages = messages_array.map {|msg| content_tag(:li, msg) }.join.html_safe
      contents = ''
      contents << link_to('&times;'.html_safe, '#', :class => 'close', :data => {:dismiss => 'alert'})
      contents << content_tag(:h4, 'Não foi possível salvar')
      contents << content_tag(:ul, error_messages)
      field_errors_count = target.errors.size - target.errors[:base].size
      additional_msg = ''
      	unless full
        	if target.errors[:base].size > 0 && field_errors_count > 0
            additional_msg = "Também verificar os erros abaixo"
          elsif field_errors_count > 0
            additional_msg = "Verificar os erros abaixo"
          end
        end
        contents << content_tag(:p, content_tag(:em, additional_msg)) unless additional_msg.empty?
        content_tag(:div, contents.html_safe, :class => 'alert alert-error fade in')
    end
  end

	def new_multiple_level_child_fields(name, f, association, table=false)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.simple_fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    if table
      link_to(name, '#', class: "add_multiple_level_nested_table_fields btn pull-right", data: {id: id, fields: fields.gsub("\n", "")})
    else
      link_to(name, '#', class: "add_multiple_level_nested_fields btn pull-right", data: {id: id, fields: fields.gsub("\n", "")})
    end
  end

end
