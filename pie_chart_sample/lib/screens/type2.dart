import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pie_chart_sample/model/type2.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../constant/constant.dart';

class Type2 extends StatefulWidget {
  const Type2({super.key});

  @override
  State<Type2> createState() => _Type2State();
}

class _Type2State extends State<Type2> {
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    _readData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(typeTwoText),
      ),
      body: FutureBuilder<Type2Model>(
        future: _readData(),
        builder: (context, snapshot) {
          var data = snapshot.data;
          if (snapshot.hasData) {
            return SfCircularChart(
              legend: Legend(isVisible: true),
              //custom color
              palette: [
                redColor,
                orangeColor,
                greenColor,
                pinkColor,
                amberColor
              ],
              tooltipBehavior: _tooltipBehavior,

              series: _getDefaultDonutSeries(data),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text("Something went wrong"),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    ));
  }

  Future<Type2Model> _readData() async {
    final jsonString = await rootBundle.loadString("assets/json/type3.json");
    final jsonResponse = type2ModelFromJson(jsonString);
    return jsonResponse;
  }

  List<DoughnutSeries<DataFromJson, String>> _getDefaultDonutSeries(
      Type2Model? data) {
    return <DoughnutSeries<DataFromJson, String>>[
      DoughnutSeries<DataFromJson, String>(
        // giving radius size according to the screen
        radius: "80%",
        enableTooltip: true,
        dataSource: [
          DataFromJson("food" ,  data!.budget[0].food),
          DataFromJson("medicines" ,  data.budget[0].medicine),
          DataFromJson("recharges" , data.budget[0].recharges),
          DataFromJson("travel" ,  data.budget[0].travel),
          DataFromJson("others" ,  data.budget[0].others),
  
        ],

        xValueMapper: (DataFromJson b, _) => b.x,
        yValueMapper: (DataFromJson b, _) => b.y ,
        //for visible in circle
        dataLabelSettings: const DataLabelSettings(isVisible: true),
      ),
    ];
  }
}

class DataFromJson{
  DataFromJson(this.x,this.y);
  final String x;
  final double? y;
}
