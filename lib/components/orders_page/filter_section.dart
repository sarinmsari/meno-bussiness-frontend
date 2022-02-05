import 'package:flutter/material.dart';
import './colorTheme.dart';

class SubHeaderSection extends StatefulWidget {
  final Function(int) setAppliedFilter;
  final int appliedFilter;
  const SubHeaderSection(
      {Key? key, required this.setAppliedFilter, required this.appliedFilter})
      : super(key: key);

  @override
  _SubHeaderSectionState createState() => _SubHeaderSectionState();
}

class _SubHeaderSectionState extends State<SubHeaderSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
      decoration: const BoxDecoration(
        color: Colors.white70,
      ),
      child: Row(
        children: [
          Text(
            widget.appliedFilter == 0 ? 'All' : 'Table ${widget.appliedFilter}',
            style: TextStyle(
              color: rolePrimaryColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text('All'),
                value: 0,
              ),
              PopupMenuItem(
                child: Text('Table 1'),
                value: 1,
              ),
              PopupMenuItem(
                child: Text('Table 2'),
                value: 2,
              ),
              PopupMenuItem(
                child: Text('Table 3'),
                value: 3,
              ),
              PopupMenuItem(
                child: Text('Table 4'),
                value: 4,
              ),
              PopupMenuItem(
                child: Text('Table 5'),
                value: 5,
              ),
            ],
            onSelected: (int value) {
              widget.setAppliedFilter(value);
            },
            child: Row(
              children: [
                Text(
                  "filter",
                  style: TextStyle(
                    fontSize: 16,
                    color: rolePrimaryColor,
                  ),
                ),
                Icon(
                  Icons.filter_alt_outlined,
                  color: rolePrimaryColor,
                  size: 18,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
