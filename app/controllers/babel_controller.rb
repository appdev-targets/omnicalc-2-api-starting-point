class BabelController < ApplicationController
  def translate_results
    @user_text = params.fetch("original_text")
    @target_lang = params.fetch("target_language", "es")
    @recipient_number = params.fetch("send_to", false)

    # Translate into target language and SMS (if number provided).

    render({ :template => "babel_templates/translate_results.html.erb" })
  end

  def translate_form
    render({ :template => "babel_templates/translate_form.html.erb" })
  end
end