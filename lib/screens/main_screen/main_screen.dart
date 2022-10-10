import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_to_pdf_converter/image_to_pdf_converter.dart';
import 'package:image_to_pdf/constant/constant.dart';
import 'package:image_to_pdf/logic/logic.dart';
import 'package:image_to_pdf/screens/exit_screen/exit_screen.dart';
import 'package:image_to_pdf/widgets/select_image_card/select_image_card.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var data = Get.put(Logic());
  final Shader linearGradient = const LinearGradient(
    colors: <Color>[themeColor1, themeColor2],
  ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
  Future<void>addImage()async{
    XFile? image = await ImagePicker().pickImage(source: ImageSource.camera);
    data.fileList.add(File(image!.path));
    data.widgetList.add(
      SizedBox(
        height: width * 0.45,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(width * 0.02),
          child: Image.memory(
            await data.fileList.last!.readAsBytes(),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
    Future.delayed(const Duration(seconds:1),()=>setState((){}));
  }

  @override
  void initState() {
    data.widgetList.add(
      SelectImageCard(
        width: width,
        onTap: () => addImage().catchError(
            (e) => Fluttertoast.showToast(msg: "Error: ${e.toString()}")),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "Pick Images",
            style: TextStyle(foreground: Paint()..shader = linearGradient),
          ),
        ),
        bottomNavigationBar: GeneralButton(
          label: "Convert Image into PDF",
          width: width,
          onTap: () async {
            await ImageToPdf.imageList(data.fileList).then((value) async {
               data.pdf.value=File(value.path);
               Get.to(const ExitScreen());
              //await OpenFilex.open(value.path);
              // final bytes = await value.save();
              // await value.writeAsBytes(bytes,flush: true);
            });
          },
        ),
        body: GetBuilder<Logic>(
          init: Logic(),
          builder: (logic) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: width * 0.04, horizontal: width * 0.04),
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () => setState((){data.source.value = ImageSource.camera;}),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: width * 0.03, horizontal: width * 0.03),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(width * 0.02),
                                gradient: data.source.value == ImageSource.camera
                                    ? null
                                    : const LinearGradient(
                                        colors: [themeColor1, themeColor2]),
                                color: data.source.value == ImageSource.camera
                                    ? Colors.grey
                                    : null),
                            alignment: Alignment.center,
                            child: Text(
                              "Camera",
                              style: TextStyle(
                                  color: Colors.white, fontSize: width * 0.045),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.04,
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () => setState((){data.source.value = ImageSource.gallery;}),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: width * 0.03, horizontal: width * 0.03),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(width * 0.02),
                              color: logic.source.value == ImageSource.gallery
                                  ? Colors.grey
                                  : null,
                              gradient: logic.source.value == ImageSource.gallery
                                  ? null
                                  : const LinearGradient(
                                      colors: [themeColor1, themeColor2]),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              "Gallery",
                              style: TextStyle(
                                  color: Colors.white, fontSize: width * 0.045),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: width * 0.04, vertical: width * 0.04),
                      child: ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Dismissible(
                                key: UniqueKey(),
                                onDismissed: (onDismiss) {
                                  // remove item
                                  data.fileList.removeAt(index);
                                  data.widgetList.removeAt(index);
                                },
                                child: logic.widgetList[index]!);
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: width * 0.04,
                            );
                          },
                          itemCount: logic.widgetList.length)),
                ),
              ],
            );
          }
        ),
      ),
    );
  }
}

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
