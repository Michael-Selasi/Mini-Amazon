module ApplicationHelper
	def bootstrap_class_for(flash_type)
  case flash_type
  #when "success"
   # "alert-success"   # Green
  #when "error"
  #  "alert-danger"    # Red
  when "alert"
    "alert-danger"   # Yellow
  when "notice"
    "alert-success"      # Blue
  else
    flash_type.to_s
  end
end
end

