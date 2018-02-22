class HomeController < ApplicationController
  def index
  	
	
  end

  def subscribe
  	@subscriber = Subscriber.new(subscriber_params)

	@key = "21a14fdeb3840c84411afffdc1a1483e-us17"
	@id = "3b6b74e891"

	
  gibbon = Gibbon::Request.new(api_key: @key)


  gibbon.lists(@id).members.create(body: {email_address: @subscriber.email, status: "subscribed", merge_fields: {FNAME: @subscriber.name, LNAME: "Last Name"}})


	
	if @subscriber.save #Redirection vers la view 'show' qui affiche les détails et les options du nouveau ragot
      redirect_to home_index_path
    else
      render 'index' #Redirection vers la page 'new' en cas d'échec de création d'un nouveau ragot
    end
  end

  def show
  	@email = user_params
  end

   private #on ne récupère de la view que les données qui nous intéressent (anonyme_user et content) - placé ici dans le script par convention
    def subscriber_params
      params.permit(:email, :name)
    end

end
