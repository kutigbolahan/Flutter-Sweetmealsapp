import 'package:flutter/material.dart';
import 'package:sweetmealsapp/screens/categories_screen.dart';
import 'package:sweetmealsapp/screens/favorites_screen.dart';
import 'package:sweetmealsapp/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          elevation: 6.0,
          title: Text('Sweet Meals'),
          bottom: TabBar(
            
            indicatorColor: Colors.white,
            tabs: <Widget>[
              Tab(
                
                icon: Icon(Icons.category),
                text: 'Categories',
              ),
              Tab(
                icon: Icon(Icons.star),
                text: 'Favourites',
              ),
             
            ],
          ),
        ),
        body: TabBarView(
         // physics: const AlwaysScrollableScrollPhysics(),
          children: <Widget>[
            CategoriesScreen(),
            FavouritesScreen(),
          ],
        ),
       drawer: MainDrawer(),
      ),
    );
    
  }
}
