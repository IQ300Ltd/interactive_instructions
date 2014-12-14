class InstructionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def index
    @instructions = current_user.instructions
  end

  def new
    @instruction = Instruction.new(user: current_user)
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
        respond_to do |format|
          format.html
          format.json { render json: @instruction.to_json }
        end
    else
      redirect_to instructions_path
    end
  end

  def create
    @instruction = Instruction.new(instruction_params)
    @instruction.token = SecureRandom.hex
    @instruction.save
    render json: @instruction
  end

  def statistic
    instruction = Instruction.friendly.find(params[:id])
    @steps = instruction.steps
  end

  private

  def instruction_params
    params.require(:instruction).permit(:title, :description,
      steps_attributes: [:id, :title,
        videos_attributes: [:id, :video_source],
        texts_attributes: [:id, :text_description],
        images_attributes: [:id, :image_source]
      ]
    )
  end
end
