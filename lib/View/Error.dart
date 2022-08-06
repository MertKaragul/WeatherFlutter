import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weatherflutter/Util/Util.dart';

class AppError extends StatefulWidget {
  final String errMessage;
  const AppError({Key? key, required this.errMessage}) : super(key: key);

  @override
  State<AppError> createState() => _AppErrorState();
}

class _AppErrorState extends State<AppError> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Padding(
          padding: EdgeInsets.all((width) * 0.05),
          child: Column(
            children: [
              Icon(Icons.error , color: Colors.red, size: (width + height) * 0.05),
              Text(widget.errMessage),
            ],
          ),
        ),
    );
  }
}






