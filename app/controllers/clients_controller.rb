class ClientsController < ApplicationController
  def index
    @clients = Client.all
  end
  def new
    @client = Client.new
  end

  def create
    client = Client.new(client_params)
    if client.save
      flash[:notice] = "#{client.name} created"
      redirect_to clients_path
    else
      flash[:error] = "#{params.fetch(:name)} could not be created"
      redirect_to new_client_path
    end
  end

  private

  def client_params
    params.require(:client).permit(:name)
  end
end
