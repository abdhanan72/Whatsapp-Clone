import 'dart:ffi';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

List<CameraDescription> cameras = [];

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _cameraController;
  Future<void>? cameraValue;
  int index = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cameraController =
        CameraController(cameras[index], ResolutionPreset.ultraHigh);
    cameraValue = _cameraController.initialize();
  }

  Widget build(BuildContext context) {
    print(index);
    print(cameras[index]);
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          FutureBuilder(
            future: cameraValue,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return CameraPreview(_cameraController);
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.panorama,
                    size: 35,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.panorama_fish_eye_rounded,
                    size: 60,
                    color: Colors.red,
                  ),
                  IconButton(
                    icon: Icon(Icons.camera_alt),
                    onPressed: () {
                      print(index);
                      setState(() {
                        index = index == 0 ? 1 : 0;
                        _cameraController = CameraController(
                            cameras[index], ResolutionPreset.ultraHigh);
                        cameraValue = _cameraController.initialize();
                      });
                    },
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
