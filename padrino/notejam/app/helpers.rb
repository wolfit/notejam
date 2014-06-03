# Helper methods defined here can be accessed in any controller or view in the application

module Notejam
  class App
    def get_or_404(model, id)
      model.get(id) or halt 404, "Page not found"
    end

    def smart_date(datetime)
      diff = Date.today - datetime.to_date
      days = diff.to_i
      if days == 0
        'Today at ' + datetime.strftime("%H:%M")
      elsif days == 1
        'Yesterday'
     elsif days > 1 && days <= 7
        days.to_s + " days ago"
      else
        datetime.strftime("%d %b %Y")
      end
    end

    def field_errors(field, model)
      if model && model.errors[field].any?
        errors = "<ul class='errorlist'>"
        model.errors[field].each do |message|
          errors << "<li>#{message}</li>"
        end
        errors << "</ul>"
        errors.html_safe
      end
    end
  end
end
