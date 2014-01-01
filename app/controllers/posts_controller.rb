class PostsController < ApplicationController

  before_filter :require_authentication, except: [:show, :redirect]
  before_filter :load_post, except: [:redirect]

  def new
    @post = Post.new(date: Date.today)
  end

  def show
  end

  def create
    @post = Post.new
    if @post.create(post_params)
      redirect_to post_path(@post), notice: "Post '#{@post.title}' has been created"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @post.modify(post_params)
      redirect_to post_path(@post), notice: "Post '#{@post.title}' has been updated"
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to stream_path(@post.stream), notice: "Post '#{@post.title}' has been deleted"
  end

  def redirect
    @post = Post.published.find(params[:id])
    redirect_to post_path(@post)
  end

  def tweet
    tweet_contents = Tweet.new(@post).to_s
    TwitterService.post(tweet_contents)
    redirect_to post_path(@post), notice: "Tweet '#{tweet_contents}' has been posted"
  rescue Twitter::Error => error
    redirect_to post_path(@post), alert: "Failed to tweet '#{tweet_contents}' (#{error.message})"
  end

  def drafts
    @posts = Post.drafts.in_reverse_chronological_order
  end

  private

  def load_post
    @post = Post.find_by_slug!(params[:id]) if params[:id]
  end

  def post_params
    params.
      require(:post).
      permit(:category, :title, :slug, :url, :body, :rating, :date)
  end

end
