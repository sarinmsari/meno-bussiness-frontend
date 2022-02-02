import 'package:bookkikko_business/screens/drawyer_screen.dart';
import 'package:bookkikko_business/components/main_components.dart';
import 'package:flutter/material.dart';

class Orders extends StatelessWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Orders"),
      drawer: DrawyerPage(),
      body: SafeArea(
        child: ListView.separated(
            itemBuilder: (ctx, index) {
              return Container(
                margin: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.white,
                ),
                child: ListTile(
                  onTap: () {
                    print("orderbox $index tap");
                  },
                  leading: Container(
                    width: 75,
                    height: 75,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                        child: Text(
                      '5',
                      style: const TextStyle(
                          fontSize: 35,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                  title: Text(
                    "Chicken Biriyani",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black87),
                  ),
                  subtitle: Row(
                    children: [
                      Text("count: 3"),
                      SizedBox(
                        width: 15,
                      ),
                      Text("table: 5"),
                    ],
                  ),
                  trailing: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.fromLTRB(15, 12, 15, 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      print('Order no.$index delivered');
                    },
                    child: Text(
                      'Delivered',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (ctx, index) {
              return Container();
            },
            itemCount: 6),
      ),
    );
  }
}
