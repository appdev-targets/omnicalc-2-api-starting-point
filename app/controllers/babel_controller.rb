class BabelController < ApplicationController
  def translate_results
    @user_text = params.fetch("original_text")
    @recipient_number = params.fetch("send_to", false)

    require "google/cloud/translate"

    gt_client = Google::Cloud::Translate.new({ :version => :v2 })
    
    @translated_text = gt_client.translate("Hello, world!", { :to => "es" })

    if @recipient_number.present?
      twilio_sid = ENV.fetch("TWILIO_ACCOUNT_SID")

      twilio_token = ENV.fetch("TWILIO_AUTH_TOKEN")
      
      twilio_sending_number = ENV.fetch("TWILIO_SENDING_NUMBER")

      # Create an instance of the Twilio Client and authenticate with your API key
      twilio_client = Twilio::REST::Client.new(twilio_sid, twilio_token)

      # Craft your SMS as a Hash with three keys
      sms_parameters = {
        :from => twilio_sending_number,
        :to => @recipient_number, # Put your own phone number here if you want to see it in action
        :body => @translated_text
      }

      # Send your SMS!
      twilio_client.api.account.messages.create(sms_parameters)
    end

    render({ :template => "babel_templates/translate_results.html.erb" })
  end

  def translate_form

    render({ :template => "babel_templates/translate_form.html.erb" })
  end
end