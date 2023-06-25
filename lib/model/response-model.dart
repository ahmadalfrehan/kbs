class ResultModel {
  String? yourGender;
  String? yourAge;
  double? caloriesGoal;
  BmI? bmi;
  List recommendedFoods = [];
  double? neededCalories;
  String? setRecommended;
  String? rangeCalories;
  String? explanation;

  ResultModel.empty();

  ResultModel({
    required this.yourGender,
    required this.yourAge,
    required this.caloriesGoal,
    required this.bmi,
    required this.recommendedFoods,
    required this.neededCalories,
    required this.setRecommended,
    required this.rangeCalories,
    required this.explanation,
  }); // int? factId;
  factory ResultModel.fromJson(Map<String, dynamic> data) {
    return ResultModel(
      yourGender: data['Since your gender is'],
      yourAge: data['and your age is'],
      caloriesGoal: data[
          "We have calculated your calories based using Mifflin St Jeor Equation And your calorie_goal"],
      bmi: BmI.fromJson(data['bmi']),
      recommendedFoods: data['recommended_foods'],
      neededCalories: data['Considering you need '],
      setRecommended: data['You are recommended eat these in set '],
      rangeCalories: data['All foods in this set contains calories in the'],
      explanation: data['explanation'],
    );
  }
}

class BmI {
  double? value;
  String? category;

  BmI({
    required this.value,
    required this.category,
  });

  factory BmI.fromJson(Map<String, dynamic> data) {
    return BmI(value: data['value'], category: data['category']);
  }
}