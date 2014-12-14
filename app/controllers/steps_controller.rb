class StepsController < ApplicationController

  def show
    @step = Step.find(params[:id])
    step_statistic = @step.step_statistic
    step_statistic.viewed_count += 1
    step_statistic.save
    render nothing: true, status: 200
  end

  def understand
    step = Step.find(params[:id])
    step_statistic = @step.step_statistic
    step_statistic.understand_count += 1
    step_statistic.save
    render nothing: true, status: 200
  end

end
