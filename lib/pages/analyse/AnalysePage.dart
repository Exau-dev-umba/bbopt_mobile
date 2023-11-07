import 'dart:io';

import 'package:bbopt_mobile/pages/user/ProfilPage.dart';
import 'package:bbopt_mobile/utils/Constantes.dart';
import 'package:bbopt_mobile/utils/Routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../controllers/AnalysePlanteController.dart';

class AnalysePage extends StatefulWidget {
  const AnalysePage({Key? key}) : super(key: key);

  @override
  State<AnalysePage> createState() => _AnalysePageState();
}

class _AnalysePageState extends State<AnalysePage> {
  final _picker = ImagePicker();
  File? selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: ProfilPage(),
      appBar: AppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logos/LOGO AGRIOPT 2K23.png',
              fit: BoxFit.fitWidth,
              height: MediaQuery.of(context).size.height * 1,
              width: MediaQuery.of(context).size.width * 0.4,
            )
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: badges.Badge(
              position: badges.BadgePosition.custom(top: 10.sp, end: 10.sp),
              child: IconButton(
                icon: Icon(CupertinoIcons.bell),
                onPressed: () {Navigator.pushNamed(context, Routes.notification);},
              ),
              badgeStyle: badges.BadgeStyle(
                badgeColor: Constantes.Colorwhite,
              ),
            ),
          ),
        ],
        centerTitle: true,
        backgroundColor: Constantes.ColorvertFonce,
      ),
      body: _body(context),
    );
  }
  ouvrirDialog(ctx, {required String plant}) async {
    var diagnostique = context.read<AnalysePlanteController>();
    bool? resulat = await showDialog<bool>(
      context: ctx,
      builder: (BuildContext context) {
        return AlertDialog(
            title: Center(child: Text('Source d\'image')),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.camera_alt,
                    color: Constantes.ColorvertFonce,
                    size: 25.sp,
                  ),
                  onPressed: () {
                    getImageCamera();

                    diagnostique.sendImageToApi(imageFile: selectedImage, plant: "$plant");
                    setState(() {
                      diagnostique.data;
                    });

                    Navigator.pop(context);
                    print("RESULTAT CAMERA: ${diagnostique.data}");
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.photo_library,
                    color: Constantes.ColorvertFonce,
                    size: 25.sp,
                  ),
                  onPressed: () {
                    getImageGallery();
                    Navigator.pop(context);
                    /*diagnostique.sendImageToApi(imageFile: selectedImage, plant: "$plant");
                    setState(() {
                      diagnostique.data;
                    });*/
                    // Navigator.pushNamed(context, Routes.resultatAnalyse, arguments: selectedImage);

                    // print("RESULTAT GALLERY: ${diagnostique.data}");
                  },
                ),
              ],
            ));
      },
    );

    // if (resulat != null) {
    //   var message = !resulat ? "Déconnexion annulée" : "Déconnexion";
    //   showSnackBar(context, message);
    // }
  }

  Widget _body(BuildContext context) {
    var diagnostique = context.read<AnalysePlanteController>();
    return Stack(
      children: [
        Container(
          color: Constantes.ColorLight,
        ),
        SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(right: 260, top: 15),
              child: Text(
                "Analyse",
                style: TextStyle(
                    color: Constantes.ColorvertFonce,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold),
              ),
            ),
            _carte(
              context,
              title:
                  "Veuillez cliquez sur une culture pour effectuer l'analyse",
              sizeTitle: 21.sp,
              sizeCarte: 23.h,
              boldTitle: FontWeight.w600,
              image: 'assets/images/cornfield.jpgg',
              background: Constantes.Colorwhite,
              colortext: Constantes.ColorvertFonce,
            ),
            _carte(
              context,
              title: selectedImage==null? "Découvrez notre système d'analyse de plante": "Résultat de l'analyse",
              sizeTitle: 18.sp,
              boldTitle: FontWeight.w500,
              sizeCarte: 40.h,
              simple: Flexible(
                child: selectedImage==null? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Dévoilez les secrets de vos plantes en un instant ! "
                      "Transformez une simple photo en une consultation végétale personnalisée. "
                      "Découvrez la santé de vos cultures, "
                      "identifiez les éventuelles maladies et cultivez le futur avec notre analyse intelligente. "
                      "Votre jardin mérite le meilleur, offrez-lui une expertise numérique aujourd'hui !",
                      style: TextStyle(fontSize: 16.sp, wordSpacing: 5),
                    ),
                    Spacer(),
                    Text(
                      "ORIENTATION",
                      style: TextStyle(
                        color: Constantes.ColorvertFonce,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "Cliquez sur les noms des cultures ci-dessus",
                      style: TextStyle(),
                    ),
                  ],
                ): Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.file(selectedImage!, height: 50.sp),
                    Spacer(),
                    Text(
                      "RESULTAT",
                      style: TextStyle(
                        color: Constantes.ColorvertFonce,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "${diagnostique.data}",
                      style: TextStyle(),
                    ),
                  ],
                ),
              ),
              image: 'assets/images/cornfield.jpgg',
              background: Constantes.Colorwhite,
              colortext: Constantes.ColorvertFonce,
            ),
          ]),
        ),
      ],
    );
  }

  _carte(
    BuildContext context, {
    required String title,
    required double sizeTitle,
    FontWeight? boldTitle,
    required String image,
    required Color background,
    double? sizeCarte,
    Widget? simple,
    required Color colortext,
  }) {
    return Container(
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: background,
          boxShadow: [
            BoxShadow(
              blurRadius: 2,
              blurStyle: BlurStyle.outer,
              color: Colors.black54,
              offset: Offset.fromDirection(1),
            )
          ]),
      height: sizeCarte ?? 200,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "$title",
              style: TextStyle(
                  color: colortext, fontSize: sizeTitle, fontWeight: boldTitle),
            ),
            Divider(
              color: Colors.black54,
            ),
            simple ??
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      button(text: "Manioc", onPressed: (){
                        ouvrirDialog(context, plant:'cassava');
                      }),
                      button(text: "Maïs", onPressed: (){
                        ouvrirDialog(context, plant:'corn');
                      }),
                      button(text: "Riz", onPressed: (){
                        ouvrirDialog(context, plant:'rice');
                      }),
                      button(text: "Tomate", onPressed: (){
                        ouvrirDialog(context, plant:'tomato');
                      }),
                    ],
                  ),
                )
          ],
        ),
      ),
    );
  }



  getImageGallery() async {
    final pickedImage = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedImage != null) {
        selectedImage = File(pickedImage.path);
      } else {
        print("Aucune image sélectionnée.");
      }
    });
  }

  getImageCamera() async {
    var pickedImage = await _picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedImage != null) {
        selectedImage = File(pickedImage.path);
      } else {
        print("Aucune image sélectionnée.");
      }
    });
  }

  resultatDialog(context) async {
    bool? resulat = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: Text('Résultat de l\'analyse')),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              selectedImage != null
                  ? Container(
                      child: Image.file(
                      selectedImage!,
                      height: 20.h,
                      fit: BoxFit.cover,
                    ))
                  : Icon(
                      Icons.add_a_photo,
                      size: 20.sp,
                      color: Colors.grey,
                    ),
              SizedBox(height: 16.0.sp),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Constantes.ColorvertFonce)),
                onPressed: () {
                  // String postText = _textEditingController.text;
                  Navigator.pop(context);
                  selectedImage = null;
                  setState(() {});
                },
                child: Text("Publier"),
              )
            ],
          ),
        );
      },
    );

    // if (resulat != null) {
    //   var message = !resulat ? "Déconnexion annulée" : "Déconnexion";
    //   showSnackBar(context, message);
    // }
  }

  Widget button(
      {Function? onPressed, required String text, }) {
    return InkWell(
      child: Container(
        child: Text(
          "$text",
          style: TextStyle(
              color: Colors.black87,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500),
        ),
      ),
      onTap: onPressed as void Function()?,
    );
  }

  _carteGrand(String title, String image, Color background, Color colortext,
      {Function? onTap}) {
    return InkWell(
        child: Container(
          width: Adaptive.w(500),
          height: 30.h,
          margin: EdgeInsets.all(15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              image: DecorationImage(image: AssetImage(image))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Flexible(
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Constantes.ColorvertFonce,
                    ),
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 60,
                    child: Text(
                      title,
                      style: TextStyle(
                          color: colortext,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w300),
                    )),
              ),
            ],
          ),
        ),
        onTap: onTap!());
  }
}
