
import 'package:flutter/material.dart';
import 'package:image_to_pdf/constant/constant.dart';

class GeneralButton extends StatelessWidget {
  const GeneralButton(
      {Key? key, required this.width, required this.onTap,required this.label})
      : super(key: key);

  final double width;
  final Function()? onTap;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(width * 0.02),
          gradient: const LinearGradient(colors: [themeColor2, themeColor1]),
        ),
        child: ElevatedButton(
          style: ButtonStyle(
              elevation: MaterialStateProperty.all<double?>(0.0),
              backgroundColor:
              MaterialStateProperty.all<Color>(Colors.transparent)),
          onPressed: onTap,
          child: const Text("Convert into PDF"),
        ),
      ),
    );
  }
}
