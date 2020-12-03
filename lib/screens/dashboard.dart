import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mokshya_admin/screens/add_product.dart';
import 'package:mokshya_admin/screens/category_admin.dart';
import '../db/category.dart';
import '../db/brand.dart';

enum Page { dashboard, manage }

class DashboardPage extends StatefulWidget {
  Page _selectedPage = Page.dashboard;
  MaterialColor active = Colors.red;
  MaterialColor notActive = Colors.grey;
  TextEditingController categoryController = TextEditingController();
  TextEditingController brandController = TextEditingController();
  GlobalKey<FormState> _categoryFormKey = GlobalKey();
  GlobalKey<FormState> _brandFormKey = GlobalKey();
  BrandService _brandService = BrandService();
  CategoryService _categoryService = CategoryService();

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("Admin Section"),
          ),
          actions: [
            new IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
          ],
        ),
        drawer: Drawer(
          child: Container(
            color: HexColor("#660099"),
            child: ListView(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: CircleAvatar(
                        radius: 50.0,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage("images/store_logo.png"),
                      ),
                    ),
                    Center(
                      child: Text(
                        "TECH AND IT SOLUTIONS",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FlatButton(
                        height: 100.0,
                        textColor: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            "UPGRADE",
                            style: TextStyle(backgroundColor: Colors.green),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                //body
                InkWell(
                  onTap: () {},
                  child: ListTile(
                    title: Text(
                      'Home Page',
                      style: TextStyle(color: Colors.white),
                    ),
                    leading: Icon(Icons.home, color: Colors.white),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: ListTile(
                    title: Text(
                      'My Account',
                      style: TextStyle(color: Colors.white),
                    ),
                    leading: Icon(Icons.person, color: Colors.white),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: ListTile(
                    title: Text(
                      'My Orders',
                      style: TextStyle(color: Colors.white),
                    ),
                    leading: Icon(Icons.shopping_basket, color: Colors.white),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(

                        context, MaterialPageRoute(builder: (context) => categoryAdmin()));
                  },
                  child: ListTile(
                    title: Text(
                      'Categories',
                      style: TextStyle(color: Colors.white),
                    ),
                    leading: Icon(Icons.dashboard, color: Colors.white),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: ListTile(
                    title: Text(
                      'Favourite',
                      style: TextStyle(color: Colors.white),
                    ),
                    leading: Icon(Icons.favorite, color: Colors.white),
                  ),
                ),

                Divider(
                  color: Colors.deepPurple,
                  thickness: 0.5,
                ),
                InkWell(
                  onTap: () {},
                  child: ListTile(
                    title: Text('Settings'),
                    leading: Icon(Icons.settings, color: Colors.redAccent),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: ListTile(
                    title: Text('About Us'),
                    leading: Icon(Icons.help, color: Colors.green),
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

