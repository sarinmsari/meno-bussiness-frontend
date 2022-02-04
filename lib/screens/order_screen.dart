import 'package:bookkikko_business/components/main_components.dart';
import 'package:bookkikko_business/screens/drawyer_screen.dart';
import 'package:flutter/material.dart';

class OrderPage extends StatelessWidget {
  OrderPage({Key? key, this.isForWaiter = true}) : super(key: key);
  bool? isForWaiter;
  final Color colorForWaitor = Colors.blue;
  final Color colorForCook = Colors.yellow;
  final String textForWaitor = "Delivered";
  final String textForCook = "Prepared";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: CustomAppBar(title: "M E N O Business"),
      drawer: DrawyerPage(),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (ctx, index) => OrderCard(
          isForWaiter: isForWaiter,
          colorForWaitor: colorForWaitor,
          colorForCook: colorForCook,
          textForWaitor: textForWaitor,
          textForCook: textForCook,
        ),
      ),
    );
  }
}

class OrderCard extends StatefulWidget {
  OrderCard({
    Key? key,
    required this.isForWaiter,
    required Color colorForWaitor,
    required Color colorForCook,
    required String textForWaitor,
    required String textForCook,
  })  : colorForWaitor = colorForWaitor,
        colorForCook = colorForCook,
        textForWaitor = textForWaitor,
        textForCook = textForCook,
        super(key: key);

  final bool? isForWaiter;
  final Color colorForWaitor;
  final Color colorForCook;
  final String textForWaitor;
  final String textForCook;

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  bool _taskIsDone = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            contentPadding: EdgeInsets.all(10),
            leading: Container(
              width: 60,
              height: 60,
              child: Center(
                child: Text(
                  "10",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.isForWaiter!
                    ? widget.colorForWaitor
                    : widget.colorForCook,
              ),
            ),
            title: Text(
              "Chichekn Biriyani",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("count : 1"),
                SizedBox(
                  width: 15,
                ),
                Text("table : 2")
              ],
            ),
            trailing: !_taskIsDone
                ? ElevatedButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 20,
                        ),
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all(
                        widget.isForWaiter!
                            ? widget.colorForWaitor
                            : widget.colorForCook,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        _taskIsDone = true;
                      });
                    },
                    child: Text(
                      widget.isForWaiter!
                          ? widget.textForWaitor
                          : widget.textForCook,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(right: 25.0),
                    child: Text(
                      widget.isForWaiter!
                          ? widget.textForWaitor
                          : widget.textForCook,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
          ),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
