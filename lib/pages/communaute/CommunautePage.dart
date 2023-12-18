import 'dart:io';

import 'package:bbopt_mobile/controllers/CommunauteController.dart';
import 'package:bbopt_mobile/pages/user/ProfilPage.dart';
import 'package:bbopt_mobile/utils/Constantes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:share_plus/share_plus.dart';

class CommunautePage extends StatefulWidget {
  const CommunautePage({Key? key}) : super(key: key);

  @override
  State<CommunautePage> createState() => _CommunautePageState();
}

class _CommunautePageState extends State<CommunautePage> with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: Duration(seconds: 1))
        ..repeat(reverse: true);

  late final Animation<double> _animation =
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack);

  TextEditingController _textEditingController = TextEditingController();
  File? _image;
  final picker = ImagePicker();

  getImage() async {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedImage != null) {
        _image = File(pickedImage.path);
      } else {
        print("Aucune image sélectionnée.");
      }
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var postsCtrl = context.read<CommunauteController>();
      postsCtrl.recuperPostsAPI();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var postCtrl = context.watch<CommunauteController>();
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
          centerTitle: true,
          iconTheme: IconThemeData(color: Constantes.Colorwhite),
          backgroundColor: Constantes.ColorvertFonce,
          actions: [
            postCtrl.posts ==null?
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: FadeTransition(
                      opacity: _animation,
                    child: Placeholder(
                      color: Colors.transparent,
                      child: CircleAvatar(
                        maxRadius: 15.sp,
                        backgroundColor: Constantes.ColorLight,
                      ),
                    ),
                  ),
                )
            :Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                padding: EdgeInsets.only(right: 5),
                icon: Icon(CupertinoIcons.add_circled_solid),
                onPressed: () {
                  ouvrirDialog(context);
                },
              ),
            ),
          ],
        ),
        body: _body());
  }

  ouvrirDialog(context) async {
    bool? resulat = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: Text('Créé une publication')),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _textEditingController,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: "Que voulez-vous partager ?",
                  border: InputBorder.none,
                ),
              ),
              SizedBox(height: 16.0.sp),
              _image != null
                  ? Container(
                      child: Image.file(
                      _image!,
                      height: 20.h,
                      fit: BoxFit.cover,
                    ))
                  : IconButton(
                      icon: Icon(
                        Icons.add_a_photo,
                        size: 20.sp,
                        color: Colors.grey,
                      ),
                      onPressed: getImage,
                    ),
              SizedBox(height: 16.0.sp),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Constantes.ColorvertFonce)),
                onPressed: () {
                  // String postText = _textEditingController.text;
                  Navigator.pop(context);
                  _image = null;
                  setState(() {});
                },
                child: Text("Publier", style: TextStyle(color: Constantes.Colorwhite),),
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

  refleshPosts() async {
    var postCtrl = context.read<CommunauteController>();
    postCtrl.recuperPostsAPI();
    return Future.delayed(Duration(seconds: 1));
  }

  Widget _body() {
    var postCtrl = context.watch<CommunauteController>();
    final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
        GlobalKey<RefreshIndicatorState>();
    return RefreshIndicator(
      color: Constantes.ColorvertFonce,
      key: _refreshIndicatorKey,
      edgeOffset: 0.5,
      triggerMode: RefreshIndicatorTriggerMode.onEdge,
      onRefresh: () => refleshPosts(),
      child: Stack(
        children: [
          ListView.builder(
            shrinkWrap: false,
            physics: ScrollPhysics(),
            itemCount: postCtrl.posts?.length,
            itemBuilder: (BuildContext ctx, index) {
              var post = postCtrl.posts?[index];
              return Container(
                  color: Constantes.ColorLight,
                  child: Column(children: [
                    post != null
                        ? _post(
                            nameUser:
                                "${post?.user?.firstname} ${post?.user?.name}",
                            description: "${post?.description}",
                            image: "assets/images/VISUEL-BBOPT-DECL3.jpg",
                            //"${Constantes.BASE_URL}/${post?.image}",
                            background: Constantes.ColorvertFonce,
                            nbrLike: 746,
                            nbrComment: 385,
                            colortext: Constantes.Colorjaune,
                          )
                        : noData(),
                  ]));
            },
          ),
          if(postCtrl.posts==null)Center(
            child: Text("Ploblème de connexion  😤"),
          )
        ],
      ),
    );
  }

  _post(
      {String? nameUser,
      String? description,
      String? image,
      Color? background,
      int? nbrLike,
      int? nbrComment,
      Color? colortext}) {
    return Container(
      margin: EdgeInsets.only(top: 20.sp, right: 10.sp, left: 10.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Constantes.Colorwhite,
      ),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.all(12.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Constantes.Colorjaune,
                    ),
                    SizedBox(width: Adaptive.w(3)),
                    Text("$nameUser")
                  ],
                ),
                SizedBox(height: 3.h),
                ReadMoreText(
                  "$description",
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'En voir plus',
                  trimExpandedText: ' voir moins',
                  moreStyle:
                      TextStyle(fontSize: 15.5.sp, fontWeight: FontWeight.bold),
                  lessStyle:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Image.asset(
            image!,
            fit: BoxFit.cover,
            width: Adaptive.w(double.infinity),
          ),
          Container(
              decoration: BoxDecoration(
                color: Constantes.Colorwhite,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(19.sp),
                    bottomLeft: Radius.circular(19.sp)),
              ),
              alignment: Alignment.center,
              width: Adaptive.w(double.infinity),
              height: 10.h,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.favorite,
                                color: Constantes.Colorjaune,
                              ),
                            ),
                            Text("609", style: TextStyle(color: colortext)),
                          ],
                        ),
                        SizedBox(width: 10),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.comment,
                                color: Constantes.Colorjaune,
                              ),
                            ),
                            Text("120", style: TextStyle(color: colortext)),
                          ],
                        ),
                      ]),
                      Row(children: [
                        IconButton(
                          onPressed: () {
                            sharePosts();
                          },
                          icon: Icon(
                            Icons.share,
                            color: Constantes.Colorjaune,
                          ),
                        ),
                      ])
                    ]),
              )),
        ],
      ),
    );
  }

  noData() {
    return Container(
      margin: EdgeInsets.only(top: 20.sp, right: 10.sp, left: 10.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Constantes.Colorjaune,
      ),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.all(12.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    FadeTransition(
                      opacity: _animation,
                      child: Placeholder(
                        color: Colors.transparent,
                        child: CircleAvatar(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Constantes.ColorLight,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: Adaptive.w(3)),
                    FadeTransition(
                        opacity: _animation,
                        child: Placeholder(
                            color: Colors.transparent,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Constantes.ColorLight,
                                  ),
                                  width: Adaptive.w(15),
                                  height: 2.h,
                                ),
                                SizedBox(width: 0.3.h,),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Constantes.ColorLight,
                                  ),
                                  width: Adaptive.w(15),
                                  height: 2.h,
                                ),
                              ],
                            )
                        ))
                  ],
                ),
                SizedBox(height: 3.h),
                FadeTransition(
                  opacity: _animation,
                  child: Placeholder(
                    color: Colors.transparent,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Constantes.ColorLight,
                          ),
                          width: Adaptive.w(30),
                          height: 1.h,
                        ),
                        SizedBox(height: 0.3.h,),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Constantes.ColorLight,
                          ),
                          width: Adaptive.w(80),
                          height: 1.h,
                        ),
                        SizedBox(height: 0.3.h,),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Constantes.ColorLight,
                          ),
                          width: Adaptive.w(90),
                          height: 1.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          FadeTransition(
            opacity: _animation,
            child: Placeholder(
              color: Colors.transparent,
              child: Container(
                decoration: BoxDecoration(
                  color: Constantes.ColorLight,
                ),
                width: Adaptive.w(double.infinity),
                // height: 5.h,
              ),
            ),
          ),
          Container(
              decoration: BoxDecoration(
                color: Constantes.Colorwhite,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(19.sp),
                    bottomLeft: Radius.circular(19.sp)),
              ),
              alignment: Alignment.center,
              width: Adaptive.w(double.infinity),
              height: 10.h,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(mainAxisSize: MainAxisSize.min, children: [
                        FadeTransition(
                          opacity: _animation,
                          child: Placeholder(
                            color: Colors.transparent,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Constantes.ColorLight,
                              ),
                              width: Adaptive.w(15),
                              height: 3.h,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        FadeTransition(
                          opacity: _animation,
                          child: Placeholder(
                            color: Colors.transparent,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Constantes.ColorLight,
                              ),
                              width: Adaptive.w(15),
                              height: 3.h,
                            ),
                          ),
                        ),
                      ]),
                      FadeTransition(
                        opacity: _animation,
                        child: Placeholder(
                          color: Colors.transparent,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Constantes.ColorLight,
                            ),
                            width: Adaptive.w(15),
                            height: 3.h,
                          ),
                        ),
                      )
                    ]),
              )),
        ],
      ),
    );
  }

  sharePosts() async {
    await Share.share(
      "text",
      subject: "subject",
      sharePositionOrigin:
          Rect.fromCenter(center: Offset.zero, width: 0, height: 0),
      // sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
    );
  }
}
