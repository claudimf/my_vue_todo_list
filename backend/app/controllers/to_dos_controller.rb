class ToDosController < ApplicationController
  before_action :set_to_do, only: %i[ show update destroy ]

  # GET /to_dos
  def index
    @to_dos = ToDo.all

    render json: @to_dos
  end

  # GET /to_dos/1
  def show
    render json: @to_do
  end

  # POST /to_dos
  def create
    @to_do = ToDo.new(to_do_params)

    if @to_do.save
      KafkaProducer.publish('todo_events', { action: 'created', todo: @todo })
      render json: @to_do, status: :created, location: @to_do
    else
      render json: @to_do.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /to_dos/1
  def update
    if @to_do.update(to_do_params)
      KafkaProducer.publish('todo_events', { action: 'updated', todo: @todo })
      render json: @to_do
    else
      render json: @to_do.errors, status: :unprocessable_entity
    end
  end

  # DELETE /to_dos/1
  def destroy
    if @to_do.destroy!
      KafkaProducer.publish('todo_events', { action: 'deleted', todo: todo })
      render json: { message: 'Deleted' }, status: :ok
    else
      render json: @to_do.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_to_do
      @to_do = ToDo.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def to_do_params
      params.require(:todo).permit(:title, :completed)
    end
end
