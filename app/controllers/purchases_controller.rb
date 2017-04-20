class PurchasesController < ApplicationController

  load_and_authorize_resource
  before_action :set_purchase, only: [:show, :edit, :update, :destroy]

  # GET /purchases
  # GET /purchases.json
  def index
    if current_user.has_role? :admin
      @purchases = Purchase.all
    else
      @purchases = current_user.purchases
    end
  end

  # GET /purchases/1
  # GET /purchases/1.json
  def show
  end

  # GET /purchases/new
  def new
    @purchase = Purchase.new
    @concert = Concert.find(params[:concert_id])
  end

  # GET /purchases/1/edit
  def edit
  end

  # POST /purchases
  # POST /purchases.json
  def create
    @purchase = Purchase.new(purchase_params)
    @purchase.user = current_user
    @purchase.concert_id = purchase_params[:concert_id]
    @purchase.payment_amount = (@purchase.ticket_quantity * @purchase.payment_amount)
    respond_to do |format|
      if @purchase.save
        if @purchase.make_transaction
        format.html { redirect_to @purchase, notice: 'Purchase was successfully created.' }
        format.json { render :show, status: :created, location: @purchase }
      else
        @concert = Concert.find(@purchase.concert_id)
          @purchase.destroy
          format.html { redirect_to @concert, :flash =>  { :error => 'Purchase failed.'} }
        end
      else
        format.html { render :new }
        format.json { render json: @purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /purchases/1
  # PATCH/PUT /purchases/1.json
  def update
    respond_to do |format|
      if @purchase.update(purchase_params)
        format.html { redirect_to @purchase, notice: 'Purchase was successfully updated.' }
        format.json { render :show, status: :ok, location: @purchase }
      else
        format.html { render :edit }
        format.json { render json: @purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purchases/1
  # DELETE /purchases/1.json
  def destroy
    @purchase.destroy
    respond_to do |format|
      format.html { redirect_to purchases_url, notice: 'Purchase was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchase
      @purchase = Purchase.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def purchase_params
      params.require(:purchase).permit(:ticket_quantity, :payment_amount, :response, :concert_id, :first_name, :last_name, :card_number, :card_expiry)
    end
end
