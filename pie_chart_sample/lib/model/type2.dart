// To parse this JSON data, do
//
//     final type2Model = type2ModelFromJson(jsonString);

import 'dart:convert';

Type2Model type2ModelFromJson(String str) => Type2Model.fromJson(json.decode(str));

String type2ModelToJson(Type2Model data) => json.encode(data.toJson());

class Type2Model {
    Type2Model({
        required this.budget,
    });

    final List<Budget> budget;

    factory Type2Model.fromJson(Map<String, dynamic> json) => Type2Model(
        budget: List<Budget>.from(json["Budget"].map((x) => Budget.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Budget": List<dynamic>.from(budget.map((x) => x.toJson())),
    };
}

class Budget {
    Budget({
         this.moneyLeft,
         this.food,
         this.recharges,
         this.travel,
         this.medicine,
         this.others,
    });

    final List<double>? moneyLeft;
    final double? food;
    final double? recharges;
    final double? travel;
    final double? medicine;
    final double? others;

    factory Budget.fromJson(Map<String, dynamic> json) => Budget(
        moneyLeft: List<double>.from(json["MoneyLeft"].map((x) => x)),
        food: json["food"],
        recharges: json["recharges"],
        travel: json["travel"],
        medicine: json["medicine"],
        others: json["others"],
    );

    Map<String, dynamic> toJson() => {
        "MoneyLeft": List<dynamic>.from(moneyLeft!.map((x) => x)),
        "food": food,
        "recharges": recharges,
        "travel": travel,
        "medicine": medicine,
        "others": others,
    };
}
