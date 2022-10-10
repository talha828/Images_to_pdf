part of image_to_pdf_converter;



class ImageToPdf {
  static Future<dynamic> imageList(List<File?> list) async {
    if (list.isEmpty) {
      throw "please provide valid String";
    } else {
      final pdf = pw.Document();
      for (var image in list) {
        var pdfImage = pw.MemoryImage(
          image!.readAsBytesSync(),
        );
        pdf.addPage(
          pw.Page(
            build: (pw.Context context) {
              return pw.Image(pdfImage); // Center
            },
          ),
        );
      }
      Directory appDocDir = await getApplicationDocumentsDirectory();
      final file = File("${appDocDir.path}/example.pdf");
      final bytes = await pdf.save();
       return await file.writeAsBytes(bytes,flush: true);
    }
  }
}
