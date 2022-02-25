class ProjectnewController < ActionController::Base

    def new_project
    
        render 'application/new_project'
      end

      def create_project
        insert_query = <<-SQL
          INSERT INTO projects (title, body, author, created_at)
          VALUES (?, ?, ?, ?)
        SQL
    
        connection.execute insert_query,
          params['title'],
          params['body'],
          params['author'],
          Date.current.to_s
    
        redirect_to '/list_projects'
        require 'pry'; binding.pry;

response.body
# => "<html><body>You are being <a href=\"http://localhost:3000/list_posts\">redirected</a>.</body></html>"

response.content_type # => nil

response.status #  => 302

response.headers
# => {
#      # ...
#      "Location"=>"http://localhost:3000/list_posts"
#    }

response.headers['Location']

      end
        
end


