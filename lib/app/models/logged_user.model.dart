class LoggedUser {
  String userName;
  String email;
  String photo;
  LoggedUser({this.userName, this.email, this.photo});

  static final LoggedUser _loggedUser = new LoggedUser._internal();
  LoggedUser._internal();
  static LoggedUser get instance => _loggedUser;
}
