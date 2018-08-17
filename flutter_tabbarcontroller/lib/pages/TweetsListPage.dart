import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

List<CameraDescription> cameras;
class TweetsListPage extends StatelessWidget {

  openCamera(BuildContext context) async {
    cameras = await availableCameras();
    Navigator.of(context).push(new MaterialPageRoute(builder: (context){
      return new CameraApp();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new RaisedButton(
        onPressed: openCamera(context),
        child: new Text("相机"),
      ),
    );
  }
}

class CameraApp extends StatefulWidget {
  @override
  _CameraAppState createState() => new _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  CameraController controller;

  @override
  void initState() {
    super.initState();
    controller = new CameraController(cameras[0], ResolutionPreset.medium);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return new Container();
    }
    return new AspectRatio(
        aspectRatio:
        controller.value.aspectRatio,
        child: new CameraPreview(controller));
  }
}