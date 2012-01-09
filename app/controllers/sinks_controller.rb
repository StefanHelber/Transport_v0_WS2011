class SinksController < ApplicationController
  # GET /sinks
  # GET /sinks.json
  def index
    @sinks = Sink.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sinks }
    end
  end

  # GET /sinks/1
  # GET /sinks/1.json
  def show
    @sink = Sink.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sink }
    end
  end

  # GET /sinks/new
  # GET /sinks/new.json
  def new
    @sink = Sink.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sink }
    end
  end

  # GET /sinks/1/edit
  def edit
    @sink = Sink.find(params[:id])
  end

  # POST /sinks
  # POST /sinks.json
  def create
    @sink = Sink.new(params[:sink])

    respond_to do |format|
      if @sink.save
        format.html { redirect_to @sink, notice: 'Sink was successfully created.' }
        format.json { render json: @sink, status: :created, location: @sink }
      else
        format.html { render action: "new" }
        format.json { render json: @sink.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sinks/1
  # PUT /sinks/1.json
  def update
    @sink = Sink.find(params[:id])

    respond_to do |format|
      if @sink.update_attributes(params[:sink])
        format.html { redirect_to @sink, notice: 'Sink was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @sink.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sinks/1
  # DELETE /sinks/1.json
  def destroy
    @sink = Sink.find(params[:id])
    @sink.destroy

    respond_to do |format|
      format.html { redirect_to sinks_url }
      format.json { head :ok }
    end
  end
end
