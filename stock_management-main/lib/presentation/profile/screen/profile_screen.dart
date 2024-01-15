import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // List<String> locations = [
  //   'Warehouse 1',
  //   'Warehouse 2',
  //   'Warehouse 3',
  //   'Warehouse 4'
  // ];
  String? selectedLocation;
  int quantity = 80;
  String barcode = '';

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  bool cameraInitialized = false;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Container(
              padding: const EdgeInsets.only(right: 240, top: 18),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Add New Pick',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Text(
                    'P-#542651',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF006064),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 0),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/Pin.png',
                              width: 20,
                              height: 20,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Location',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.all(22.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Scan Qr For Location',
                        border: const OutlineInputBorder(),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 1.0,
                          horizontal: 5.0,
                        ),
                        hintStyle: const TextStyle(fontSize: 8.0),
                        hintText: 'Scan Qr For Location',
                        suffixIcon: GestureDetector(
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            height: 10,
                            width: 10,
                            child: const Image(
                              image: AssetImage(
                                'assets/images/scan.png',
                              ),
                              fit: BoxFit.contain,
                              width: 10,
                              height: 10,
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        _scanBarcode().then((result) {});
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 0),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/scanner.png',
                              width: 20,
                              height: 20,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Barcode',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Scan Barcode',
                        border: const OutlineInputBorder(),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 5.0,
                          horizontal: 10.0,
                        ),
                        hintStyle: const TextStyle(fontSize: 10.0),
                        hintText: 'Scan Barcode',
                        suffixIcon: GestureDetector(
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            height: 10,
                            width: 10,
                            child: const Image(
                              image: AssetImage(
                                'assets/images/scan.png',
                              ),
                              fit: BoxFit.contain,
                              width: 10,
                              height: 10,
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        _scanBarcode().then((result) {});
                      },
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 25,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(width: 5),
                                // Text(
                                //   'Shopping Cart',
                                //   style: TextStyle(
                                //     fontSize: 18,
                                //     color: Colors.black,
                                //     fontWeight: FontWeight.bold,
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // _buildShoppingCart(),
                  // _buildOrderNote(),
                  // _orderSummary(),
                  // _elevatedButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _scanBarcode() async {
    try {
      final scannedBarcode = await FlutterBarcodeScanner.scanBarcode(
        '#004297',
        'Cancel',
        false,
        ScanMode.DEFAULT,
      );

      if (scannedBarcode != '-1') {
        setState(() {
          barcode = scannedBarcode;
        });
      } else {
        print('Barcode scanning canceled');
      }
    } catch (e) {
      print('Error scanning barcode: $e');
    }
  }

  // void _onQRViewCreated(QrReaderViewController controller) {
  //   this.controller = controller;
  //   controller.scannedDataStream.listen((barcode) {
  //     setState(() {
  //       this.barcode = barcode;
  //     });
  //   });

  //   if (!cameraInitialized) {
  //     _initializeCamera(controller);
  //   }
  // }

  // void _initializeCamera(QrReaderViewController controller) async {
  //   try {
  //     await controller.startCamera();
  //     setState(() {
  //       cameraInitialized = true;
  //     });
  //   } on PlatformException catch (e) {
  //     print("Error initializing camera: $e");
  //   }
  // }

  // Future<void> _scanBarcode() async {
  //   try {
  //     // Instead, use the data from the QrReaderViewController
  //     String barcode = this.barcode;
  //     setState(() {
  //       this.barcode = barcode;
  //     });
  //   } on PlatformException catch (e) {
  //     if (e.code == QRCodeScanner.cameraAccessDenied) {
  //       print('Camera permission denied');
  //     } else {
  //       print('Error: $e');
  //     }
  //   } on FormatException {
  //     print('Scan cancelled');
  //   } catch (e) {
  //     print('Error: $e');
  //   }
  // }

  Widget _buildShoppingCart() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Container(
        width: double.infinity,
        child: Column(
          children: List.generate(5, (index) {
            return Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              margin: const EdgeInsets.only(bottom: 5),
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(255, 121, 121, 121),
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'ARIPIPRAZOLE 10 MG TABLET ${index + 1}',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.teal[600],
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset(
                                'assets/images/delete.png',
                                width: 15,
                                height: 15,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 5),
                        child: const Text(
                          '12:30 PM',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color.fromARGB(255, 121, 121, 121),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Material(
                              child: Ink(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: Color(0xFF006064),
                                    width: 1.5,
                                  ),
                                ),
                                child: Container(
                                  width: 80,
                                  padding: EdgeInsets.symmetric(
                                    vertical: 4,
                                    horizontal: 6,
                                  ),
                                  // Use onTap directly on the Ink or its parent Container
                                  // onTap: () {
                                  //   // Handle tap event
                                  // },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            if (quantity > 0) {
                                              quantity--;
                                            }
                                          });
                                        },
                                        child: Icon(Icons.remove,
                                            color: Color(0xFF006064), size: 20),
                                      ),
                                      Text(
                                        '$quantity',
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Color(0xFF006064),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            quantity++;
                                          });
                                        },
                                        child: Icon(Icons.add,
                                            color: Color(0xFF006064), size: 20),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        margin: const EdgeInsets.only(top: 6),
                      )
                    ],
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget _buildOrderNote() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Column(
        children: [
          const Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 25,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.note,
                        color: Color(0xFF006064),
                        size: 16,
                      ),
                      SizedBox(width: 5),
                      Text(
                        'Order Note',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color.fromARGB(255, 121, 121, 121),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text(
              'Many desktop publishing packages and web page editors now use this medicines as their default model text, and a search for will uncover many web sites still in their infancy',
              style: TextStyle(
                fontSize: 12,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _orderSummary() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Container(
        height: 150,
        width: double.infinity,
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromARGB(255, 121, 121, 121),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order Summary',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Flexible(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Flexible(
                          child: Text(
                            'Total Materials: ',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        Flexible(
                          child: Text(
                            '5pcs',
                            style: TextStyle(
                              color: Colors.black,
                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Flexible(
                          child: Text(
                            'Total Quantity: ',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        Flexible(
                          child: Text(
                            '410pcs',
                            style: TextStyle(
                              color: Colors.black,
                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Start Time: ',
                          style: TextStyle(color: Colors.black),
                        ),
                        Text(
                          '12:30 PM',
                          style: TextStyle(
                            color: Colors.black,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'End Time: ',
                          style: TextStyle(color: Colors.black),
                        ),
                        Text(
                          '12:54 PM',
                          style: TextStyle(
                            color: Colors.black,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Flexible(
                          child: Text(
                            'Total time taken ',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Flexible(
                          child: Text(
                            '24 Mins',
                            style: TextStyle(
                              color: Colors.black,
                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _elevatedButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: ElevatedButton(
        onPressed: () {},
        onLongPress: () {},
        style: ElevatedButton.styleFrom(
          primary: const Color(0xFF006064),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: Container(
          width: 250,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          alignment: Alignment.center,
          child: const Text(
            'Complete Picking',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
