class StepsController < ApplicationController

  def show
    @step = Step.find(params[:id])
    if @step.present?
      step_statistic = @step.step_statistic
      step_statistic.viewed_count += 1
      step_statistic.save
    end
    render json: @step.to_json
  end

end
