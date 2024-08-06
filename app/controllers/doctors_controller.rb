class DoctorsController < ApplicationController
  before_action :authenticate_doctor!
  def index
    @doctor = current_doctor
  end

  def show
    @appointments = Appointment.where(doctor_id: current_doctor.id)
    @prescriptions = Prescription.where(appointment_id: current_doctor.id)
  end
end
