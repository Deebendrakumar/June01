class BlogsController < ApplicationController

    before_action :get_blog, except: [:create, :index, :id_active]

    def get_blog
        @blog=Blog.find(params[:id])
    end

    def create
        Blog.create!(permitted_data)
        render json: {message: "Created Successfully"}, status: 201
    end

    def update
        @blog.update!(permitted_data)
        render json: {message: "Updated Successfully"}, status: 200
    end

    def show
        render json: {blogs: @blog}, status: 200
    end

    def destroy
        @blog.delete
        render json: {}, status: 200
    end

    def index
        @blogs = Blog.all
        # render json: {blogs: Blog.all}, status: 200
    end

    def show_status
        render json: {blogs: @blog.status}, status: 200
    end

    def id_active
        view_b = Blog.where(status: params[:status])                    
        # view_b = Blog.find_by status: "active"
        render json: {blogs: view_b}, status: 200
    end

    # def id_inactive
    #     render json: {blogs: @blog}, status: 200
    # end

    def permitted_data
        params.permit(:content, :title, :short_description, :status, :publish_at)
    end

end


# id, status
# status