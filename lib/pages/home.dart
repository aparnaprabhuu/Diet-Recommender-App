import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../models/category_model.dart';
import '../models/diet_model.dart';
import '../models/popular_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = [];
  List<DietModel> diets = [];
  List<PopularDietsModel> popularDiets = [];

  void _getInitialInfo() {
    categories = CategoryModel.getCategories();
    diets = DietModel.getDiets();
    popularDiets = PopularDietsModel.getPopularDiets();
  }

  @override
  Widget build(BuildContext context) {
    _getInitialInfo();
    return Scaffold(
      appBar: appBar(),
      body: ListView(
        children: [
          _searchField(),
          const SizedBox(
            height: 40,
          ),
          _categoriesSection(),
          const SizedBox(
            height: 40,
          ),
          _dietSection(),
          const SizedBox(
            height: 40,
          ),
          _popularDietSection(),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }

  Column _popularDietSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Popular Diets',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        ListView.separated(
          itemCount: popularDiets.length,
          shrinkWrap: true,
          separatorBuilder: (context, index) => const SizedBox(
            height: 25,
          ),
          padding: const EdgeInsets.only(left: 20, right: 20),
          itemBuilder: (context, index) {
            return Container(
              height: 100,
              decoration: BoxDecoration(
                  color: popularDiets[index].boxIsSelected
                      ? Colors.white
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: popularDiets[index].boxIsSelected
                      ? [
                          BoxShadow(
                              color: const Color(0xff1D1617).withOpacity(0.07),
                              offset: const Offset(0, 10),
                              blurRadius: 40,
                              spreadRadius: 0)
                        ]
                      : []),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset(
                    popularDiets[index].iconPath,
                    width: 65,
                    height: 65,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        popularDiets[index].name,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: 16),
                      ),
                      Text(
                        popularDiets[index].level +
                            ' | ' +
                            popularDiets[index].duration +
                            ' | ' +
                            popularDiets[index].calorie,
                        style: const TextStyle(
                            color: Color(0xff7B6F72),
                            fontSize: 13,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: SvgPicture.asset(
                      'assets/icon/button.svg',
                      width: 30,
                      height: 30,
                    ),
                  )
                ],
              ),
            );
          },
        )
      ],
    );
  }

  Column _dietSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Recommendation \nfor diet',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          height: 240,
          child: ListView.separated(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  width: 210,
                  decoration: BoxDecoration(
                    color: diets[index].boxColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SvgPicture.asset(diets[index].iconPath),
                      Text(
                        diets[index].name,
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      Text(
                        diets[index].level +
                            ' | ' +
                            diets[index].duration +
                            ' | ' +
                            diets[index].calorie,
                        style: const TextStyle(
                            color: Color(0xff7B6F72),
                            fontSize: 13,
                            fontWeight: FontWeight.w400),
                      ),
                      Container(
                        height: 45,
                        width: 130,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              diets[index].viewIsSelected
                                  ? const Color(0xff9DCEFF)
                                  : Colors.transparent,
                              diets[index].viewIsSelected
                                  ? const Color(0xff92A3FD)
                                  : Colors.transparent
                            ]),
                            borderRadius: BorderRadius.circular(50)),
                        child: Center(
                          child: Text(
                            'View',
                            style: TextStyle(
                                color: diets[index].viewIsSelected
                                    ? Colors.white
                                    : const Color(0xffC58BF2),
                                fontWeight: FontWeight.w600,
                                fontSize: 14),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                    width: 25,
                  ),
              itemCount: diets.length),
        )
      ],
    );
  }

  Column _categoriesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Category',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          height: 120,
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: categories[index].boxColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  width: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            categories[index].iconPath,
                          ),
                        ),
                      ),
                      Text(
                        categories[index].name,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                    width: 10,
                  ),
              itemCount: categories.length),
        )
      ],
    );
  }

  Container _searchField() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 40, 20, 0),
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(132, 204, 204, 204),
            blurRadius: 40,
            spreadRadius: 0,
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search Pancake',
          hintStyle: const TextStyle(
              color: Color.fromARGB(255, 176, 176, 176), fontSize: 14),
          contentPadding: const EdgeInsets.all(10),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SvgPicture.asset(
              'assets/icon/Search.svg',
            ),
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SvgPicture.asset(
              'assets/icon/Filter.svg',
            ),
          ),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      centerTitle: true,
      title: const Text(
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        'Breakfast',
      ),
      backgroundColor: Colors.white,
      elevation: 0.0,
      leading: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color.fromARGB(229, 228, 228, 228),
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: SvgPicture.asset(
          'assets/icon/Arrow - Left 2.svg',
          height: 20,
          width: 20,
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Container(
            width: 37,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color.fromARGB(229, 228, 228, 228),
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            child: SvgPicture.asset(
              'assets/icon/dots.svg',
              height: 5,
              width: 5,
            ),
          ),
        ),
      ],
    );
  }
}
