class BlogPostsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show] 
    before_action :set_blog_post, only: [:show,:update,:destroy]

    def index
        # @blog_posts = user_signed_in? ? BlogPost.where(creator_id: current_user.id)
        # .or(BlogPost.published)
        # .sorted :  BlogPost.published.sorted
        @blog_posts = BlogPost.published.sorted
    end

    # get a specific blog
    def show 
    end

    def my_posts
        @blog_posts = BlogPost.where(creator_id: current_user.id).sorted
    end

    # gives the form in view
    def new
        @blog_post = BlogPost.new
    end

    # post request to store in db
    def create
        @blog_post = BlogPost.new(blog_post_params)
        @blog_post.creator_id = current_user.id

        if @blog_post.save
            redirect_to @blog_post
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @blog_post = BlogPost.find(params[:id])
        if @blog_post.creator_id != current_user.id
            redirect_to @blog_post, alert: "You are not authorized to edit this post", status: :unauthorized
        end
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
        params.require(:blog_post).permit(:title,:content,:published_at,:cover_image)
    end

    def set_blog_post
        @blog_post = user_signed_in? ? BlogPost.find(params[:id]) :BlogPost.published.find(params[:id])
        # @blog_post = user_signed_in? ? BlogPost.where(creator_id: current_user.id).find(params[:id]) :BlogPost.published.find(params[:id])

        # redirect the request
        rescue ActiveRecord::RecordNotFound
            redirect_to root_path
    end
end