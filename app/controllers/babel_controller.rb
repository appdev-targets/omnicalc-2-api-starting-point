class BabelController < ApplicationController
  def translate_results
    @user_text = params.fetch("original_text")

    require "google/cloud/translate"

    gt_client = Google::Cloud::Translate.new({ :version => :v2 })

    @translated_text = translation = gt_client.translate(@user_text, { :to => "es" })

    render({ :template => "babel_templates/translate_results.html.erb" })
  end

  def translate_form

    render({ :template => "babel_templates/translate_form.html.erb" })
  end
end