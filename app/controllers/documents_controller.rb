class DocumentsController < ApplicationController
  # GET /documents
  # GET /documents.xml
   
  def index
    @documents = Document.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @documents }
    end
  end

  # GET /documents/1
  # GET /documents/1.xml
  def show
    @document = Document.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @document }
    end
  end

  # GET /documents/new
  # GET /documents/new.xml
  def new
    @document = Document.new
    @annotation = Annotation.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @document }
    end
  end

  # GET /documents/1/edit
  def edit
    @document = Document.find(params[:id])
  end

  # POST /documents
  # POST /documents.xml
#  def create
#    @document = Document.new(params[:document])
#
#    respond_to do |format|
#      if @document.save
#        flash[:notice] = 'Document was successfully created.'
#        format.html { redirect_to(@document) }
#        format.xml  { render :xml => @document, :status => :created, :location => @document }
#      else
#        format.html { render :action => "new" }
#        format.xml  { render :xml => @document.errors, :status => :unprocessable_entity }
#      end
#    end
#  end


def create
    #@document = Document.new(params[:document])
    
    file_param = params[:create][:file]
    name = params[:create][:name]
    filedata = file_param.read

    @document = Document.create(:name => name)
    
    create_annotations(@document, filedata)

    respond_to do |format|
      if @document.save
        flash[:notice] = 'Document was successfully created.'
        format.html { redirect_to(@document) }
        format.xml  { render :xml => @document, :status => :created, :location => @document }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @document.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def create_annotations(document, filedata)
    annotationPosition = 1
    reachedData = false
    
    filedata.each do |line|
        if (line.chomp == "@DATA")
          reachedData = true
        else 
          if (reachedData == true)
            document.annotations.create(:line => line, :position => annotationPosition)
            annotationPosition+=1
          end
        end
    end
  end

def create_old
  @document = Document.new(params[:document])
  @annotation = @document.annotations.build(params[:annotation])
  if @document.save
    redirect_to :action => 'index'
  else
    render :action => 'new'
  end
end

  # PUT /documents/1
  # PUT /documents/1.xml
#  def update
#    @document = Document.find(params[:id])
#
#    respond_to do |format|
#      if @document.update_attributes(params[:document])
#        flash[:notice] = 'Document was successfully updated.'
#        format.html { redirect_to(@document) }
#        format.xml  { head :ok }
#      else
#        format.html { render :action => "edit" }
#        format.xml  { render :xml => @document.errors, :status => :unprocessable_entity }
#      end
#    end
#  end

def post
  @document = Document.find(params[:id])
  @document.attributes = params[:document]
  @document.annotations.each {|a| t.attributes = params[:annotation][a.id.to_s]}
    
  @document.annotations.token.each { |t| t.attributes = params[:token][t.id.to_s] }
  if @document.valid? && @document.annotations.all?(&:valid?)
    @document.save!
    @document.annotations.each(&:save!)
    @document.annotations.token.each(&:save!)
    redirect_to :action => 'show', :id => @document
  else
    render :action => 'edit'
  end

end

def update

  @document = Document.find(params[:id])
  
    @document.update_attributes(params[:document]) ?
      redirect_to(document_path(@document)) : render(:action => :edit)
      
end

  # DELETE /documents/1
  # DELETE /documents/1.xml
  def destroy
    @document = Document.find(params[:id])
    @document.destroy

    respond_to do |format|
      format.html { redirect_to(documents_url) }
      format.xml  { head :ok }
    end
  end
end
