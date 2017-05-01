# frozen_string_literal: true
# missing top-level class documentation comment
class CheckRecordsController < ApplicationController
  before_action :find_event
  before_action :find_checkrecord, only: [:edit, :update, :destroy]
  def index
    @checkrecords = @event.check_records

    respond_to do |format|
      format.html
      format.json { render json: @checkrecords, include: { check_point: { only: :name }, attendee: { only: :name } } }
    end
  end

  def create
    @checkrecord = CheckRecord.new(checkrecord_params)
    return redirect_to check_records_path, notice: I18n.t('checkrecord.created') if @checkrecord.save
    render :new
  end

  def edit; end

  def update
    return redirect_to check_records_path, notice: I18n.t('checkrecord.updated') if @checkrecord.update_attributes(checkrecord_params)
    render :edit
  end

  def destroy
    @checkrecord.destroy
    redirect_to check_records_path, notice: I18n.t('checkrecord.removed')
  end

  private

  def checkrecord_params
    params.require(:check_record).permit(:attendee_id, :checkpoint_id, :times)
  end

  def find_checkrecord
    @checkrecord = @event.check_records.find_by(id: params[:id])
  end

  def find_event
    @event = current_user.events.find(params[:event_id])
  end
end
