class Admin::ConcertsController < Admin::BaseController

  before_action :load_concert, except: [:index, :create]

  def index
    @concerts = Concert.order('date DESC')
    @concert = Concert.new
  end

  def show
  end

  def update
    if @concert.update(concert_params)
      redirect_to admin_concerts_path, notice: 'Concert Modifié'
    else
      render :show
    end
  end

  def create
    @concert = Concert.new(concert_params)

    if @concert.save
      redirect_to admin_concerts_path, notice: 'Concert Ajouté'
    else
      @concerts = Concert.order('date DESC')
      render :index
    end
  end

  def destroy
    if @concert.destroy
      redirect_to admin_concerts_path, notice: 'Concert Supprimé'
    else
      redirect_to admin_concerts_path, error: 'Erreur pendant la suppréssion'
    end

  end

  private

    def concert_params
      params.require(:concert).permit(:date, :town, :country, :hall, :works_by, :description)
    end

    def load_concert
      @concert = Concert.find(params[:id])
    end
end