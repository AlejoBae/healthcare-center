class AppointmentsController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]

  def index
    @user = current_user || current_doctor
    @appointments = @user.appointments
    @appointment = @user.appointments.find_by(params[:id])
    if @appointments.blank?
      nil
    else
      @prescription = @appointment.prescription
    end
  end

  def show
    @user = current_user
    @prescription = Prescription.find_by(params[:appointment_id])
    @appointment = Appointment.find(params[:id])
  end

  def new
    @user = current_user
    doctor = Doctor.find_by(id: params[:doctor_id])
    @appointment = current_user.appointments.new(doctor:)
  end

  def create
    @appointment = current_user.appointments.new(appointment_params)
    if @appointment.save
      redirect_to @appointment
      flash[:notice] = 'Your appointment was successfully created'
    else
      render :new, alert: 'An error has occurred while creating an appointment'
    end
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy!
    redirect_to appointments_path(current_user.id), notice: 'Appointment was canceled successfully!'
  end

  def check_status(appointment)
    @appointment = Appointment.find_by(params[:id])
    @prescriptions = Prescription.all
    @prescription = @appointment.prescription
    appointment.status = 1 if appointment.recomendation?
  end

  private

  def appointment_params
    params.require(:appointment).permit(:appointment_date, :doctor_id, :user_id)
  end
end
