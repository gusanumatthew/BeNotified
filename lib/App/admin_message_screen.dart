// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:intl/intl.dart';

// class SendInfoScreen extends StatefulWidget {
//   static const routeName = '/info';

//   @override
//   _SendInfoScreenState createState() => _SendInfoScreenState();
// }

// class _SendInfoScreenState extends State<SendInfoScreen> {
//   DateTime selectedDate = DateTime.now();
//   TimeOfDay now = TimeOfDay.now();

//   //Time & Date Controller
//   final dateController = TextEditingController();
//   final timeController = TextEditingController();

//   void initState() {
//     dateController.text = 'Select Date';
//     timeController.text = 'Select Time';
//     super.initState();
//   }

//   //code for date
//   Future<DateTime> _selectDateTime(BuildContext context) async {
//     final date = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now().add(Duration(seconds: 1)),
//       firstDate: DateTime.now(),
//       lastDate: DateTime(2300),
//       helpText: 'Select Notice Date',
//       errorFormatText: 'Enter valid date',
//       errorInvalidText: 'Enter date in valid range',
//     );

//     if (date != null)
//       setState(() {
//         selectedDate = DateTime(
//           date.year,
//           date.month,
//           date.day,
//           selectedDate.hour,
//           selectedDate.minute,
//         );
//         dateController.text = DateFormat.yMMMMEEEEd().format(selectedDate);
//       });

//     return null;
//   }

//   //code for time
//   Future<TimeOfDay> _selectTime(BuildContext context) async {
//     final time = await showTimePicker(
//       context: context,
//       initialTime: TimeOfDay(
//         hour: now.hour,
//         minute: now.minute,
//       ),
//     );

//     if (time != null)
//       setState(() {
//         selectedDate = DateTime(
//           selectedDate.year,
//           selectedDate.month,
//           selectedDate.day,
//           time.hour,
//           time.minute,
//         );
//         timeController.text = DateFormat.jm().format(selectedDate);
//       });
//     return null;
//   }

//   //list for dropdown
//   String valueChoose;
//   List dayItem = [
//     'Monday',
//     'Tuesday',
//     'Wednesday',
//     'Thursday',
//     'Friday',
//     'Saturday',
//     'Sunday'
//   ];
//   //image picker

//   //the file data type dame from dart.io
//   File _image;
//   final picker = ImagePicker();

//   Future getImage() async {
//     final pickedFile = await picker.getImage(source: ImageSource.gallery);

