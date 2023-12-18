import 'package:bbopt_mobile/pages/user/ProfilPage.dart';
import 'package:bbopt_mobile/utils/Constantes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../models/MessageModel.dart';

class DiscuterPage extends StatefulWidget {
  const DiscuterPage({Key? key}) : super(key: key);

  @override
  State<DiscuterPage> createState() => _DiscuterPageState();
}

class _DiscuterPageState extends State<DiscuterPage> {
  TextEditingController controller = TextEditingController();
  IconData? suffixIcon;
  bool isCheck = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constantes.ColorLight,
      drawer: ProfilPage(),
      appBar: AppBar(
        title: Text('DISCUTER', style: TextStyle(color: Constantes.Colorjaune),),
        centerTitle: true,
        iconTheme: IconThemeData(color: Constantes.Colorwhite),
        backgroundColor: Constantes.ColorvertFonce,
      ),
      body: _body()
    );
  }

example_graphic(){
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Checkbox(
                        checkColor: Constantes.Colorwhite,
                        focusColor: Constantes.Colorwhite,
                        hoverColor: Constantes.Colorwhite,
                        autofocus: true,
                        overlayColor: MaterialStateProperty.all(Constantes.ColorvertFonce),
                        value: isCheck,
                        onChanged: (bool? value){
                          setState(() {
                            isCheck = value!;
                          });
                        })
                  ],
                ),
                Row(),
                Row(),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              width: Adaptive.w(350),
              height: 25.h,
              child: Chart(
                data: Constantes.dataCharte,
                variables: {
                  'day': Variable(
                    accessor: (Map datum) => datum['day'].toString(),
                    scale: OrdinalScale(inflate: true),
                  ),
                  'value': Variable(
                    accessor: (Map datum) => datum['value'] as num,
                    scale: LinearScale(min: 0, max: 400),
                  ),
                  'group': Variable(
                    accessor: (Map datum) => datum['group'].toString(),
                  ),
                },
                marks: [
                  AreaMark(
                    position:
                    Varset('day') * Varset('value') / Varset('group'),
                    shape: ShapeEncode(value: BasicAreaShape(smooth: true)),
                    gradient: GradientEncode(
                      variable: 'group',
                      values: [
                        const LinearGradient(
                          begin: Alignment(0, 0),
                          end: Alignment(0, 1),
                          colors: [
                            Color.fromARGB(204, 128, 255, 165),
                            Color.fromARGB(204, 1, 191, 236),
                          ],
                        ),
                        const LinearGradient(
                          begin: Alignment(0, 0),
                          end: Alignment(0, 1),
                          colors: [
                            Color.fromARGB(204, 0, 221, 255),
                            Color.fromARGB(204, 77, 119, 255),
                          ],
                        ),
                        const LinearGradient(
                          begin: Alignment(0, 0),
                          end: Alignment(0, 1),
                          colors: [
                            Color.fromARGB(204, 55, 162, 255),
                            Color.fromARGB(204, 116, 21, 219),
                          ],
                        ),
                        const LinearGradient(
                          begin: Alignment(0, 0),
                          end: Alignment(0, 1),
                          colors: [
                            Color.fromARGB(204, 255, 0, 135),
                            Color.fromARGB(204, 135, 0, 157),
                          ],
                        ),
                        const LinearGradient(
                          begin: Alignment(0, 0),
                          end: Alignment(0, 1),
                          colors: [
                            Color.fromARGB(204, 255, 191, 0),
                            Color.fromARGB(204, 224, 62, 76),
                          ],
                        ),
                      ],
                      updaters: {
                        'groupMouse': {
                          false: (gradient) => LinearGradient(
                            begin: const Alignment(0, 0),
                            end: const Alignment(0, 1),
                            colors: [
                              gradient.colors.first.withAlpha(25),
                              gradient.colors.last.withAlpha(25),
                            ],
                          ),
                        },
                        'groupTouch': {
                          false: (gradient) => LinearGradient(
                            begin: const Alignment(0, 0),
                            end: const Alignment(0, 1),
                            colors: [
                              gradient.colors.first.withAlpha(25),
                              gradient.colors.last.withAlpha(25),
                            ],
                          ),
                        },
                      },
                    ),
                    modifiers: [StackModifier()],
                  ),
                ],
                axes: [
                  Defaults.horizontalAxis,
                  Defaults.verticalAxis,
                ],
                selections: {
                  'tooltipMouse': PointSelection(on: {
                    GestureType.hover,
                  }, devices: {
                    PointerDeviceKind.mouse
                  }, variable: 'day'),
                  'groupMouse': PointSelection(
                      on: {
                        GestureType.hover,
                      },
                      variable: 'group',
                      devices: {PointerDeviceKind.mouse}),
                  'tooltipTouch': PointSelection(on: {
                    GestureType.scaleUpdate,
                    GestureType.tapDown,
                    GestureType.longPressMoveUpdate
                  }, devices: {
                    PointerDeviceKind.touch
                  }, variable: 'day'),
                  'groupTouch': PointSelection(
                      on: {
                        GestureType.scaleUpdate,
                        GestureType.tapDown,
                        GestureType.longPressMoveUpdate
                      },
                      variable: 'group',
                      devices: {PointerDeviceKind.touch}),
                },
                tooltip: TooltipGuide(
                  selections: {'tooltipTouch', 'tooltipMouse'},
                  followPointer: [true, true],
                  align: Alignment.topLeft,
                ),
                crosshair: CrosshairGuide(
                  selections: {'tooltipTouch', 'tooltipMouse'},
                  followPointer: [false, true],
                ),
              ),
            ),
          ],
        ),
      ),
    );
}
  Widget _body(){
    return Column(
      children: [
        Expanded(
            child: GroupedListView(
              reverse: true,
              order: GroupedListOrder.DESC,
              useStickyGroupSeparators: true,
              floatingHeader: true,
              elements: Constantes.messages,
              groupBy: (messages) => DateTime(2023),
              groupHeaderBuilder: (MessageModel messages) => SizedBox(),
              itemBuilder: (context, MessageModel messages) => Align(
                alignment: messages.isSendByMe ?? true? Alignment.centerRight:Alignment.centerLeft,
                child: Card(
                  color: messages.isSendByMe ?? true? Constantes.Colorwhite:Constantes.Colorjaune,
                  elevation: 2.sp,
                  child: Padding(
                    padding: EdgeInsets.all(20.sp),
                    child: Text(
                      "${messages.text}",
                      style: TextStyle(color: messages.isSendByMe??true? Constantes.Colorjaune:Constantes.Colorwhite),
                    ),
                  ),
                ),
              ),
            )
        ),
        Container(
          margin: EdgeInsets.all(10.sp),
          decoration: BoxDecoration(
            color: Constantes.Colorwhite,
            borderRadius: BorderRadius.all(Radius.circular(15.sp)),
              boxShadow: [
                BoxShadow(
                  blurRadius: 1,
                  color: Colors.black54,
                  offset: Offset.fromDirection(1),
                )
              ]
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              cursorColor: Constantes.ColorvertFonce,
              cursorWidth: Adaptive.w(0.2),
              autocorrect: true,
              controller: controller,
              maxLines: 5,
              minLines: 1,
              onChanged: (text){

              },
              decoration: InputDecoration(
                hintText: "Entrez un message...",
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(10.sp),
                prefixIcon: Icon(Icons.account_circle, color: Constantes.ColorvertFonce,),
                icon: Icon(Icons.add_circle, color: Constantes.ColorvertFonce,),
                suffix: Icon(Icons.keyboard_voice_rounded, color: Constantes.ColorvertFonce,),
              ),

              onSubmitted: (text){
                final message = MessageModel(
                    text: text,
                    date: DateTime.now(),
                    isSendByMe: true
                );
                setState(() {
                  Constantes.messages.add(message);
                });
                controller.clear();
              },
            ),
          ),
        )
      ],
    );
  }
}
