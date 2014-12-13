class InstructionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]

  def index
    @instructions = Instruction.all
  end

  def new
    @instruction = Instruction.new(user: current_user)
  end

  def show
    instruction = Instruction.friendly.find(params[:id])
    @steps = instruction.steps
  end

  def create
    @instruction = Instruction.create(instruction_params)
    render json: @instruction
  end

  def statistic
    instruction = Instruction.friendly.find(params[:id])
    @steps = instruction.steps
  end

  private

  def instruction_params
    params.require(:instruction).permit(:title, :description,
      steps_attributes: [:id, :title, :position,
        videos_attributes: [:id, :video_source, :position],
        texts_attributes: [:id, :text_description, :position],
        images_attributes: [:id, :image_source, :position]
      ]
    )
  end
end
