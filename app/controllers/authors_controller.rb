class AuthorsController < ApplicationController

    before_action :get_author, except: [:create, :index, :id_active]

    def get_author
        @author = Author.find(params[:id])
    end

    def create
        Author.create!(permitted_data)
        render json: {message: "Created Successfully"}, status: 201
    end

    def update
        @author.update!(permitted_data)
        render json: {message: "Updated Successfully"}, status: 200
    end

    def show
        # @author
        # render json: {authors: @author}, status: 200
    end

    def destroy
        @author.delete
        render json: {message: " Successfully"}, status: 202
    end

    def show_status
        render json: {authors: @author.status}, status: 200
    end

    def index
        @author = Author.joins(:blogs)
        @blogs_by_author = Author.joins(:blogs).where(blogs: { status: 'Active' })
        binding.pry
        
        render json: {authors: Author.all}, status: 200
    end

    def id_active

        view_a = Author.where(status: 'active')
        # view_a = Author.find_by status: "active"
        render json: {autors: @view_a}, status: 200
    end

    # def id_inactive
    #     render json: {autors: @author}, status: 200
    # end

    def permitted_data
        params.permit(:name, :email, :password, :status)
    end

end