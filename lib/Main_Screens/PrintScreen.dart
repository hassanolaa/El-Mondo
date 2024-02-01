import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PrintScreen extends StatelessWidget {
  final String title;
  final String order;
  final int price;
  DateTime current_date = DateTime.now();

  PrintScreen({
  required  this.title,
  required this.order,
    required this.price,

  }) ;

  Future<Uint8List>  generatePdf(PdfPageFormat format,String title)async{
    final pdf=pw.Document();
    final font=await PdfGoogleFonts.nunitoExtraLight();
    pdf.addPage(pw.Page(pageFormat: format,
        build: (pw.Context context){
          return pw.Column(
              children: [
                pw.Container(child:pw.Text("hello world") ),
                pw.SizedBox(

                    child: pw.FittedBox(
                        child:pw.Text("my text",style: pw.TextStyle(font: font)) )

                )
              ]
          );
        }
    ));
    return pdf.save();
  }

  Future<Uint8List> _generatePdf(PdfPageFormat format, String title) async {
    final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: true);
    final font = await PdfGoogleFonts.nunitoExtraLight();


    pdf.addPage(
      pw.Page(
        pageFormat: format,
        build: (context) {
          return pw.Column(
            children: [

              pw.Container(
                  child:pw.Text(current_date.toString()) ),

              pw.Container(child: pw.Text(order)),
              pw.SizedBox(height: 50),
              pw.Container(child:pw.Text(price.toString()) ),
              pw.SizedBox(
                width: double.infinity,
                child:
                pw.SizedBox.expand(child:
                pw.FittedBox(
                  child: pw.Text(title, style: pw.TextStyle(font: font)),
                ),)
              ),
              pw.SizedBox(height: 20),
              pw.Flexible(child: pw.FlutterLogo())
            ],
          );
        },
      ),
    );

    return pdf.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(title: Text("print"),),
    body: PdfPreview(build:((format) =>_generatePdf(format,title) ) ,),
    );
  }
}
