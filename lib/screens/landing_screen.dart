//Libraries
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/landing_medication_widget.dart';

//Creating a Stateful widget
class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}
//Page controller for the dot navigation
class _LandingScreenState extends State<LandingScreen> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    }
  }
//For dot navigation movement
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onHorizontalDragEnd: (DragEndDetails details) {
          if (details.velocity.pixelsPerSecond.dx > 0) {
            // Swiped Right
            if (_currentPage > 0) {
              _pageController.previousPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease,
              );
            }
          } else if (details.velocity.pixelsPerSecond.dx < 0) {
            // Swiped Left
            if (_currentPage < 2) {
              _pageController.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease,
              );
            }
          }
        },
        child: PageView(
          controller: _pageController,
          onPageChanged: (int page) {
            setState(() {
              _currentPage = page;
            });
          },
          //Order of the Page arranged along with other pages for dot navigation
          children: [
            LandingPageItem(
              skip: '',
              logo: Image.asset('assets/images/Logo.png'),
              picture: Image.asset('assets/images/pic.png'),
              background:Image.asset('assets/images/blob.png'),
              greeting: 'BEM VINDO!',
              text: 'Fique por dentro de sua jornada de saúde com nosso aplicativo rastreador fácil de usar.',
            ),
            const LandingMedicationWidget(),
          ],
        ),
      ),
      //Bottom dots arrangement
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20.0), // Add the desired padding
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < 2; i++)
              if (_currentPage == i)
                NavigationDot(isActive: true)
              else
                NavigationDot(isActive: false)
          ],
        ),
      ),
    );
  }
}
//to make widgets
class LandingPageItem extends StatelessWidget {
  final Widget logo;
  final Widget picture;
  final Widget background;
  final String greeting;
  final String text;
  final String skip;

  LandingPageItem({
    required this.logo,
    required this.picture,
    required this.background,
    required this.greeting,
    required this.text,
    required this.skip,
  });
//building the actual page
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 40.0),
          child: logo,
        ),
        const SizedBox(height: 40),
        Stack(
          alignment: Alignment.center,
          children: [
            Padding(padding: const EdgeInsets.only(left: 115),
              child: background,
            ),
            Positioned.fill(
              child: picture,
            ),
          ],
        ),
        const SizedBox(height: 40),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              greeting,
              style: GoogleFonts.poppins(
                fontSize: 44,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              text,
              style: GoogleFonts.poppins(
                fontSize: 17,
                fontWeight: FontWeight.normal,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ),
      ],
    );
  }
}


//stateless widget for navigation dots
class NavigationDot extends StatelessWidget {
  final bool isActive;

  NavigationDot({required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: isActive ? 40 : 10,
      height: 10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(isActive ? 5 : 10),
        color: isActive ? Colors.deepPurple : const Color(0xFF7174A7),
      ),
    );
  }
}
