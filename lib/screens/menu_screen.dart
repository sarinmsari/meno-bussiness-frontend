import 'package:bookkikko_business/components/common_components/one_order_box_skelton.dart';
import 'package:bookkikko_business/components/main_components.dart';
import 'package:bookkikko_business/components/orders_page/filter_section.dart';
import 'package:bookkikko_business/components/orders_page/one_order_box.dart';
import 'package:bookkikko_business/screens/drawyer_screen.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({
    Key? key,
  }) : super(key: key);
  final String _imageAddress =
      "https://recipesofhome.com/wp-content/uploads/2020/06/chicken-biryani-recipe-720x720.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Menu"),
      drawer: DrawyerPage(),
      body: ListView.separated(
        itemCount: 5,
        separatorBuilder: (ctx, index) => SizedBox(
          height: 20,
        ),
        itemBuilder: (ctx, index) => OneOrderBoxSkelton(
          leading: Image(
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
          trailing: IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
        ),
      ),
    );
  }
}
