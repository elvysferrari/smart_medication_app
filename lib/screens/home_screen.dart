import 'package:flutter/material.dart';
import 'package:smart_medication_app/screens/profile_screen.dart';
import '../constants/pallet_colors.dart';
import 'add_medication_screen.dart';
import 'calendar_screen.dart';
import 'login_screen.dart';
import 'medication_list_screen.dart';
import 'medication_plans_screen.dart';
import 'medication_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List of pages to be displayed in the Bottom Nav Bar
  List<Widget> pages = [
    const MedicationListScreen(),
    const CalendarScreen(), // Index 1
    const MedicationPlansScreen(), // Index 2
    const ProfileScreen(), // Index 3
    //const LoginScreen(), // Index 0
  ];

  int _selectedIndex = 0;
  final ScrollController _homeController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  AddMedicationScreen()),
          );
        },
        backgroundColor: Pallete.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      bottomNavigationBar: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF000000), // Start color
                  Color(0xFF333333), // Middle color
                  Color(0xFF666666), // End color
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: BottomNavigationBar(
              elevation: 10,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedItemColor: Pallete.primary,
              unselectedItemColor: Colors.black26,
              type: BottomNavigationBarType.fixed,
              items: [
                // Bottom Nav Items, icons, and styles
                const BottomNavigationBarItem(
                  label: "Home",
                  icon: Icon(Icons.home),
                  activeIcon: Icon(Icons.home),
                ),
                BottomNavigationBarItem(
                  label: "Calendar",
                  icon: Image.asset(
                    'assets/images/calendarLogo.png',
                    width: 24,
                    height: 24,
                  ),
                  activeIcon: Image.asset(
                    'assets/images/calendarLogo.png',
                    width: 24,
                    height: 24,
                    color: Pallete.primary,
                  ),
                ),
                BottomNavigationBarItem(
                  label: "Cycle",
                  icon: Image.asset(
                    'assets/images/4th.png',
                    width: 24,
                    height: 24,
                  ),
                  activeIcon: Image.asset(
                    'assets/images/4th.png',
                    width: 24,
                    height: 24,
                    color: Pallete.primary,
                  ),
                ),
                const BottomNavigationBarItem(
                  label: "Profile",
                  icon: Icon(Icons.person_2_rounded),
                ),
              ],
              currentIndex: _selectedIndex,
              onTap: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),

          );
        },
      ),
      body: pages[_selectedIndex],
    );
  }
}
