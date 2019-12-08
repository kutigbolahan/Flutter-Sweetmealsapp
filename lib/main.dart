import 'package:flutter/material.dart';
import 'package:sweetmealsapp/dummy-data.dart';
import 'package:sweetmealsapp/models/meal.dart';

//import 'package:sweetmealsapp/screens/categories_screen.dart';
import 'package:sweetmealsapp/screens/category_meals_screens.dart';
import 'package:sweetmealsapp/screens/filters_screen.dart';
import 'package:sweetmealsapp/screens/meal_detail_screen.dart';
import 'package:sweetmealsapp/screens/tabs_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters ={
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;

  void _setFilters(Map<String, bool>filterData) {
      setState(() {
        _filters = filterData;

        _availableMeals = DUMMY_MEALS.where((meal){
            if (_filters['gluten'] && !meal.isGlutenFree) {
              return false;
            }
            if (_filters['lactose'] && !meal.isLactoseFree) {
              return false;
            }
            if (_filters['vegan'] && !meal.isVegan) {
              return false;
            }
            if (_filters['vegetarian'] && !meal.isVegetarian) {
              return false;
            }
        }).toList();
      });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meals App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.blueGrey,
        canvasColor: Color.fromRGBO(255, 254, 229, 1.0),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          body1: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1)
          ),
          body2: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1)
          ),
          title: TextStyle(
            fontSize: 15,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold
          ),
        )
      ),
     // home: CategoriesScreen(),
     initialRoute: '/',
      routes: {
        '/': (context)=>TabsScreen(),
        CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName : (context) => MealDetailScreen(),
        FiltersScreen.routeName: (context) => FiltersScreen(_filters,_setFilters)
      },
      onUnknownRoute: (settings){
        //print(settings.arguments);
        return MaterialPageRoute(builder: (context) => CategoryMealsScreen(_availableMeals));
      },
    );
  }
}


