import 'package:bookkikko_business/components/main_components.dart';
import 'package:bookkikko_business/components/role_from_page/custom_text_from_field.dart';
import 'package:bookkikko_business/screens/drawyer_screen.dart';
import 'package:flutter/material.dart';

class RoleFormPage extends StatefulWidget {
  RoleFormPage({Key? key}) : super(key: key);

  @override
  State<RoleFormPage> createState() => _RoleFormPageState();
}

class _RoleFormPageState extends State<RoleFormPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String dropDownValue = "Male";

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar(title: "Create New Chef"),
      drawer: DrawyerPage(),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ListView(
              children: [
                CustomTextFormField(
                  hintText: "Firstname *",
                  isRequired: true,
                ),
                CustomTextFormField(
                  hintText: "Lastname",
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: width / 2,
                      child: CustomTextFormField(
                        hintText: "Age *",
                        isNumber: true,
                        isRequired: true,
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          width: width / 2 - 30,
                          padding: EdgeInsets.symmetric(vertical: 4),
                          margin: EdgeInsets.symmetric(
                            vertical: 11,
                          ),
                          decoration: BoxDecoration(
                            // color: Colors.blue,
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: ButtonTheme(
                              alignedDropdown: true,
                              child: DropdownButton(
                                isExpanded: true,
                                borderRadius: BorderRadius.circular(10),
                                hint: Text(
                                  "Gender : " + dropDownValue,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                // value: dropDownValue,
                                onChanged: (newValue) {
                                  setState(() {
                                    dropDownValue = newValue.toString();
                                    print(dropDownValue);
                                  });
                                },
                                items: <String>[
                                  'Male',
                                  'Female',
                                  'Not disclosing'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                CustomTextFormField(
                  hintText: "Address 1",
                ),
                CustomTextFormField(
                  hintText: "Address 2",
                ),
                CustomTextFormField(
                  hintText: "Phone Number 1 *",
                  isRequired: true,
                  isNumber: true,
                ),
                CustomTextFormField(
                  hintText: "Phone Number 2",
                  isNumber: true,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(15),
                      primary: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      _formKey.currentState!.validate();
                      // print(dropDownValue);
                    },
                    child: Text(
                      "SAVE",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
