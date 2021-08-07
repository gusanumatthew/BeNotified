import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../contents/utilities/validation_mixin.dart';
import '../../services/notice_service.dart';
import '../shared/models/app_user.dart';
import '../shared/widgets/app_button.dart';
import '../shared/widgets/app_text_field.dart';

class SendNoticeScreen extends StatefulWidget {
  static const routeName = '/notice';

  @override
  _SendNoticeScreenState createState() => _SendNoticeScreenState();
}

class _SendNoticeScreenState extends State<SendNoticeScreen>
    with ValidationMixin {
  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  late final titleController = TextEditingController();
  late final descriptionController = TextEditingController();
  late final dateController = TextEditingController();
  late final timeController = TextEditingController();

  @override
  void dispose() {
    dateController.dispose();
    timeController.dispose();
    super.dispose();
  }

  //code for date
  Future<DateTime?> _selectDateTime(BuildContext context) async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(Duration(seconds: 1)),
      firstDate: DateTime.now(),
      lastDate: DateTime(2300),
      helpText: 'Select Notice Date',
      errorFormatText: 'Enter valid date',
      errorInvalidText: 'Enter date in valid range',
    );

    if (date != null)
      setState(
        () {
          selectedDate = DateTime(
            date.year,
            date.month,
            date.day,
            selectedDate.hour,
            selectedDate.minute,
          );
          dateController.text = DateFormat.yMMMMEEEEd().format(selectedDate);
        },
      );

    return null;
  }

  //code for time
  Future<TimeOfDay?> _selectTime(BuildContext context) async {
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(
        hour: selectedTime.hour,
        minute: selectedTime.minute,
      ),
    );

    if (time != null)
      setState(
        () {
          selectedDate = DateTime(
            selectedDate.year,
            selectedDate.month,
            selectedDate.day,
            time.hour,
            time.minute,
          );
          timeController.text = DateFormat.jm().format(selectedDate);
        },
      );
    return null;
  }

  Future<void> sendNotice(AppUser user) async {
    FocusScope.of(context).unfocus();

    if (_formKey.currentState!.validate()) {
      setState(() => isLoading = true);

      try {
        await NoticeService().createNotice(
          titleController.text,
          descriptionController.text,
          selectedDate,
          selectedTime,
          user,
        );

        Navigator.of(context).pop();

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Notice added successfully!')),
        );
      } catch (ex) {
        print(ex);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(ex.toString())),
        );
      }

      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)?.settings.arguments as AppUser;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Send New Notice'),
        backgroundColor: Color(0xFF8F0009),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: <Widget>[
            AppTextField(
              labelText: 'Title',
              controller: titleController,
              validator: validateNotEmpty,
            ),
            SizedBox(height: 24),
            AppTextField(
              labelText: 'Description',
              controller: descriptionController,
              maxLines: 5,
              validator: validateNotEmpty,
            ),
            SizedBox(height: 24),
            GestureDetector(
              onTap: () async {
                FocusScope.of(context).unfocus();
                await _selectDateTime(context);
              },
              child: AppTextField(
                controller: dateController,
                prefixIcon: Icon(Icons.date_range_outlined),
                hintText: 'Select Deadline Date',
                enabled: false,
                validator: validateNotEmpty,
              ),
            ),
            SizedBox(height: 24),
            GestureDetector(
              onTap: () async {
                FocusScope.of(context).unfocus();
                await _selectTime(context);
              },
              child: AppTextField(
                hintText: 'Select Deadline Time',
                prefixIcon: Icon(Icons.timelapse),
                controller: timeController,
                enabled: false,
                validator: validateNotEmpty,
              ),
            ),
            SizedBox(height: 24),
            AppButton(
              isLoading: isLoading,
              label: 'Send',
              onPressed: () => sendNotice(user),
            ),
          ],
        ),
      ),
    );
  }
}
