class InstructionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def index
    @instructions = current_user.instructions
  end

  def new
    @instruction = Instruction.new
    respond_to do |format|
      format.html
      format.json { render json: @instruction.to_json }
    end
  end

  def show
    @instruction = Instruction.friendly.find(params[:id])
    if current_user && current_user == @instruction.user ||
      params[:token] == @instruction.token
        @steps = @instruction.steps
    else
      redirect_to instructions_path
    end
  end

  def create
    @instruction = Instruction.new(instruction_params)
    @instruction.user = current_user
    @instruction.token = SecureRandom.hex
    @instruction.save
    redirect_to instruction_path(@instruction)
  end

  def statistic
    instruction = Instruction.friendly.find(params[:id])
    @steps = instruction.steps
  end

  private

  def instruction_params
    params.require(:instruction).permit(:title, :description, :image,
      steps_attributes: [:id, :title, :image, :description,
        videos_attributes: [:id, :video_source],
        texts_attributes: [:id, :text_description],
        images_attributes: [:id, :image_source]
      ]
    )
  end
end
