import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/profile_button_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:Center(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: const Color(0xffd9d9d9),
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/group-4.png'),
                  ),
                ),
                margin: const EdgeInsets.only(top:50 ),
                // child: Image.asset("assets/images/pic.png"),
                height: 90,
                width: 90,
              ),
              const SizedBox(
                height: 10,
              ),
              Text ("Elvys Ferrari",style:GoogleFonts.poppins(
                textStyle: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,

                  height: 1.25,
                  letterSpacing: -0.16,
                  color: Color(0xff000000),
                ),
              ) ,),
              const SizedBox(
                height: 10,
              ),
              const Text("22 anos"),
              const SizedBox(
                height: 50,
              ),
              ProfileButtonWidget(btntitle: 'elvys_ferrari@gmail.com',icon: "assets/icons/Mail.png",),
              const SizedBox(height: 15,),
              ProfileButtonWidget(btntitle: '21/01/1992',icon:"assets/icons/date.png",),
              const SizedBox(height: 15,),
              ProfileButtonWidget(btntitle: 'Editar Perfil',icon:"assets/icons/Vector.png",width: 115,suffixIcon: Icons.arrow_forward_ios, onPressed: () { Navigator.pushNamed(context, "/settings"); },),
              const SizedBox(height: 15,),
              ProfileButtonWidget(btntitle: 'Trocar Senha',icon:"assets/icons/password.png",width: 90,suffixIcon: Icons.arrow_forward_ios,),
              const SizedBox(height: 15,),
              ElevatedButton(onPressed: (){},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero, backgroundColor: const Color(0xfff8f8f6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 2,
                    shadowColor: const Color(0xfff8f8f6),
                  ),
                  child:Container(
                      height: 60,
                      width: 350,
                      alignment: Alignment.center,
                      child: Text("SAIR",
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,

                              height: 1.25,
                              letterSpacing: -0.16,
                              color: Color(0xffff4747),
                            ),
                          )))),
              const SizedBox(height: 15,),

            ],
          ),
        ),
      ),

    );

  }
}


