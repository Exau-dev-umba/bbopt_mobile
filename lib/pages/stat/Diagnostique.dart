import 'dart:io';

import 'package:bbopt_mobile/controllers/AnalysePlanteController.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../utils/Constantes.dart';

class Diagnostique extends StatefulWidget {
  const Diagnostique({Key? key}) : super(key: key);

  @override
  State<Diagnostique> createState() => _DiagnostiqueState();
}

class _DiagnostiqueState extends State<Diagnostique> {
  final _picker = ImagePicker();
   File? selectedImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: floatButton(),
      appBar: AppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logos/LOGO AGRIOPT 2K23.png',
              // fit: BoxFit.fitWidth,
              height: MediaQuery.of(context).size.height * 1,
              width: MediaQuery.of(context).size.width * 0.4,
            )
          ],
        ),
        backgroundColor: Constantes.ColorvertFonce,
      ),
      body: body(),
    );
  }
  getImage()async{
    var image = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      selectedImage = File(image!.path);
    });
  }

  Widget body() {
    var diagnostique = context.read<AnalysePlanteController>();
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          selectedImage == null
              ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(overflow: TextOverflow.ellipsis,
            'Clicker sur le bouton flotant de la camera pour ajouter une image de la plante',
          ),
              )
              : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.file(selectedImage!),
              ),
          Column(
            children: [
              _buttonAnalyser("tomato", "Tomate"),
              _buttonAnalyser("cassava", "Manioc"),
              _buttonAnalyser("rice", "Riz"),
              _buttonAnalyser("corn", "Maïs"),
            ],
          ),
          Text("${diagnostique.data}")
        ],
      ),
    );
  }

  Widget _buttonAnalyser(plant, nomPlante, ){
    var diagnostique = context.read<AnalysePlanteController>();
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.green[300])
      ),
      onPressed: (){
        diagnostique.sendImageToApi(imageFile: selectedImage, plant: "$plant");
        setState(() {
          diagnostique.data;
        });
      },
      child: Text(
        "Analyser votre plante de $nomPlante",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
  Widget floatButton() {
    return FloatingActionButton(
      backgroundColor: Constantes.ColorvertFonce,
      onPressed: getImage,
      tooltip: 'Increment',
      child: Icon(Icons.add_a_photo),
    );

  }

}
