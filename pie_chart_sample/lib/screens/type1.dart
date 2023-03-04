import 'package:flutter/material.dart';
import 'package:pie_chart_sample/constant/constant.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Type1 extends StatefulWidget {
  const Type1({super.key});

  @override
  State<Type1> createState() => _Type1State();
}

class _Type1State extends State<Type1> {
  TooltipBehavior _tooltipBehavior = TooltipBehavior();

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(typeOneText),
      ),
      body: SfCircularChart(
        //custom color
        palette: [redColor, orangeColor, greenColor, pinkColor, amberColor],
        tooltipBehavior: _tooltipBehavior,

        series: [
          PieSeries<SampleData, String>(
            // giving radius size according to the screen
            radius: "80%",
            enableTooltip: true,
            dataSource: [
              SampleData("Food", 35.0),
              SampleData("Travel", 45.0),
              SampleData("Shopping", 45.0),
              SampleData("Recharges", 45.0),
              SampleData("Movies", 45.0),
            ],

            xValueMapper: (SampleData d, _) => d.x,
            yValueMapper: (SampleData d, _) => d.y,
            //for visible in circle
            dataLabelSettings: const DataLabelSettings(isVisible: true),
          ),
        ],
      ),
    
    ));
  }
}

//Creating model for mapping to fuction
class SampleData {
  SampleData(this.x, this.y);
  final String x;
  final double y;
}
