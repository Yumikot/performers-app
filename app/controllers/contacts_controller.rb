class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  def index
    @contacts = Contact.all
  end

  
  def show
  end

  
  def new
    @contact = Contact.new
  end


  
  def create
    @contact = Contact.new(contact_params)

    if @contact.valid?
      # OK。確認画面を表示
      render :action => 'show'
    else
      # NG。入力画面を再表示
      render :action => 'new'
    end
  end


  def complete
    # メール送信
    @contact = Contact.new(contact_params)
    if params[:back]
      render :action => 'index'
    else
      ContactMailer.send_mail(@contact).deliver
      # 完了画面を表示
      render :action => 'complete'
    end
  end

  def edit
  end
  
  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to @contact, notice: 'Contact was successfully updated.' }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: 'Contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def contact_params
      params.require(:contact).permit(:name, :email, :content)
    end
end
