import 'package:flutter/material.dart';
import 'package:todo_app/view/componets/widgets/drop_down_menu_custom.dart';
import 'package:todo_app/view/componets/widgets/elvated_button_custom.dart';
import 'package:todo_app/view/componets/widgets/scroll_configuration_custom.dart';
import 'package:todo_app/view/componets/widgets/text_form_field_custom.dart';
import 'package:todo_app/view_model/utils/functions/show_date_picker_function.dart';

class UpdateTaskScreen extends StatelessWidget {
  const UpdateTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(),
        body: ScrollConfigurationCustom(
          axisDirection: AxisDirection.down,
          child:ListView(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
            children: [
              const TextFormFieldCustom(
                labelText: 'العنوان',
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 15,
              ),
              const TextFormFieldCustom(
                labelText: 'المهمة',
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormFieldCustom(
                labelText: 'تاريخ البدأ',
                keyboardType: TextInputType.none,
                onTap: () async {
                  DateTime? datePicker =
                  await showDatePickerFunction(context: context);
                  if (datePicker != null) {
                    // cubit.startDateController.text=
                    // "${datePicker.year}-${datePicker.month}-${datePicker.day}";
                  }
                },
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormFieldCustom(
                labelText: 'تاريخ الانتهاء',
                keyboardType: TextInputType.none,
                onTap: () async {
                  DateTime? lastDatePicker =
                  await showDatePickerFunction(context: context);
                  if (lastDatePicker != null) {
                    // cubit.lastDateController.text=
                    // "${lastDatePicker.year}-${lastDatePicker.month}-${lastDatePicker.day}";
                  }
                },
              ),
              const SizedBox(
                height: 15,
              ),
              const DropDownMenuCustom(),
              const SizedBox(
                height: 35,
              ),
              ElevatedButtonCustom(
                onPressed: () {},
                child: const Text(
                  'تعديل',
                  style: TextStyle(fontSize: 20),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
