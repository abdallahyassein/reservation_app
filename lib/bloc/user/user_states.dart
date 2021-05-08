abstract class UserStates {}

class UnLoggedState extends UserStates {}

class LoadingState extends UserStates {}

class LoggedState extends UserStates {}

class LogFailedState extends UserStates {
  final String failedMessage;
  LogFailedState(this.failedMessage);
}

class RegisteredSuccessfullyState extends UserStates {
  final String successMessage;
  RegisteredSuccessfullyState(this.successMessage);
}

class RegisterFailedState extends UserStates {
  final String failedMessage;
  RegisterFailedState(this.failedMessage);
}

class LoggedOutState extends UserStates {}
