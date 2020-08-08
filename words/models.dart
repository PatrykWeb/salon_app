class Words {
  //Login
  String nameCompany, email, password, logButtonText, textRegister;
  //END Login

  //Errors
  String errorEmail, errorPassword, errorNameSurname, errorNumberPhone;
  //END Errors

  // Notification
  String notificationLogin, notificationRegister, notificationLogout;
  //END Notification

  //Register
  String appBarRegister,
      emailRegister,
      passwordRegister,
      nameSurname,
      numberPhone,
      buttonRegister;
  //END Register

  //Home
  String appNameHome,
      navigationBottomHome,
      navigationBottomAccount,
      navigationBottomSettings,
      navigationBottomRegister;

  //Home_menu 
  String registerServices, employeeSectionNameJson, detailsSectionNameJson, scrollRightText, scrollRightDetails;

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
    this.navigationBottomHome, 
    this.navigationBottomAccount, 
    this.navigationBottomSettings, 
    this.navigationBottomRegister, 
    this.registerServices,
    this.employeeSectionNameJson, 
    this.detailsSectionNameJson, 
    this.scrollRightText, 
    this.scrollRightDetails
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
        appNameHome: json["appNameHome"],
        navigationBottomHome: json["navigationBottomHome"],
        navigationBottomAccount: json["navigationBottomAccount"],
        navigationBottomSettings: json["navigationBottomSettings"],
        navigationBottomRegister: json["navigationBottomRegister"],
        registerServices: json["registerServices"], 
        employeeSectionNameJson: json['employeeSectionNameJson'], 
        detailsSectionNameJson: json["detailsSectionNameJson"], 
        scrollRightText: json["scrollRightText"], 
        scrollRightDetails: json["scrollRightDetails"]
        );
        
  }
}
