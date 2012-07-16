module ApplicationHelper
  
  def sort_link(title, column, options = {})
    condition = options[:unless] if options.has_key?(:unless)
    sort_dir = params[:d] == 'up' ? 'down' : 'up'
    link_to_unless condition, "#{title}#{sort_dir == 'down' ? '<i class="icon-arrow-down"></i>' : '<i class="icon-arrow-up"></i>' if column.to_s == params[:c]}".html_safe, request.parameters.merge( {:c => column, :d => sort_dir} )
  end
  
  def list_link(collection)
    collection.map {|obj| link_to obj.name, :controller => obj.class.name.downcase.pluralize , :action => "show", :id => obj }.join(", ").html_safe if collection.present?
  end
  
  def list_link_with_count(collection)
    if collection.present?
      acc = []
      collection.each do |key, value|
        acc << "#{link_to key.name, :controller => key.class.name.downcase.pluralize , :action => "show", :id => key} (#{value} %)"
      end
      acc.join(", ").html_safe
    end
  end
  
  def list_link_files(collection)
    collection.map {|obj| link_to File.basename(obj.file.url), obj.file.url }.join(", ").html_safe if collection.present?
  end
  
end
