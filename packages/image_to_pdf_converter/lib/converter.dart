part of image_to_pdf_converter;

class ImageToPdf {
  /// fileName should be without any extension, e.g., "my_pdf"
  /// Example usage:
  /// await ImageToPdf.imageList(listOfFiles: files, fileName: "my_pdf");
  static Future<dynamic> imageList(
      {required List<File?> listOfFiles, String? fileName}) async {
    if (listOfFiles.isEmpty) {
      throw "Your List is Empty";
    } else {
      final pdf = pw.Document();
      for (var image in listOfFiles) {
        var pdfImage = pw.MemoryImage(
          image!.readAsBytesSync(),
        );
        pdf.addPage(
          pw.Page(
            build: (pw.Context context) {
              return pw.Image(pdfImage, fit: pw.BoxFit.contain); // Center
            },
          ),
        );
      }
      Directory appDocDir = await getApplicationSupportDirectory();
      final file = File("${appDocDir.path}/${fileName ?? 'example'}.pdf");
      final bytes = await pdf.save();
      return await file.writeAsBytes(bytes, flush: true);
    }
  }
}
