import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:Center(
          child: Column(
            children: [
              Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: Image.asset("assets/images/back.png"),
                onPressed: () {
                  Navigator.pop(context);
                  // TODO: Implement back button functionality
                },
              ),
            ),
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
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 20),
                child: const Text("NOTIFICATION SETTING",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 13
                  ),),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero, backgroundColor: const Color(0xfff8f8f6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 2,
                  shadowColor: const Color(0xfff8f8f6),
                ),
                child: Container(
                  height: 60,
                  width: 350,
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(left: 30),
                  child: Text(
                    "Notifications",
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,

                        height: 1.25,
                        letterSpacing: -0.16,
                        color: Color(0xff000000),
                      ),

                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              const SizedBox(height: 50,),

              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 20),
                child: const Text("FEEDBACK",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 13
                  ),),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero, backgroundColor: const Color(0xfff8f8f6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 2,
                  shadowColor: const Color(0xfff8f8f6),
                ),
                child: Container(
                  height: 60,
                  width: 350,
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(left: 30),
                  child: Text(
                    "Send Feedacks",
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,

                        height: 1.25,
                        letterSpacing: -0.16,
                        color: Color(0xff000000),
                      ),

                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              const SizedBox(height: 30,),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero, backgroundColor: const Color(0xfff8f8f6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 2,
                  shadowColor: const Color(0xfff8f8f6),
                ),
                child: Container(
                  height: 60,
                  width: 350,
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(left: 30),
                  child: Text(
                    "Report Bugs",
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,

                        height: 1.25,
                        letterSpacing: -0.16,
                        color: Color(0xff000000),
                      ),

                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
