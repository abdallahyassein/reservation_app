abstract class ReservationStates {}

class InitialState extends ReservationStates {}

class AddedAppointmentDateState extends ReservationStates {}

class AddedImageState extends ReservationStates {}

class LoadingReservationState extends ReservationStates {}

class FailedReservationState extends ReservationStates {
  final String failedMessage;
  FailedReservationState(this.failedMessage);
}

class SuccessedReservationState extends ReservationStates {
  final String successMessage;
  SuccessedReservationState(this.successMessage);
}
