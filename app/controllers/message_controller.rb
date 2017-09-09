class MessagesController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  
  def index
    @tasks = Message.all.page(params[:page]).per(20)
  end

  def show
  end

  def new
    @task = Message.new
  end

  def create
    @task = Message.new(task_params)

    if @task.save
      flash[:success] = 'task が正常に投稿されました'
      redirect_to @task
    else
      flash.now[:danger] = 'task が投稿されませんでした'
      render :new
    end
  end

  def edit
  end

  def update

    # デバッグ
    binding.pry
    
    if @task.update(task_params)
      flash[:success] = 'Task は正常に更新されました'
      redirect_to @task
    else
      flash.now[:danger] = 'Task は更新されませんでした'
      render :edit
    end
  end

  def destroy
    @task.destroy

    flash[:success] = 'Task は正常に削除されました'
    redirect_to tasks_url
  end

  private

  def set_task
    @task = Message.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:content, :title)
  end
end