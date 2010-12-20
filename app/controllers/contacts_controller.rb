class ContactsController < ApplicationController
  protect_from_forgery

  def index
    @contacts = Contact.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @contacts }
    end
  end

  def show
    @contact = Contact.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @contact }
    end
  end

  def new
    redirect_to :action=>'index'
  end
  
  def edit
    redirect_to :action=>'index'
  end

  def create
    @contact = Contact.new(params[:contact])
    
    if @contact.save
    	@contacts = Contact.all
    end
    render :layout => false
  end

  def update
    redirect_to :action=>'index'
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy

    @contacts = Contact.all
    render :layout => false
  end
  
  
  def search
	  @query = params[:filter]
	  
	  # note that the %'s for the like have to be on the right or rails breaks the syntax by adding single quotes
	  @contacts = Contact.where("firstname LIKE (?) OR lastname LIKE (?)", "%#{@query}%", "%#{@query}%");
	  
	  render :layout => false
  end
  
end
