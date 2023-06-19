class SignUpWithEmailAndPasswordFailure{

  late final String message;
  SignUpWithEmailAndPasswordFailure([this.message = 'An Unknown error occurred.']);

  factory SignUpWithEmailAndPasswordFailure.code(String code){
    switch(code){
      case 'weak-password':
        return SignUpWithEmailAndPasswordFailure('Please enter a stronger password.');
      case 'invalid-email':
        return SignUpWithEmailAndPasswordFailure('Email is not valid or badly formatted.');

      case 'email-already-in-use':
        return SignUpWithEmailAndPasswordFailure('An account already exist by using this email.');
      case 'operation-not-allowed':
        return SignUpWithEmailAndPasswordFailure('Operation is not allowed. Please contact support.');

      case 'user-disable':
        return SignUpWithEmailAndPasswordFailure('This user has been disable. Please contact support for help.');
      default: return SignUpWithEmailAndPasswordFailure();
    }
  }

}
