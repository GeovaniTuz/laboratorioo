/*import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class CameraScreen extends StatefulWidget {
  CameraScreen({Key key}) : super(key: key);

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

enum WidgetState { NONE, LOADING, LOADED, ERROR }

class _CameraScreenState extends State<CameraScreen> {
  WidgetState _widgetState = WidgetState.NONE;
  List<CameraDescription> _cameras;
  CameraController _cameraController;

  @override
  void initState() {
    super.initState();
    initializeCamera();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final deviceRatio = size.width / size.height;

    switch (_widgetState) {
      case WidgetState.NONE:
      case WidgetState.LOADING:
        return buildScaffold(
            context, Center(child: CircularProgressIndicator()));
      case WidgetState.LOADED:
        return buildScaffold(
            context,
            Stack(
              children: [
                Transform.scale(
                    scale: _cameraController.value.aspectRatio / deviceRatio,
                    child: AspectRatio(
                        aspectRatio: _cameraController.value.aspectRatio,
                        child: CameraPreview(_cameraController))),
              ],
            ));
      case WidgetState.ERROR:
        return buildScaffold(
            context,
            Center(
                child: Text(
                    "¡Ooops! Error al cargar la cámara . Reinicia la apliación.")));
    }
    return Container();
  }

  Widget buildScaffold(BuildContext context, Widget body) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Cámara"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: body,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            final path = join(
              (await getTemporaryDirectory()).path,
              '${DateTime.now()}.png',
            );

            await _cameraController.takePicture();
            Navigator.pop(context, path);
          } catch (e) {
            print(e);
          }
        },
        child: Icon(Icons.camera),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Future<void> initializeCamera() async {
    _widgetState = WidgetState.LOADING;
    if (mounted) setState(() {});

    _cameras = await availableCameras();

    _cameraController = CameraController(_cameras[0], ResolutionPreset.medium);

    await _cameraController.initialize();

    if (_cameraController.value.hasError) {
      _widgetState = WidgetState.ERROR;
      if (mounted) setState(() {});
    } else {
      _widgetState = WidgetState.LOADED;
      if (mounted) setState(() {});
    }
  }
}


import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';
import 'package:image/image.dart' as Img;
import 'dart:math' as Math;

class fotos extends StatefulWidget {
  @override
  _fotosState createState() => _fotosState();
}

class _fotosState extends State<fotos> {
  //imagen file
  File _image;
  TextEditingController cTitle = new TextEditingController();

//get en galeria
  Future getImageGallery() async {
    var imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);

    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;

    int rand = new Math.Random().nextInt(100000);

    Img.Image image = Img.decodeImage(imageFile.readAsBytesSync());
    Img.Image smallerImg = Img.copyResize(image, 500);

    var compressImg = new File("$path/image_$rand.jpg")
      ..writeAsBytesSync(Img.encodeJpg(smallerImg, quality: 85));

    setState(() {
      _image = compressImg;
    });
  }

  Future getImageCamera() async {
    var imageFile = await ImagePicker.pickImage(source: ImageSource.camera);

    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;

    int rand = new Math.Random().nextInt(100000);

    Img.Image image = Img.decodeImage(imageFile.readAsBytesSync());
    Img.Image smallerImg = Img.copyResize(image, 500);

    var compressImg = new File("$path/image_$rand.jpg")
      ..writeAsBytesSync(Img.encodeJpg(smallerImg, quality: 85));

    setState(() {
      _image = compressImg;
    });
  }

  Future upload(File imageFile) async {
    var stream =
        new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    var length = await imageFile.length();
    var uri = Uri.parse("http://10.0.2.2/my_store/upload.php");

    var request = new http.MultipartRequest("POST", uri);

    var multipartFile = new http.MultipartFile("image", stream, length,
        filename: basename(imageFile.path));
    request.fields['title'] = cTitle.text;
    request.files.add(multipartFile);

    var response = await request.send();

    if (response.statusCode == 200) {
      print("Image Uploaded");
    } else {
      print("Upload Failed");
    }
    response.stream.transform(utf8.decoder).listen((value) {
      print(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upload Image"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Center(
              child: _image == null
                  ? new Text("No image selected!")
                  : new Image.file(_image),
            ),
            TextField(
              controller: cTitle,
              decoration: new InputDecoration(
                hintText: "Title",
              ),
            ),
            Row(
              children: <Widget>[
                RaisedButton(
                  child: Icon(Icons.image),
                  onPressed: getImageGallery,
                ),
                RaisedButton(
                  child: Icon(Icons.camera_alt),
                  onPressed: getImageCamera,
                ),
                Expanded(
                  child: Container(),
                ),
                RaisedButton(
                  child: Text("UPLOAD"),
                  onPressed: () {
                    upload(_image);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
*/
