import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:multichoice/styles/custom_colors.dart';
import 'package:intl/intl.dart';
import 'package:multichoice/utils/helper_functions.dart';
class FilterWidget extends StatefulWidget {
  const FilterWidget({Key? key}) : super(key: key);

  @override
  _FilterWidgetState createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  final TextEditingController _fromDateController = TextEditingController();
  final TextEditingController _toDateController = TextEditingController();

  selectToDate(){
    if(_fromDateController.text.isEmpty){
      HelperFunctions.toast(text: "اختر من التاريخ أولا",backgroundColor: Colors.red);
      return;
    }
    DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      onConfirm: (date) {
        if(date.isBefore(DateTime.parse(_fromDateController.text))){
          HelperFunctions.toast(text: "لا يمكن اختيار التاريخ قبل التاريخ الآخر",backgroundColor: Colors.red);
          return;
        }
        setState(() {
          _toDateController.text = DateFormat("yyyy-MM-dd").format(date) ;
        });
      },
      currentTime: _toDateController.text.isEmpty ? DateTime.now() : DateTime.parse(_toDateController.text),
      minTime: DateTime.parse(_fromDateController.text),
      locale: LocaleType.ar,
    );
  }

  selectFromDate(){
    DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      onConfirm: (date) {
        setState(() {
          _fromDateController.text = DateFormat("yyyy-MM-dd").format(date) ;
        });
      },
      currentTime: _fromDateController.text.isEmpty ? DateTime.now() : DateTime.parse(_fromDateController.text),
      locale: LocaleType.ar,
    );
  }

  search(){
    if(_fromDateController.text.isEmpty || _toDateController.text.isEmpty){
      HelperFunctions.toast(text: "اختر التواريخ أولاً",backgroundColor: Colors.red);
      return;
    }
    Navigator.pop(context);
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextFormField(
          onTap: selectFromDate,
          keyboardType: TextInputType.none,
          readOnly: true,
          controller: _fromDateController,
          decoration: InputDecoration(
            labelText: 'من تاريخ',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(color: CustomColors.buttonColor),
            ),
          ),
        ),
        const SizedBox(height: 15,),
        TextFormField(
          onTap: selectToDate,
          keyboardType: TextInputType.none,
          readOnly: true,
          controller: _toDateController,
          decoration: InputDecoration(
            labelText: 'إلي تاريخ',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(color: CustomColors.buttonColor),
            ),
          ),
        ),
        const SizedBox(height: 15,),
        TextButton(
            onPressed: search,
            child: const Text(
              'بحث',
              style: TextStyle(color: Colors.red),
            )),
      ],
    );
  }
}
