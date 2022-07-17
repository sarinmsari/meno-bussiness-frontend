import 'package:bookkikko_business/components/main_components.dart';
import 'package:bookkikko_business/components/role_from_page/custom_text_from_field.dart';
import 'package:bookkikko_business/global_components.dart';
import 'package:bookkikko_business/screens/drawyer_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RoleFormScreen extends StatefulWidget {
  RoleFormScreen({Key? key, required this.roleName, this.callback})
      : super(key: key);
  final String roleName;
  Function()? callback;
  @override
  State<RoleFormScreen> createState() => _RoleFormScreenState();
}

class _RoleFormScreenState extends State<RoleFormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String dropDownValue = "Male";

  // TextEditingControllers
  TextEditingController? _firstnameController = TextEditingController();
  TextEditingController? _lastnameController = TextEditingController();
  TextEditingController? _ageController = TextEditingController();
  TextEditingController? _address1Controller = TextEditingController();
  TextEditingController? _address2Controller = TextEditingController();
  TextEditingController? _phonenumber1Controller = TextEditingController();
  TextEditingController? _phonenumber2Controller = TextEditingController();

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
                  controller: _firstnameController,
                ),
                CustomTextFormField(
                  hintText: "Lastname",
                  controller: _lastnameController,
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
                        controller: _ageController,
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
                  controller: _address1Controller,
                ),
                CustomTextFormField(
                  hintText: "Address 2",
                  controller: _address2Controller,
                ),
                CustomTextFormField(
                  hintText: "Phone Number 1 *",
                  controller: _phonenumber1Controller,
                  isRequired: true,
                  isNumber: true,
                ),
                CustomTextFormField(
                  hintText: "Phone Number 2",
                  controller: _phonenumber2Controller,
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
                      var validationStatus = _formKey.currentState!.validate();

                      //firebase test
                      if (validationStatus) {
                        var db = FirebaseFirestore.instance;

                        final user = <String, dynamic>{
                          "restaurant_id": 112233, // hardcoded as of now
                          "firstname": _firstnameController!.text,
                          "lastname": _lastnameController != null
                              ? _lastnameController!.text
                              : "",
                          "age": _ageController!.text,
                          "gender": dropDownValue,
                          "address_1": _address1Controller != null
                              ? _address1Controller!.text
                              : "",
                          "address_2": _address2Controller != null
                              ? _address2Controller!.text
                              : "",
                        };

                        //update the existing roles

                        // get the roles as map
                        // make a copy of that
                        // add new role map to it
                        // update the final map to existing map in db
                        db
                            .collection("restaurant")
                            .where("restaurant_id", isEqualTo: RESTAURANT_ID)
                            .limit(1)
                            .get()
                            .then((QuerySnapshot data) {
                          var restaurantDetails =
                              data.docs[0].data() as Map<String, dynamic>;

                          Map roles = Map.from(restaurantDetails["roles"]);

                          // if the roles list exist add new user to it
                          // else create a list and add user
                          if (roles[widget.roleName] != null) {
                            roles[widget.roleName].add(user);
                          } else {
                            roles[widget.roleName] = [];
                            roles[widget.roleName].add(user);
                          }
                          // print(roles);
                          // since there will be only one doc
                          data.docs[0].reference
                              .update({"roles": roles}).then((value) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Successful"),
                              backgroundColor: Color.fromARGB(255, 29, 221, 35),
                            ));
                            if (widget.callback != null) widget.callback!();
                          });
                        });

                        // print(dropDownValue);

                      }
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
