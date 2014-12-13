class StepStatisticsController < ApplicationController

  def show
    step = Step.find(params[:step_id])
    render json: step.step_statistic.to_json
  end

end
