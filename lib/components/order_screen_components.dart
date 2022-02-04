import 'package:flutter/material.dart';

class FilterBy extends StatefulWidget {
  const FilterBy({
    Key? key,
  }) : super(key: key);

  @override
  State<FilterBy> createState() => _FilterByState();
}

class _FilterByState extends State<FilterBy> {
  String _currentFilterLabel = "All";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomTextLabel(_currentFilterLabel),
          PopupMenuButton(
              child: CustomTextLabel("Filter By"),
              onSelected: (value) {
                print(value);
                setState(() {
                  if (value == 0)
                    _currentFilterLabel = "All";
                  else
                    _currentFilterLabel = "Table " + value.toString();
                });
              },
              itemBuilder: (ctx) => <PopupMenuItem>[
                    PopupMenuItem(
                      child: CustomTextLabel("All"),
                      value: 0,
                    ),
                    PopupMenuItem(
                      child: CustomTextLabel("Table 1"),
                      value: 1,
                    ),
                    PopupMenuItem(
                      child: CustomTextLabel("Table 2"),
                      value: 2,
                    ),
                  ])
        ],
      ),
    );
  }
}

class CustomTextLabel extends StatelessWidget {
  CustomTextLabel(this.text, {Key? key}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: Colors.blue),
    );
  }
}
