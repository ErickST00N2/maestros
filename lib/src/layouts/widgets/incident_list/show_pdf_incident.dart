// import 'dart:typed_data'; // Es para el [archivoPdf]

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:printing/printing.dart';

// class ShowPdfIncident extends StatefulWidget {
//   ShowPdfIncident({super.key, required this.docRef});

//   /// ```[docRef]``` Referencia de la incidencia
//   /// En esta variable global estamos guardando la referencia de la incidencia
//   /// para poder utilizarla posteriormente
//   final DocumentReference docRef;

//   @override
//   State<ShowPdfIncident> createState() => _ShowPdfIncidentState();
// }

// class _ShowPdfIncidentState extends State<ShowPdfIncident> {
//   late pw.Document pdf;

//   @override
//   void initState() {
//     super.initState();
//     pdf = pw.Document();
//     _generatePdf();
//   }

//   Future<void> _generatePdf() async {
//     final data = await widget.docRef.get();

//     final alumnosNombre = data['Alumnos_Nombre'] as String;
//     final alumnosNumControl = data['Alumnos_NumControl'] as String;
//     final asignatura = data['Asignatura'] as String;
//     final comentarios = data['Comentarios'] as String;
//     final especialidad = data['Especialidad'] as String;
//     final fechaReporte = (data['FechaReporte'] as Timestamp).toDate();
//     final grupo = data['Grupo'] as String;
//     final incidencias = (data['Incidencias'] as List).cast<String>();
//     final maestroId = data['Maestros_idMaestros'] as DocumentReference;
//     final maestroUid = data['Maestros_uid'] as String;
//     final semestre = data['Semestre'] as String;

//     setState(() {
//       pdf.addPage(
//         pw.Page(
//           pageFormat: PdfPageFormat.standard,
//           build: (context) => pw.Column(
//             crossAxisAlignment: pw.CrossAxisAlignment.start,
//             children: [
//               pw.Header(
//                 level: 1,
//                 child: pw.Text('Informe de Incidencia'),
//               ),
//               pw.Paragraph(
//                 text: 'Alumno: $alumnosNombre',
//               ),
//               pw.Paragraph(
//                 text: 'Número de Control: $alumnosNumControl',
//               ),
//               pw.Paragraph(
//                 text: 'Asignatura: $asignatura',
//               ),
//               pw.Paragraph(
//                 text: 'Comentarios: $comentarios',
//               ),
//               pw.Paragraph(
//                 text: 'Especialidad: $especialidad',
//               ),
//               pw.Paragraph(
//                 text: 'Fecha del Reporte: $fechaReporte',
//               ),
//               pw.Paragraph(
//                 text: 'Grupo: $grupo',
//               ),
//               pw.Paragraph(
//                 text: 'Incidencias:',
//               ),
//               for (final incidencia in incidencias)
//                 pw.Paragraph(
//                   text: '- $incidencia',
//                 ),
//               pw.Paragraph(
//                 text: 'ID del Maestro: $maestroId',
//               ),
//               pw.Paragraph(
//                 text: 'UID del Maestro: $maestroUid',
//               ),
//               pw.Paragraph(
//                 text: 'Semestre: $semestre',
//               ),
//             ],
//           ),
//         ),
//       );
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return PdfPreview(
//       build: (format) async => await pdf.save(),
//     );
//   }
// }
