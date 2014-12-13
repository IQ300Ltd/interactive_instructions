class InstructionsController < ApplicationController
  def index
    @instructions = Instruction.all
  end

  def new
    @instruction = Instruction.new
  end

  def show
    instruction = Instruction.find params[:id]
    @steps = instruction.steps
  end

  def create
    @instruction = Instruction.create(instruction_params)
    render json: @instruction
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
