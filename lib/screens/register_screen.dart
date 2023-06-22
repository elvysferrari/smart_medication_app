import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/custom_button_widget.dart';
import '../widgets/custom_text_button_widget.dart';
import '../widgets/custom_text_input_field_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool _obscureTextPassword = true;
  bool _obscureTextPasswordConfirm = true;

  String _uid = "";
  final FirebaseAuth _auth = FirebaseAuth.instance;
  void registerhandler(){
    register();
  }
  Future<void> register() async {
    try {
      final user= await _auth.createUserWithEmailAndPassword(email: _emailController.text, password: _passwordController.text);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Conta criada com sucesso!")));
      Navigator.of(context).pushNamed("/home");
    } on FirebaseAuthException catch (err) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(err.message.toString()),
        backgroundColor: Colors.red,
      ));
    }
  }


  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: Column(
                children: [
                  const SizedBox(height: 30,),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Image.asset("assets/images/Logo.png"),
                  ),
                  const SizedBox(height: 20,),
                  CustomTextInputField(hintText: "Email", keyboardType: TextInputType.text,validator: (value){
                    final RegExp emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                    if(value == null || value.isEmpty ){
                      return "Email é obrigatório";
                    }
                    if(!emailValid.hasMatch(value)){
                      return "Entre com um email válido";
                    }
                    return null;
                  },editingController: _emailController,),
                  const SizedBox(height: 20,),
                  CustomTextInputField(hintText: "Senha", keyboardType: TextInputType.text,enablePasswordField: true,editingController: _passwordController,validator: (String? value){
                    if(value == null || value.isEmpty ){
                      return "Senha é obrigatório";
                    }
                    if(value.length < 8){
                      return "Senha deve ser maior que 8 caracteres";
                    }
                    if(_confirmPasswordController.text != value){
                      return "Senhas não são iguais";
                    }
                    return null;
                  },),
                  const SizedBox(height: 20,),
                  CustomTextInputField(hintText: "Confirmar Senha", keyboardType: TextInputType.text,editingController: _confirmPasswordController,validator: (String? value){
                    if(value == null || value.isEmpty ){
                      return "Senha é obrigatório";
                    }
                    if(value.length < 8){
                      return "Senha deve ser maior que 8 caracteres";
                    }
                    if(_passwordController.text != value){
                      return "Senhas não são iguais";
                    }
                    return null;
                  },),
                  const SizedBox(height: 30,),
                  CustomButton(buttonText: "Registrar", onPressed: register,),
                  const SizedBox(height: 130,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Já tem conta?",
                        style: GoogleFonts.poppins(
                            textStyle: Theme.of(context).textTheme.labelMedium,
                            fontWeight: FontWeight.w400,
                            fontSize: 16
                        ),
                      ),
                      CustomTextButton(label: "Entrar", onPressed: (){
                        Navigator.pop(context);
                      }),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
