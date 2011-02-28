class PostsController < ApplicationController
  
  def get_cookie(name)
    cookies[name]
  end
  
  def set_cookie(name,value,path="/",expires=10.years.from_now)
    cookies[name] = {
                          :value => value,
                          :expires => expires,
                          :path => path
                    }
  end

  before_filter :authenticate_user! unless :index
  
  # GET /posts
  # GET /posts.xml
  def index
    section = params[:section]
    @category_name=(section||"recent").capitalize
    
    posts_scope = Post.recent.for_section(params[:section])
    @posts = posts_scope.for_category(params[:category]).limit(75).includes(:page)
    @events = Event.recent.for_category(params[:category]).for_section(params[:section])  .limit(75).includes(:page)
    
    category_tag_ids = posts_scope.joins(:page=>:categories_pages).group("category_id").order("count(*)").select("category_id").limit(10).map(&:category_id)
    @category_tags = Category.find(category_tag_ids).map(&:name)
    @category_tags -= ['people','venues','groups'] # Hack to filter out types
    
    @pages = Page.get_recommendations(section)
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @posts }
      format.json { render :json => @posts.limit(params[:limit]) }
    end
    
    @show_announcement=true
    #@show_announcement=false if get_cookie('urbaniteboston')
    #set_cookie('urbaniteboston',true)
  end

  def events
    
  end

  def pretty_posts
    @posts = Post.all(:order=>'created_time desc',:limit=>params[:limit]||100)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.xml
  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.xml
  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.xml
  def create
    @post = Post.new(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to(@post, :notice => 'Post was successfully created.') }
        format.xml  { render :xml => @post, :status => :created, :location => @post }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.xml
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to(@post, :notice => 'Post was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.xml
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to(posts_url) }
      format.xml  { head :ok }
    end
  end
end
