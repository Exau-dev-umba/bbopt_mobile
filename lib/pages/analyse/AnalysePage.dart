import 'dart:io';

import 'package:bbopt_mobile/pages/user/ProfilPage.dart';
import 'package:bbopt_mobile/utils/Constantes.dart';
import 'package:bbopt_mobile/utils/Routes.dart';
import 'package:bbopt_mobile/utils/widget/Chargement.dart';
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
  String plants = "";
  var data;
  bool _isLoading = false;

  Future<void> _loadingAnalyse() async {
    var diagnostique = context.read<AnalysePlanteController>();
    setState(() {
      _isLoading = true;
    });
    await diagnostique.sendImageToApi(imageFile: selectedImage, plant: plants);

    // await Future.delayed(Duration(seconds: 3));

    setState(() {
      data = diagnostique.data['info'];
      _isLoading = false;
    });
  }

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
                onPressed: () {
                  Navigator.pushNamed(context, Routes.notification);
                },
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
    bool? resulat = await showDialog<bool>(
      context: ctx,
      builder: (BuildContext context) {
        return AlertDialog(
            title: Center(child: Text('Ajouter une image')),
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
                    plants = plant;
                    Navigator.pop(context);
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
                    plants = plant;
                    Navigator.pop(context);
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
    return Stack(
      children: [
        Container(
          color: Constantes.ColorLight,
        ),
        SingleChildScrollView(
          child: Column(children: [

                Padding(
                  padding: const EdgeInsets.only(top: 8,),
                  child: Row(
                    children: [
                      if(selectedImage!=null)
                      IconButton(onPressed: (){
                        setState(() {
                          selectedImage = null;
                        });
                      }, icon: Icon(Icons.arrow_back, color: Constantes.ColorvertFonce,)),
                      Padding(
                        padding: selectedImage!=null? EdgeInsets.zero: EdgeInsets.only(left: 15),
                        child: Text(
                          "Analyse",
                          style: TextStyle(
                              color: Constantes.ColorvertFonce,
                              fontSize: 22.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
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
              title: selectedImage == null
                  ? "Découvrez notre système d'analyse de plante"
                  : "Analyse de la plante",
              sizeTitle: 18.sp,
              boldTitle: FontWeight.w500,
              sizeCarte: 40.h,
              simple: Flexible(
                child: selectedImage == null
                    ? Column(
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
                      )
                    : Container(
                        // color: Constantes.Colorjaune,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.file(selectedImage!, height: 50.sp),
                                SizedBox(
                                  width: Adaptive.w(5),
                                ),
                                SizedBox(
                                  width: Adaptive.w(40),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          "Appuyez sur le bouton ci-dessous pour analyser la photo de la plante.",
                                        ),
                                      ),
                                      ElevatedButton(
                                          onPressed: () {
                                            data = '';
                                            _loadingAnalyse();
                                          },
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStatePropertyAll(
                                                      Constantes
                                                          .ColorvertFonce)),
                                          child: Text("Analyser"))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Résultat : "),
                                Flexible(
                                  child: Text(
                                    "${data ?? ''}",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Description : "),
                                Flexible(
                                  child: Text(
                                    "${''}",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
              ),
              image: 'assets/images/cornfield.jpgg',
              background: Constantes.Colorwhite,
              colortext: Constantes.ColorvertFonce,
            ),
          ]),
        ),
        // _isLoading ? CircularProgressIndicator() : Text('En cliquer'),
        Chargement(_isLoading)
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
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
                      button(
                          text: "Manioc",
                          onPressed: () {
                            ouvrirDialog(context, plant: 'cassava');
                          }),
                      button(
                          text: "Maïs",
                          onPressed: () {
                            ouvrirDialog(context, plant: 'corn');
                          }),
                      button(
                          text: "Riz",
                          onPressed: () {
                            ouvrirDialog(context, plant: 'rice');
                          }),
                      button(
                          text: "Tomate",
                          onPressed: () {
                            ouvrirDialog(context, plant: 'tomato');
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
        data = '';
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
        data = '';
        selectedImage = File(pickedImage.path);
      } else {
        print("Aucune image sélectionnée.");
      }
    });
  }

  Widget button({
    Function? onPressed,
    required String text,
  }) {
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
}
