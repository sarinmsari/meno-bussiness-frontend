import 'package:bookkikko_business/components/common_components/one_order_box_skelton.dart';
import 'package:bookkikko_business/components/common_components/tab_bar_components.dart';
import 'package:bookkikko_business/components/main_components.dart';
import 'package:bookkikko_business/components/orders_page/filter_section.dart';
import 'package:bookkikko_business/components/orders_page/one_order_box.dart';
import 'package:bookkikko_business/screens/drawyer_screen.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  MenuScreen({
    Key? key,
  }) : super(key: key);
  final String _imageAddress =
      "https://www.indianhealthyrecipes.com/wp-content/uploads/2019/02/hyderabadi-biryani-recipe-500x500.jpg";
  var _tabController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Menu"),
      drawer: DrawyerPage(),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              height: 45,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black26,
                  border: Border.all(width: 1, color: Colors.grey.shade900)),
              child: TabBar(
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade900),
                  color: Colors.white,
                ),
                tabs: [TabBarText("Items"), TabBarText("Category")],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ListView.builder(
                    itemCount: 5,
                    itemBuilder: (ctx, index) => OneOrderBoxSkelton(
                      leading: Image(
                        width: 50,
                        height: 50,
                        image: NetworkImage(_imageAddress),
                      ),
                      titleText: "Chichekn Biriyani",
                      subtitle: Row(
                        children: [
                          Text("Price : 120"),
                          SizedBox(width: 20),
                          Text("Category : Non-Veg")
                        ],
                      ),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.edit),
                      ),
                    ),
                  ),
                  ListView.builder(
                    itemCount: 10,
                    itemBuilder: (ctx, count) => OneOrderBoxSkelton(
                      titleText: "Biriyani",
                      trailing: IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {},
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
