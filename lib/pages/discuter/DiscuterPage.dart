import 'package:bbopt_mobile/pages/user/ProfilPage.dart';
import 'package:bbopt_mobile/utils/Constantes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';

class DiscuterPage extends StatefulWidget {
  const DiscuterPage({Key? key}) : super(key: key);

  @override
  State<DiscuterPage> createState() => _DiscuterPageState();
}

class _DiscuterPageState extends State<DiscuterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: ProfilPage(),
      appBar: AppBar(
        title: Text('DISCUTER', style: TextStyle(color: Constantes.Colorjaune),),
        centerTitle: true,
        backgroundColor: Constantes.ColorvertFonce,
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 10),
        width: 350,
        height: 300,
        child: Chart(
          data: Constantes.dataCharte,
          variables: {
            'day': Variable(
              accessor: (Map datum) => datum['day'] as String,
              scale: OrdinalScale(inflate: true),
            ),
            'value': Variable(
              accessor: (Map datum) => datum['value'] as num,
              scale: LinearScale(min: 0, max: 1500),
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
    );
  }
}