//     setState(() {
//       if (pickedFile != null) {
//         _image = File(pickedFile.path);
//       } else {
//         print('No image selected.');
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Text('Send New Notice'),
//         backgroundColor: Color(0xFF8F0009),
//         centerTitle: true,
//         elevation: 0.0,
//       ),
//       body: ListView(
//         padding: const EdgeInsets.all(24),
//         children: <Widget>[
//           Text(
//             'Day',
//             style: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.w400,
//             ),
//           ),
//           SizedBox(height: 8),
//           Container(
//             padding: EdgeInsets.only(left: 16, right: 16),
//             decoration: BoxDecoration(
//               border: Border.all(color: Colors.black54, width: 1),
//               borderRadius: BorderRadius.circular(5),
//             ),
//             child: DropdownButton(
//               hint: Text('Select Day'),
//               icon: Icon(Icons.arrow_drop_down),
//               iconSize: 32,
//               value: valueChoose,
//               isExpanded: true,
//               underline: SizedBox(),
//               onChanged: (newValue) {
//                 setState(() {
//                   valueChoose = newValue;
//                 });
//               },
//               items: dayItem
//                   .map(
//                     (valueItem) => DropdownMenuItem(
//                         value: valueItem, child: Text(valueItem)),
//                   )
//                   .toList(),
//             ),
//           ),
//           SizedBox(height: 24),
//           Text(
//             'Title',
//             style: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.w400,
//             ),
//           ),
//           SizedBox(height: 8),
//           TextField(
//             style: TextStyle(fontSize: 16, color: Colors.black87),
//             decoration: InputDecoration(
//               filled: true,
//               fillColor: Colors.white,
//               contentPadding: const EdgeInsets.all(8),
//               focusedBorder: OutlineInputBorder(
//                 borderSide: BorderSide(color: Color(0xFFDB3942), width: 2),
//                 borderRadius: BorderRadius.circular(5),
//               ),
//               enabledBorder: OutlineInputBorder(
//                 borderSide: BorderSide(color: Colors.black54, width: 1),
//                 borderRadius: BorderRadius.circular(5),
//               ),
//             ),
//           ),
//           SizedBox(height: 24),
//           Text(
//             'Description',
//             style: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.w400,
//             ),
//           ),
//           SizedBox(height: 8),
//           TextField(
//             style: TextStyle(fontSize: 18, color: Colors.black87),
//             maxLines: 5,
//             decoration: InputDecoration(
//               filled: true,
//               fillColor: Colors.white,
//               contentPadding: const EdgeInsets.all(8),
//               focusedBorder: OutlineInputBorder(
//                 borderSide: BorderSide(color: Color(0xFFDB3942), width: 2),
//                 borderRadius: BorderRadius.circular(5),
//               ),
//               enabledBorder: OutlineInputBorder(
//                 borderSide: BorderSide(color: Colors.black54, width: 1),
//                 borderRadius: BorderRadius.circular(5),
//               ),
//             ),
//           ),
//           SizedBox(height: 24),
//           Text(
//             'Notice Date',
//             style: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.w400,
//             ),
//           ),
//           SizedBox(height: 8),
//           GestureDetector(
//             onTap: () async {
//               await _selectDateTime(context);
//             },
//             child: TextField(
//               controller: dateController,
//               style: TextStyle(fontSize: 16, color: Colors.black87),
//               decoration: InputDecoration(
//                 filled: true,
//                 enabled: false,
//                 fillColor: Colors.white,
//                 prefixIcon: Icon(Icons.date_range_outlined),
//                 contentPadding: const EdgeInsets.all(8),
//                 focusedBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: Color(0xFFDB3942), width: 2),
//                   borderRadius: BorderRadius.circular(5),
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.black54, width: 1),
//                   borderRadius: BorderRadius.circular(5),
//                 ),
//                 disabledBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.black54, width: 1),
//                   borderRadius: BorderRadius.circular(5),
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(height: 24),
//           Text(
//             'Notice Time',
//             style: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.w400,
//             ),
//           ),
//           SizedBox(height: 8),
//           GestureDetector(
//             onTap: () async {
//               await _selectTime(context);
//             },
//             child: TextField(
//               controller: timeController,
//               style: TextStyle(fontSize: 16, color: Colors.black87),
//               decoration: InputDecoration(
//                 filled: true,
//                 enabled: false,
//                 fillColor: Colors.white,
//                 prefixIcon: Icon(Icons.timer_outlined),
//                 contentPadding: const EdgeInsets.all(8),
//                 focusedBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: Color(0xFFDB3942), width: 2),
//                   borderRadius: BorderRadius.circular(5),
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.black54, width: 1),
//                   borderRadius: BorderRadius.circular(5),
//                 ),
//                 disabledBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.black54, width: 1),
//                   borderRadius: BorderRadius.circular(5),
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 24,
//           ),
//           Text(
//             'Choose Image',
//             style: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.w400,
//             ),
//           ),
//           SizedBox(height: 8),
//           Container(
//             decoration: BoxDecoration(
//               border: Border.all(color: Colors.black54, width: 1),
//               borderRadius: (BorderRadius.circular(5)),
//             ),
//             child: Column(
//               children: [
//                 _image == null
//                     ? Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Text('No image selected.'),
//                       )
//                     : Image.file(_image),
//                 SizedBox(
//                   height: 8,
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.add_a_photo),
//                   onPressed: getImage,
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 24,
//           ),
//           RaisedButton(
//             child: Text(
//               'Send',
//               style: TextStyle(
//                 fontSize: 20,
//               ),
//             ),
//             shape: OutlineInputBorder(
//               borderSide: BorderSide(
//                 color: Colors.black54,
//               ),
//               borderRadius: BorderRadius.circular(6),
//             ),
//             padding: const EdgeInsets.all(15),
//             color: Color(0xFFDB3942),
//             textColor: Colors.white,
//             onPressed: () {},
//           ),
//         ],
//       ),
//     );
//   }
// }
