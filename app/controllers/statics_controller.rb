class StaticsController < ApplicationController

 def home
  end

  def communaute
  end

  def inscription
  	
  end

  def subscribe

    @subscriber = Subscriber.new(subscriber_params)

  @key = "21a14fdeb3840c84411afffdc1a1483e-us17"
  @id = "3b6b74e891"

  
  gibbon = Gibbon::Request.new(api_key: @key)


  gibbon.lists(@id).members.create(body: {email_address: @subscriber.email, status: "subscribed", merge_fields: {FNAME: @subscriber.name, LNAME: "Last Name"}})

  
  if @subscriber.save 
    redirect_to root_path
    end

  end

  def peer
  end

  def programme
  end
  
  private #on ne récupère de la view que les données qui nous intéressent (anonyme_user et content) - placé ici dans le script par convention
    def subscriber_params
      params.permit(:email, :name)
    end

end
