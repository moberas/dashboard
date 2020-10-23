import 'package:flutter/material.dart';
import 'package:moberas_dashboard/commons/busy_overlay.dart';
import 'package:moberas_dashboard/commons/email_text_field.dart';
import 'package:moberas_dashboard/commons/login_button.dart';
import 'package:moberas_dashboard/commons/password_text_field.dart';
import 'package:moberas_dashboard/commons/validators.dart';
import 'package:stacked/stacked.dart';
import 'package:string_validator/string_validator.dart';

import 'login_viewmodel.dart';

class LoginView extends StatefulWidget with Validators {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final formKey = GlobalKey<FormState>();

  TextEditingController emailController;
  FocusNode emailFocusNode;

  TextEditingController passwordController;
  FocusNode passwordFocusNode;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController(text: 'moberas.dev@gmail.com');
    emailFocusNode = FocusNode();
    passwordController = TextEditingController(text: 'acesso@moberas');
    passwordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    passwordController.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  String validateEmail(String value) {
    if (!isEmail(value.trim())) {
      return 'e-mail inválido';
    }
    return null;
  }

  String validatePassword(String value) {
    if (value.trim().isEmpty) {
      return 'por favoir informe a senha';
    } else if (value.length < 6) {
      return 'senha deve possuir mais de 6 caracteres';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
        viewModelBuilder: () => LoginViewModel(),
        builder: (context, model, child) => Scaffold(
              bottomNavigationBar: Padding(
                padding: EdgeInsets.only(bottom: 20, left: 10, right: 10),
                child: LoginButton(
                  key: ValueKey('loginbutton'),
                  icon: Icons.transit_enterexit,
                  color: Colors.grey,
                  text: 'Login',
                  loginMethod: () async {
                    if (!formKey.currentState.validate()) {
                      return Future.value(null);
                    } else {
                      return model.login(
                          email: emailController.text,
                          password: passwordController.text);
                    }
                  },
                ),
              ),
              body: BusyOverlay(
                show: model.isBusy,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomRight,
                        colors: <Color>[
                          Theme.of(context).primaryColor,
                          Colors.white
                        ]),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Form(
                      key: formKey,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: EmailTextField(
                                key: ValueKey('emailinput'),
                                controller: emailController,
                                focusNode: emailFocusNode,
                                validator: (value) => validateEmail(value),
                                onFieldSubmitted: (_) {
                                  emailFocusNode.unfocus();
                                  FocusScope.of(context)
                                      .requestFocus(passwordFocusNode);
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: PasswordTextFormField(
                                  key: ValueKey('passwordinput'),
                                  controller: passwordController,
                                  focusNode: passwordFocusNode,
                                  onFieldSubmitted: (_) => null,
                                  validator: (value) =>
                                      validatePassword(value)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ));
  }
}
