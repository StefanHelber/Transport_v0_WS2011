class TransportLinksController < ApplicationController
  # GET /transport_links
  # GET /transport_links.json
  def index
    @transport_links = TransportLink.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @transport_links }
    end
  end

  # GET /transport_links/1
  # GET /transport_links/1.json
  def show
    @transport_link = TransportLink.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @transport_link }
    end
  end

  # GET /transport_links/new
  # GET /transport_links/new.json
  def new
    @transport_link = TransportLink.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @transport_link }
    end
  end

  # GET /transport_links/1/edit
  def edit
    @transport_link = TransportLink.find(params[:id])
  end

  # POST /transport_links
  # POST /transport_links.json
  def create
    @transport_link = TransportLink.new(params[:transport_link])

    respond_to do |format|
      if @transport_link.save
        format.html { redirect_to @transport_link, notice: 'Transport link was successfully created.' }
        format.json { render json: @transport_link, status: :created, location: @transport_link }
      else
        format.html { render action: "new" }
        format.json { render json: @transport_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /transport_links/1
  # PUT /transport_links/1.json
  def update
    @transport_link = TransportLink.find(params[:id])

    respond_to do |format|
      if @transport_link.update_attributes(params[:transport_link])
        format.html { redirect_to @transport_link, notice: 'Transport link was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @transport_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transport_links/1
  # DELETE /transport_links/1.json
  def destroy
    @transport_link = TransportLink.find(params[:id])
    @transport_link.destroy

    respond_to do |format|
      format.html { redirect_to transport_links_url }
      format.json { head :ok }
    end
  end

  def optimize

    if File.exist?("Transportmodell_v3_Input_Instanz1.inc")
      File.delete("Transportmodell_v3_Input_Instanz1.inc")
    end
    f=File.new("Transportmodell_v3_Input_Instanz1.inc", "w")
    printf(f, "set i / \n")
    @sources = Source.find(:all)
    @sources.each { |so| printf(f, "i" + so.id.to_s + "\n") }
    printf(f, "/" + "\n\n")

    printf(f, "j / \n")
    @sinks = Sink.find(:all)
    @sinks.each { |si| printf(f, "j" + si.id.to_s + "\n") }
    printf(f, "/" + "\n\n")

    printf(f, "l / \n")
    @transport_links = TransportLink.find(:all)
    @transport_links.each { |li| printf(f, "l" + li.id.to_s + "\n") }
    printf(f, "/;" + "\n\n")


    printf(f, "LI(l,i) = no;\n")
    printf(f, "LJ(l,j) = no;\n\n")

    @transport_links.each do |li|
      printf(f, "LI( 'l" + li.id.to_s + "', 'i" + li.source_id.to_s + "') = yes;\n")
      printf(f, "LJ( 'l" + li.id.to_s + "', 'j" + li.sink_id.to_s + "') = yes;\n\n")
    end
    printf(f, "\n\n")

    printf(f, "Parameter\n  A(i) /\n")

    @sources.each { |so| printf(f, "i" + so.id.to_s + "  " + so.supply_quantity.to_s + "\n") }
    printf(f, "/" + "\n\n")

    printf(f, "\nN(j) /\n")

    @sinks.each { |si| printf(f, "j" + si.id.to_s + "  " + si.demand_quantity.to_s + "\n") }
    printf(f, "/" + "\n\n")

    printf(f, "\nc(l) /\n")

    @transport_links.each { |li| printf(f, "l" + li.id.to_s + "  " + li.unit_cost.to_s + "\n") }
    printf(f, "/" + "\n\n")

    printf(f, ";\n")
    f.close


    if File.exist?("Transportmengen_v2.txt")
      File.delete("Transportmengen_v2.txt")
    end


    system "gams Transportmodell_v2"

    fi=File.open("Transportmengen_v2.txt", "r")
    fi.each { |line| # printf(f,line)
      sa=line.split(";")
      sa0=sa[0].delete "l "
      sa3=sa[3].delete " \n"
      al=TransportLink.find_by_id(sa0)
      al.transport_quantity=sa3
      al.save

    }

    fi.close


    @transport_links = TransportLink.find(:all)
    render :template => "transport_links/index"

  end

end
