class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  def top
  end

  def index
    @blogs = Blog.all
  end

  def show
  end

  def new
    @blog = Blog.new
  end

  def edit
  end

  def create
    @blog = Blog.new(blog_params)
    
    if @blog.save
      redirect_to @blog, notice: 'ブログが登録されました'
    else
      render "new"
    end
  end

  def update
      if @blog.update(blog_params)
        redirect_to blogs_path, notice: 'ブログが更新されました'
      else
        render "edit"
      end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_url, notice: 'ブログが削除されました'  
  end

  private
    def set_blog
      @blog = Blog.find(params[:id])
    end

    def blog_params
      params.require(:blog).permit(:title, :content)
    end
end
