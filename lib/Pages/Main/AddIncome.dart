import 'package:budgetmate/Shared/Enums.dart';
import 'package:budgetmate/main.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddIncomePage extends StatefulWidget {
  String? dropdownValue;
  DateTime? dateTime;
  @override
  _AddIncomePageState createState() => _AddIncomePageState();
}

class _AddIncomePageState extends State<AddIncomePage> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        title: const Text("Add Income"),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // Green curved background
          Column(
            children: [
              Image.asset(
                'assets/Rectangle_9.png',
                fit: BoxFit.cover,
                width: width,
              )
            ],
          ),
          // Scrollable content
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.center, // Center the column contents
              children: [
                // White card with shadow
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 100, 20, 20),
                  child: Form(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 80),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white, // White card
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(64, 0, 0, 0),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 5), // Shadow position
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 6),
                                  child: Text(
                                    "CATEGORY",
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 5, 0),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    children: [
                                      _buildFramedIcon(
                                          Icons.arrow_circle_down_rounded,
                                          Colors.green),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8),
                                          child: DropdownButtonFormField(
                                            hint: const Text(
                                              "please choose a category",
                                              style: TextStyle(
                                                  fontWeight:
                                                      FontWeight.normal),
                                            ),
                                            decoration: const InputDecoration(
                                                border: InputBorder.none),
                                            items: TransactionIncomeCategory
                                                .values
                                                .map((e) => e.name)
                                                .toList()
                                                .map<DropdownMenuItem<String>>(
                                                    (String value) {
                                              value =
                                                  value.replaceAll("_", " ");
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                            onChanged: (String? value) {
                                              setState(() {
                                                widget.dropdownValue = value!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 6),
                                  child: Text(
                                    "AMOUNT",
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 5, 0),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    children: [
                                      _buildFramedIcon(
                                          Icons.attach_money_rounded,
                                          Colors.green),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8),
                                          child: TextFormField(
                                            controller: _amountController,
                                            keyboardType: TextInputType.number,
                                            decoration: const InputDecoration(
                                              hintText: "0.00",
                                              hintStyle: TextStyle(
                                                  fontWeight:
                                                      FontWeight.normal),
                                              border: InputBorder.none,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 6),
                                  child: Text(
                                    "DESCRIPTION",
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: TextField(
                                    controller: _descriptionController,
                                    keyboardType: TextInputType.multiline,
                                    maxLines: null,
                                    decoration: const InputDecoration(
                                      hintText:
                                          "please enter a brief description",
                                      hintStyle: TextStyle(
                                          fontWeight: FontWeight.normal),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 6),
                                  child: Text(
                                    "DATE",
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 5, 0),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () async {
                                          showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime(2000),
                                            lastDate: DateTime(2101),
                                          ).then((selectedDate) {
                                            // After selecting the date, display the time picker.
                                            if (selectedDate != null) {
                                              showTimePicker(
                                                context: context,
                                                initialTime: TimeOfDay.now(),
                                              ).then((selectedTime) {
                                                // Handle the selected date and time here.
                                                if (selectedTime != null) {
                                                  DateTime selectedDateTime =
                                                      DateTime(
                                                    selectedDate.year,
                                                    selectedDate.month,
                                                    selectedDate.day,
                                                    selectedTime.hour,
                                                    selectedTime.minute,
                                                  );
                                                  setState(() {
                                                    widget.dateTime =
                                                        selectedDateTime;
                                                    _dateController.text =
                                                        "${selectedDateTime.day}/${selectedDateTime.month}/${selectedDateTime.year} ${DateFormat("h:mma").format(selectedDateTime)}";
                                                  });
                                                }
                                              });
                                            }
                                          });
                                        },
                                        child: _buildFramedIcon(
                                            Icons.calendar_today, Colors.black),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8),
                                          child: TextFormField(
                                            controller: _dateController,
                                            readOnly: true,
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: "DD/MM/YYYY hh:mm",
                                              hintStyle: const TextStyle(
                                                  fontWeight:
                                                      FontWeight.normal),
                                              suffixIconConstraints:
                                                  const BoxConstraints(
                                                      maxHeight: 40,
                                                      maxWidth: 60),
                                              suffixIcon: TextButton(
                                                  onPressed: () {
                                                    _dateController.clear();
                                                  },
                                                  child: const Text("Clear")),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            // Centered Add Invoice button
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 6),
                                  child: Text(
                                    "INVOICE",
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Center(
                                    child: TextButton.icon(
                                      onPressed: () {
                                        // Add Invoice logic
                                        print("added Invoice");
                                      },
                                      icon: const Icon(
                                        Icons.add_circle_rounded,
                                      ), // Framed icon
                                      label: const Text('Add Invoice'),
                                      style: TextButton.styleFrom(
                                          shape:
                                              const ContinuousRectangleBorder(),
                                          foregroundColor: Colors.grey[600],
                                          minimumSize: Size(width * 0.79, 45)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 50),
                            Center(
                              child: ElevatedButton(
                                onPressed: () {
                                  // Add Income logic
                                  _AddIncome();
                                },
                                style: ElevatedButton.styleFrom(
                                  fixedSize: Size(width * 0.79, 50),
                                  backgroundColor: const Color(0xff428681),
                                ),
                                child: const Text(
                                  'Add Income',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to build a framed icon
  Widget _buildFramedIcon(IconData icon, Color iconColor) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xfff0f6f5), // Background color for the frame
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(
        icon,
        color: iconColor,
      ),
    );
  }

  String formNum(String s) {
    return NumberFormat.compactSimpleCurrency().format(
      num.parse(s),
    );
  }

  Future<void> _AddIncome() async {
    var income = {
      "Type": 0,
      "Amount": num.parse(_amountController.text),
      "Category": TransactionIncomeCategory.values
          .byName(widget.dropdownValue!.replaceAll(" ", "_"))
          .idx,
      "Description": _descriptionController.text,
      "Date": widget.dateTime != null
          ? widget.dateTime!.toIso8601String()
          : DateTime.now().toIso8601String()
    };
    var result = await dioHelper.AddTransaction(income);
    if (result!.statusCode == 200) {
      Navigator.pop(context);
    }
  }
}

// CurveClipper Class
class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstControlPoint = Offset(size.width / 2, size.height);
    var firstEndPoint = Offset(size.width, size.height - 50);
    path.quadraticBezierTo(
      firstControlPoint.dx,
      firstControlPoint.dy,
      firstEndPoint.dx,
      firstEndPoint.dy,
    );

    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
