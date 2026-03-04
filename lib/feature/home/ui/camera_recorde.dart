import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:wesal/core/helpers/extensions.dart';

import '../../../core/routing/routes.dart';

class RecordSignScreen extends StatefulWidget {
  const RecordSignScreen({super.key});

  @override
  State<RecordSignScreen> createState() => _RecordSignScreenState();
}

class _RecordSignScreenState extends State<RecordSignScreen> {
  CameraController? _controller;
  bool isRecording = false;
  late List<CameraDescription> cameras;

  @override
  void initState() {
    super.initState();
    initCamera();
  }

  Future<void> initCamera() async {
    cameras = await availableCameras();
    _controller = CameraController(
      cameras.first,
      ResolutionPreset.high,
    );
    await _controller!.initialize();
    setState(() {});
  }

  Future<void> startRecording() async {
    await _controller!.startVideoRecording();
    setState(() {
      isRecording = true;
    });
  }

  Future<void> stopRecording() async {
    final file = await _controller!.stopVideoRecording();
    setState(() {
      isRecording = false;
    });

    print("Video path: ${file.path}");

context.pushNamed(Routes.SaveSing,arguments: file.path);


  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_controller == null || !_controller!.value.isInitialized) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          CameraPreview(_controller!),
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Center(
              child: GestureDetector(
                onTap: () {
                  if (isRecording) {
                    stopRecording();
                  } else {
                    startRecording();
                  }
                },
                child: Container(
                  width: 85,
                  height: 85,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: 5,
                    ),
                  ),
                  child: Center(
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: isRecording ? 35 : 55,
                      height: isRecording ? 35 : 55,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(
                          isRecording ? 8 : 100,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}