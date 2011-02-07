class NormsController < ApplicationController
  # GET /norms
  # GET /norms.xml
  def index
    @norms = Norm.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @norms }
    end
  end

  # GET /norms/1
  # GET /norms/1.xml
  def show
    @norm = Norm.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @norm }
    end
  end

  # GET /norms/new
  # GET /norms/new.xml
  def new
    @norm = Norm.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @norm }
    end
  end

  # GET /norms/1/edit
  def edit
    @norm = Norm.find(params[:id])
  end

  # POST /norms
  # POST /norms.xml
  def create
    @norm = Norm.new(params[:norm])

    respond_to do |format|
      if @norm.save
        flash[:notice] = 'Norm was successfully created.'
        format.html { redirect_to(@norm) }
        format.xml  { render :xml => @norm, :status => :created, :location => @norm }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @norm.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /norms/1
  # PUT /norms/1.xml
  def update
    @norm = Norm.find(params[:id])

    respond_to do |format|
      if @norm.update_attributes(params[:norm])
        flash[:notice] = 'Norm was successfully updated.'
        format.html { redirect_to(@norm) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @norm.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /norms/1
  # DELETE /norms/1.xml
  def destroy
    @norm = Norm.find(params[:id])
    @norm.destroy

    respond_to do |format|
      format.html { redirect_to(norms_url) }
      format.xml  { head :ok }
    end
  end
end
