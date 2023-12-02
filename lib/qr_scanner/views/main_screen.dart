import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:xtreme/qr_scanner/views/components/close_button.dart';
import 'package:xtreme/qr_scanner/views/components/scanner_animation.dart';

class ScannerScreen extends StatefulHookWidget {
  const ScannerScreen({super.key});

  @override
  State<StatefulHookWidget> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<StatefulHookWidget> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? qrViewController;

  void _onQRViewCreated(QRViewController controller, BuildContext context) {
    qrViewController = controller;
  }

  void animateScanAnimation(
    bool reverse,
    AnimationController animationController,
  ) {
    if (reverse) {
      animationController.reverse(from: 1.0);
    } else {
      animationController.forward(from: 0.0);
    }
  }

  @override
  void dispose() {
    qrViewController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final animationController = useAnimationController(
      duration: const Duration(seconds: 1),
    );

    useEffect(
      () {
        animationController.forward();
        animationController.addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            animateScanAnimation(true, animationController);
          } else if (status == AnimationStatus.dismissed) {
            animateScanAnimation(false, animationController);
          }
        });
        return;
      },
      [],
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Scanner',
          style: TextStyle(
            color: Color(0xFFF5F7F9),
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 26),
            child: GestureDetector(
              onTap: () {},
              child: SvgPicture.asset('assets/images/image_picker.svg'),
            ),
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          QRView(
            key: qrKey,
            onQRViewCreated: (p0) {
              _onQRViewCreated(p0, context);
            },
            overlay: QrScannerOverlayShape(
              borderColor: Colors.green,
              borderWidth: 8,
              borderRadius: 8,
              cutOutWidth: 288,
              cutOutHeight: 295,
              cutOutBottomOffset: 40,
            ),
          ),
          ScannerAnimation(
            width: 280,
            height: 60,
            bottomOffset: 245,
            scanningHeight: 228,
            listenable: animationController,
          ),
          Container(
            margin: const EdgeInsets.only(
              left: 24,
              bottom: 36,
            ),
            child: const CustomCloseButton(),
          ),
        ],
      ),
    );
  }
}
