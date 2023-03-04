import 'package:flutter/material.dart';
import 'package:pie_chart_sample/Routes/routes.dart';
import 'package:pie_chart_sample/constant/constant.dart';

class Home extends StatelessWidget {
  const Home({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text(title)),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.type1);
                  },
                  child: Text(typeOneText)),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.type2);
                  },
                  child: Text(typeTwoText)),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.type3);
                  },
                  child: Text(typeThreeText)),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.type4);
                  },
                  child: Text(typeFourText)),
            ],
          ),
        ),
      ),
    );
  }
}
