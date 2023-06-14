import 'package:flutter/material.dart';
import 'package:kbs/model/response-model.dart';

typedef OnPressed = Function(String? val);

class OptionsResults extends StatelessWidget {
  final List<ResultModel> results;
  final String message;
  final String selected;
  final List<String> options;
  final OnPressed onPressed;

  const OptionsResults(
      {required this.onPressed,
      required this.message,
      required this.options,
      required this.results,
      Key? key,
      required this.selected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         Text(message),
        Padding(
          padding: const EdgeInsets.all(12),
          child: DropdownButton<String>(
            isExpanded: true,
            hint: Text(selected),
            items: options.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: onPressed,
          ),
        ),
        const Text('Results:'),
        SizedBox(
          height: 100,
          child: ListView.builder(
              itemCount: results.length,
              itemBuilder: (context, index) {
                return Text(results[index].result.toString());
              }),
        ),
      ],
    );
  }
}
