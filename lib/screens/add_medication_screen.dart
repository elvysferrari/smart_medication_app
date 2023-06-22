import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/pallet_colors.dart';
import '../widgets/drop_down_custom_widget.dart';
import '../widgets/drop_down_only_custom_widget.dart';
import '../widgets/icon_text_field_widget.dart';
import 'home_screen.dart';

class AddMedicationScreen extends StatefulWidget {
  @override
  _AddMedicationScreenState createState() => _AddMedicationScreenState();
}

class _AddMedicationScreenState extends State<AddMedicationScreen> {
  List<TimeOfDay> _selectedTimes = [];

  TextEditingController medname=TextEditingController();
  TextEditingController nomeds=TextEditingController();
  TextEditingController medtype=TextEditingController();
  TextEditingController meddays=TextEditingController();
  TextEditingController daytype=TextEditingController();
  TextEditingController timing=TextEditingController();
  TextEditingController notitimes=TextEditingController();



  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null && !_selectedTimes.contains(pickedTime)) {
      setState(() {
        _selectedTimes.add(pickedTime);
      });
    }
  }

  Future<void> _editTime(BuildContext context, TimeOfDay time) async {
    final TimeOfDay? editedTime = await showTimePicker(
      context: context,
      initialTime: time,
    );

    if (editedTime != null) {
      setState(() {
        final index = _selectedTimes.indexOf(time);
        if (index >= 0) {
          _selectedTimes[index] = editedTime;
        }
      });
    }
  }

  void _removeTime(TimeOfDay time) {
    setState(() {
      _selectedTimes.remove(time);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: Image.asset("assets/images/back.png"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                  // TODO: Implement back button functionality
                },
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Novo Medicamento',
              style: GoogleFonts.poppins(
                textStyle: Theme.of(context).textTheme.headlineMedium,
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 24,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Nome',
              style: GoogleFonts.poppins(
                textStyle: Theme.of(context).textTheme.headlineMedium,
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            IconTextField(imagePath: "assets/images/pills.png", hintText: ""),
            SizedBox(height: 16.0),
            Text(
              'Quantidade & Duração',
              style: GoogleFonts.poppins(
                textStyle: Theme.of(context).textTheme.headlineMedium,
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropDown(
                  items: ["Pílula", "Capsúla", "Garrafa", "Injeção"],
                  selectedItem: "Pílula",
                  onChanged: (String selectedItem) {
                    // Handle the selected item change here
                  },
                  iconUrl: "assets/images/pills2.png",
                ),
                SizedBox(
                  height: 16.0,
                  width: 10.0,
                ),
                DropDown(
                  items: ["Dias", "Semanas", "Meses", "Ano"],
                  selectedItem: "Dias",
                  onChanged: (String selectedItem) {
                    // Handle the selected item change here
                  },
                  iconUrl: "assets/images/calendarLogo.png",
                ),
              ],
            ),
            SizedBox(
              height: 16.0,
            ),
            Text(
              'Horário',
              style: GoogleFonts.poppins(
                textStyle: Theme.of(context).textTheme.headlineMedium,
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            DropDownOnly<String>(
              items: ["Antes do Almoço", "Após Comer", "Estômago Vazio"],
              selectedItem: "Antes do Almoço",
              onChanged: (String? selectedItem) {},
            ),
            SizedBox(
              height: 16.0,
            ),
            Text(
              'Notificação',
              style: GoogleFonts.poppins(
                textStyle: Theme.of(context).textTheme.headlineMedium,
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _selectedTimes.length,
                itemBuilder: (context, index) {
                  final time = _selectedTimes[index];
                  return ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.0),
                    ),
                    tileColor: Color(0xFFF8F8F6),
                    leading: Icon(Icons.notifications),
                    title: Text(time.format(context)),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () => _editTime(context, time),
                        ),
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () => _removeTime(time),
                        ),
                      ],
                    ),
                    onTap: () => _editTime(context, time),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xFFF8F8F6),
                    offset: Offset(0, 8),
                    blurRadius: 24,
                  ),
                ],
              ),
              width: double.infinity,
              height: 40,
              child: ElevatedButton(
                onPressed: () => _selectTime(context),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(330, 60),
                  backgroundColor: Color(0xFFF8F8F6),
                  elevation: 8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      color: Color(0xFFFFC0C0),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () => {
                    Navigator.pop(context)
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(330, 60),
                    backgroundColor: Pallete.primary,
                    elevation: 8,
                  ),
                  child: Text(
                    "Pronto",
                    style: GoogleFonts.poppins(
                      textStyle: Theme.of(context).textTheme.headlineMedium,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
