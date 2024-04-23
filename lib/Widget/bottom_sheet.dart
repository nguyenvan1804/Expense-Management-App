import 'package:flutter/material.dart';

class CustomBottomSheet extends StatelessWidget {
  final String button_title;
  final String sheet_title;

  const CustomBottomSheet(
      {super.key, required this.button_title, required this.sheet_title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Text("$button_title"),
        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: 200,
                color: Colors.white,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text('$sheet_title'),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
