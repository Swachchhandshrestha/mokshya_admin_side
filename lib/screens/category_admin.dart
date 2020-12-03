import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mokshya_admin/screens/add_product.dart';
import 'package:hexcolor/hexcolor.dart';
import '../db/category.dart';
import '../db/brand.dart';

enum Page { dashboard, manage }


class categoryAdmin extends StatefulWidget {

  @override
  _categoryAdminState createState() => _categoryAdminState();
}

class _categoryAdminState extends State<categoryAdmin> {
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
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("Category"),
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
        body: _loadScreen(),
      ),

    );
  }
  Widget _loadScreen() {
    return ListView(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.add),
          title: Text("Add product"),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => AddProduct()));
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.change_history),
          title: Text("Products list"),
          onTap: () {},
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.add_circle),
          title: Text("Add category"),
          onTap: () {
            _categoryAlert();
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.category),
          title: Text("Category list"),
          onTap: () {},
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.add_circle_outline),
          title: Text("Add brand"),
          onTap: () {
            _brandAlert();
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.library_books),
          title: Text("brand list"),
          onTap: () {},
        ),
        Divider(),
      ],
    );
  }

  void _categoryAlert() {
    var alert = new AlertDialog(
      content: Form(
        key: _categoryFormKey,
        child: TextFormField(
          controller: categoryController,
          validator: (value){
            if(value.isEmpty){
              return 'category cannot be empty';
            }
          },
          decoration: InputDecoration(
              hintText: "add category"
          ),
        ),
      ),
      actions: <Widget>[
        FlatButton(onPressed: (){
          if(categoryController.text != null){
            _categoryService.createCategory(categoryController.text);
          }
          Fluttertoast.showToast(msg: 'category created');
          Navigator.pop(context);
        }, child: Text('ADD')),
        FlatButton(onPressed: (){
          Navigator.pop(context);
        }, child: Text('CANCEL')),

      ],
    );

    showDialog(context: context, builder: (_) => alert);
  }

  void _brandAlert() {
    var alert = new AlertDialog(
      content: Form(
        key: _brandFormKey,
        child: TextFormField(
          controller: brandController,
          validator: (value){
            if(value.isEmpty){
              return 'category cannot be empty';
            }
          },
          decoration: InputDecoration(
              hintText: "add brand"
          ),
        ),
      ),
      actions: <Widget>[
        FlatButton(onPressed: (){
          if(brandController.text != null){
            _brandService.createBrand(brandController.text);
          }
          Fluttertoast.showToast(msg: 'brand added');
          Navigator.pop(context);
        }, child: Text('ADD')),
        FlatButton(onPressed: (){
          Navigator.pop(context);
        }, child: Text('CANCEL')),

      ],
    );

    showDialog(context: context, builder: (_) => alert);
  }
}

