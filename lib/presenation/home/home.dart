import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Food assistant app'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                  'Enter your dietary requirement (vegetarian, vegan): '),
              Padding(
                padding: const EdgeInsets.all(12),
                child: DropdownButton<String>(
                  isExpanded: true,
                  hint: Text(selected),
                  items: <String>['vegetarian', 'vegan'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selected = value.toString();
                      testApi();
                    });
                  },
                ),
              ),
              const Text('Results:'),
              SizedBox(
                height: 100,
                child: ListView.builder(
                    itemCount: result.length,
                    itemBuilder: (context, index) {
                      return Text(result[index].result.toString());
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
