import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_to_pdf/constant/constant.dart';


class SelectImageCard extends StatelessWidget {
  const SelectImageCard({
    Key? key,
    required this.width,
    required this.onTap
  }) : super(key: key);

  final double width;
  final   Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: width * 0.4,
        // alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.03, vertical: width * 0.03),
        decoration: BoxDecoration(
            color: themeColor2.withOpacity(0.1),
            borderRadius: BorderRadius.circular(width * 0.02)),
        child: DottedBorder(
          dashPattern: const [7, 7, 7, 7],
          color: themeColor2,
          strokeCap: StrokeCap.round,
          strokeWidth: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IgnorePointer(
                ignoring: true,
                child: IconButton(
                  onPressed: () {},
                  icon: FaIcon(
                    FontAwesomeIcons.upload,
                    color: themeColor2,
                    size: width * 0.1,
                  ),
                ),
              ),
              Text(
                "Select the Image",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: width * 0.045, fontWeight: FontWeight.w100),
              )
            ],
          ),
        ),
      ),
    );
  }
}
