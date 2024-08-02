import 'package:flutter/material.dart';

class CategoryModel {
  String name;
  String iconPath;
  Color boxColor;

  CategoryModel({
    required this.name,
    required this.iconPath,
    required this.boxColor,
  });
  
  static List<CategoryModel> getCategories() {
    List<CategoryModel> categories = [];
    
    categories.add(
      CategoryModel(
        name: 'Salad',
        iconPath: 'assets/icon/pie.svg',
        boxColor:const Color.fromARGB(255, 157, 206, 255)
      )
    );

    categories.add(
      CategoryModel(
        name: 'Cake',
        iconPath: 'assets/icon/pancakes.svg',
        boxColor:const Color(0xffEEA4CE)
      )
    );

    categories.add(
      CategoryModel(
        name: 'Pie',
        iconPath: 'assets/icon/pie.svg',
        boxColor:const Color(0xff9DCEFF)
      )
    );

    categories.add(
      CategoryModel(
        name: 'Smoothies',
        iconPath: 'assets/icon/orange-snacks.svg',
        boxColor:const Color(0xffEEA4CE)
      )
    );
    

    return categories;
  }
}