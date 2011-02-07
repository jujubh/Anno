class PartofspeechesController < ApplicationController
  # GET /partofspeeches
  # GET /partofspeeches.xml
  def index
    @partofspeeches = Partofspeech.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @partofspeeches }
    end
  end

  # GET /partofspeeches/1
  # GET /partofspeeches/1.xml
  def show
    @partofspeech = Partofspeech.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @partofspeech }
    end
  end

  # GET /partofspeeches/new
  # GET /partofspeeches/new.xml
  def new
    @partofspeech = Partofspeech.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @partofspeech }
    end
  end

  # GET /partofspeeches/1/edit
  def edit
    @partofspeech = Partofspeech.find(params[:id])
  end

  # POST /partofspeeches
  # POST /partofspeeches.xml
  def create
    @partofspeech = Partofspeech.new(params[:partofspeech])

    respond_to do |format|
      if @partofspeech.save
        flash[:notice] = 'Partofspeech was successfully created.'
        format.html { redirect_to(@partofspeech) }
        format.xml  { render :xml => @partofspeech, :status => :created, :location => @partofspeech }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @partofspeech.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /partofspeeches/1
  # PUT /partofspeeches/1.xml
  def update
    @partofspeech = Partofspeech.find(params[:id])

    respond_to do |format|
      if @partofspeech.update_attributes(params[:partofspeech])
        flash[:notice] = 'Partofspeech was successfully updated.'
        format.html { redirect_to(@partofspeech) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @partofspeech.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /partofspeeches/1
  # DELETE /partofspeeches/1.xml
  def destroy
    @partofspeech = Partofspeech.find(params[:id])
    @partofspeech.destroy

    respond_to do |format|
      format.html { redirect_to(partofspeeches_url) }
      format.xml  { head :ok }
    end
  end
end
