class LogInWithEmailAndPasswordFailure implements Exception {
  final String message;

  const LogInWithEmailAndPasswordFailure({this.message = 'Login failed'});

  factory LogInWithEmailAndPasswordFailure.fromCode(String code) {
    String errorMessage = 'Login failed';
    switch (code) {
      case 'invalid-email':
        errorMessage = 'Invalid email address';
        break;
      case 'user-disabled':
        errorMessage = 'This user has been disabled';
        break;
      // Handle other error codes as needed
      default:
        errorMessage = 'Login failed';
    }
    return LogInWithEmailAndPasswordFailure(message: errorMessage);
  }
}