class Api::ServiceProvidersController < Api::ApiController	
	# before_action :set_service_provider, only: [:show, :edit, :update, :destroy]
	respond_to :html, :json
	
	def index
  	@service_providers = ServiceProvider.all
  	render json: @service_providers
  end

  def create
    service_provider = ServiceProvider.new
    service_provider.firstname = params[:firstname]
    service_provider.lastname = params[:lastname]

    if service_provider.save
      respond_with(service_provider, :location => api_service_provider_path(service_provider))
    else
      respond_with(service_provider)
    end
  end

  def update
    @service_provider = ServiceProvider.find(params[:id].to_i)    
    firstname = params[:firstname].blank? ? @service_provider.firstname : params[:firstname]
    lastname = params[:lastname].blank? ?  @service_provider.lastname : params[:lastname]
    @service_provider.update_attributes!(:firstname => firstname, :lastname => lastname)
     
    if @service_provider.save
      respond_with(@service_provider, :location => api_service_provider_path(@service_provider))
    else
      respond_with(service_provider)
    end
  end

  def destroy
    @service_provider = ServiceProvider.find(params[:id].to_i)
    @service_provider.destroy  
    respond_with(@service_provider)
  end

  def show
    @service_provider = ServiceProvider.find(params[:id].to_i)
    render json: @service_provider
  end

  def get_service_providers
    query = {}
    @service_providers = []
    if !params[:id].blank?
      query[:id] =  params[:id].to_i
    end
    if !params[:firstname].blank?
      query[:firstname] =  params[:firstname]
    end 
    if !params[:lastname].blank?
      query[:lastname] =  params[:lastname]
    end 

    @service_providers = ServiceProvider.where(query) 
    render json: @service_providers
  end

end