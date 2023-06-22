import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/custom_button_widget.dart';
import '../widgets/custom_text_button_widget.dart';
import '../widgets/custom_text_input_field_widget.dart';
import '../widgets/social_button_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if(_auth.currentUser != null){
        Navigator.of(context).pushNamed("/home");
      }
    });
    super.initState();
  }

  void _login() async {
    try {
      final user =await _auth.signInWithEmailAndPassword(email: _emailController.text, password: _passwordController.text);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Login efetuado com sucesso!")));
      Navigator.of(context).pushNamed("/home");
    } on FirebaseAuthException catch (err) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(err.message.toString()),
        backgroundColor: Colors.red,
      ));
    }
  }

  void _register() async {
    Navigator.of(context).pushNamed("/register");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Image.asset("assets/images/Logo.png"),
              ),
              const SizedBox(height: 20,),
              CustomTextInputField(hintText: "Email", keyboardType: TextInputType.text,editingController: _emailController,),
              const SizedBox(height: 20,),
              CustomTextInputField(hintText: "Senha", keyboardType: TextInputType.visiblePassword,editingController: _passwordController,),
              const SizedBox(height: 30,),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 22.0),
                    child: CustomTextButton(label: "Esqueceu a senha?"),
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              CustomButton(buttonText: "Entrar", onPressed: _login,),
              const SizedBox(height: 20,),
              Center(child: Text("ou",
                style: GoogleFonts.poppins(
                    textStyle: Theme.of(context).textTheme.labelMedium,
                    fontWeight: FontWeight.w400,
                    fontSize: 16
                ),
              )),
              const SizedBox(height: 10,),
              const SocialButton(label: "Entrar com Google", imagePath: "assets/images/google.png"),
              const SizedBox(height: 10,),
              const SocialButton(label: "Entrar com Apple", imagePath: "assets/images/apple.png"),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Não tem conta?",
                    style: GoogleFonts.poppins(
                        textStyle: Theme.of(context).textTheme.labelMedium,
                        fontWeight: FontWeight.w400,
                        fontSize: 16
                    ),
                  ),
                  CustomTextButton(label: "Registre-se agora", onPressed: _register),
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}
