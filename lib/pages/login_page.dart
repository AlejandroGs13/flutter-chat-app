import 'package:chat_private/models/labels_login_reg.dart';
import 'package:chat_private/widgets/blue_buttom.dart';
import 'package:chat_private/widgets/custom_input.dart';
import 'package:chat_private/widgets/labels.dart';
import 'package:chat_private/widgets/logo.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F2F2),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Logo(title: 'Hide On Bush'),
                  _Form(),
                  Labels(
                      labels:
                          LabelLoginReg('No tienes cuenta?', 'Crea una ahora!'),
                      route: 'register'),
                  const Text('Terminos y condiciones',
                      style: TextStyle(color: Colors.grey, fontSize: 12))
                ]),
          ),
        ),
      ),
    );
  }
}

class _Form extends StatefulWidget {
  @override
  State<_Form> createState() => __FormState();
}

class __FormState extends State<_Form> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.07),
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: <Widget>[
          CustomImput(
            icon: Icons.mail_outline,
            placeholder: 'Correo',
            keyboardType: TextInputType.emailAddress,
            controller: emailController,
          ),
          CustomImput(
            icon: Icons.lock_outline,
            placeholder: 'Contrase??a',
            controller: passwordController,
            obscureText: true,
          ),
          BlueButtom(
            textButton: 'Iniciar sesi??n',
            onPressed: () {
              print(emailController.text);
              print(passwordController.text);
            },
          )
        ],
      ),
    );
  }
}
