class MathController < ApplicationController
  def add_results
    # params looks like
    # Parameters: {"first_number"=>"6", "second_number"=>"3"}

    @first = params.fetch("first_number").to_f
    @second = params.fetch("second_number").to_f

    @result = @first + @second

    render({ :template => "math_templates/addition_results.html.erb" })
  end

  def add_form
    render({ :template => "math_templates/addition_form.html.erb" })
  end
end