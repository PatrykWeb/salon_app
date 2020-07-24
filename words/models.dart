class Words {
  //Login
  String nameCompany;
  String email;
  String password;
  String logButtonText;
  String textRegister;
  //END Login

  //Errors
  String errorEmail;
  String errorPassword;
  String errorNameSurname; 
  String errorNumberPhone;
  //END Errors


  // Notification
  String notificationLogin;
  String notificationRegister;
  String notificationLogout;
  //END Notification

  //Register
  String appBarRegister;
  String emailRegister;
  String passwordRegister;
  String nameSurname;
  String numberPhone;
  String buttonRegister;
  //END Register

  //Home 
  String appNameHome;

  Words({
    this.nameCompany,
    this.email,
    this.password,
    this.logButtonText,
    this.textRegister,
    this.errorEmail,
    this.errorPassword,
    this.appBarRegister,
    this.emailRegister,
    this.passwordRegister, 
    this.errorNameSurname, 
    this.errorNumberPhone,
    this.nameSurname, 
    this.numberPhone,
    this.buttonRegister, 
    this.notificationLogin, 
    this.notificationRegister,
    this.notificationLogout,
    this.appNameHome,


  });

  factory Words.fromJson(Map<String, dynamic> json) {
    return Words(
        nameCompany: json["nameCompany"],
        email: json["email"],
        password: json["password"],
        logButtonText: json["logButtonText"],
        textRegister: json["textRegister"],
        errorEmail: json["errorEmail"],
        errorPassword: json["errorPassword"],
        errorNameSurname: json["errorNameSurname"],
        errorNumberPhone: json["errorNumberPhone"],
        appBarRegister: json["appBarRegister"], 
        emailRegister: json["emailRegister"],
        passwordRegister: json["passwordRegister"],
        nameSurname: json["nameSurname"],
        numberPhone: json["numberPhone"],
        buttonRegister: json["buttonRegister"], 
        notificationLogin: json["notificationLogin"], 
        notificationRegister: json["notificationRegister"],
        notificationLogout: json["notificationLogout"],
        appNameHome: json["appNameHome"]
  );
 
  }
}
