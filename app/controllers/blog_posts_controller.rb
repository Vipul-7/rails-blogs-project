class BlogPostsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :set_blog_post, except: [:index,:new,:create] #only: [:show,:edit,:update,:destroy]

    def index
        @blog_posts = BlogPost.all
    end

    # get a specific blog
    def show 
    end

    # gives the form in view
    def new
        @blog_post = BlogPost.new
    end

    # post request to store in db
    def create
        @blog_post = BlogPost.new(blog_post_params)
        if @blog_post.save
            redirect_to @blog_post
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        # @blog_post = BlogPost.find(params[:id])
    end

    def update
        # @blog_post = BlogPost.find(params[:id])
        if @blog_post.update(blog_post_params)
            redirect_to @blog_post
        else
            render :edit , status: :unprocessable_entity
        end
    end

    def destroy
        # @blog_post = BlogPost.find(params[:id])
        @blog_post.destroy
        redirect_to root_path
    end

    # a helper function to permit the params to put in database
    def blog_post_params
        params.require(:blog_post).permit(:title,:body)
    end

    def set_blog_post
        @blog_post = BlogPost.find(params[:id])
        # redirect the request
        rescue ActiveRecord::RecordNotFound
            redirect_to root_path
    end
end