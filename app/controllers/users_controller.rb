class UsersController < ApplicationController
  before_action :authenticate_user!

  load_and_authorize_resource

  def index
    @user = current_user
  end

  def show
    @user = current_user
    @display_doctors = appointments_count
  end

  def appointments_count
    doctors = Doctor.all
    @appointments = Appointment.all
    @valid_doctors = []
    doctors.each do |doctor|
      if @appointments.where(doctor_id: doctor.id).count < 11
        @valid_doctors << doctor
      else
        @valid_doctors.delete(doctor)
      end
    end
    @valid_doctors.uniq
  end
end
