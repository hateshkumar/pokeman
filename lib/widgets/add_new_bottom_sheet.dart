import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pokemon_app/app_core/app_constants/app_colors.dart';
import 'package:pokemon_app/app_core/app_constants/app_spacing.dart';
import 'package:pokemon_app/widgets/app_spacers.dart';
import 'package:pokemon_app/widgets/text_field.dart';
import 'package:pokemon_app/widgets/text_widget.dart';
import 'package:sizer/sizer.dart';

class AddNewBottomSheet extends StatefulWidget {
  const AddNewBottomSheet({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => AddNewBottomSheetState();
}

class AddNewBottomSheetState extends State<AddNewBottomSheet> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PATextField(
              controller: _nameController,
              hintText: 'Pokemon Name',
              icon: Icons.drive_file_rename_outline,
              borderRadius: 10,
              validator: (String val) async {},
            ),
            PASpacer(),
            PATextField(
              controller: _typeController,
              hintText: 'Pokemon Type',
              icon: Icons.drive_file_rename_outline,

              borderRadius: 10,
              validator: (String val) async {},
            ),
            PASpacer(
              height: 5.h,
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Center(
                child: Container(
                    height: 7.h,
                    width: 60.w,
                    margin: EdgeInsets.only(
                      left: PASpace.horizontal,
                      right: PASpace.horizontal,
                      top: 2,
                      bottom: 2,
                    ),
                    decoration: BoxDecoration(
                      color:APPColors.appRed,
                        border:
                            Border.all(width: 1.0, color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(8)),
                    child: Center(child: PAText.text(text: "Save",color: APPColors.appWhite,fontSize: 20.sp,))),
              ),
            ),
          ],
        ));
  }
}
