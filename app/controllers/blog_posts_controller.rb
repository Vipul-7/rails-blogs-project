class BlogPostsController < ApplicationController
    def index
        @blog_posts = BlogPost.all
    end

    def new
        @blog_post = BlogPost.new
    end

    def show 
        @blog_post = BlogPost.find(params[:id])
        # redirect the request
        rescue ActiveRecord::RecordNotFound
            redirect_to root_path
    end

    def create
        @blog_post = BlogPost.new(blog_post_params)
        if @blog_post.save
            redirect_to @blog_post
        else
            render :new, status: :unprocessable_entity
        end
    end

    def blog_post_params
        params.require(:blog_post).permit(:title,:body)
    end
end