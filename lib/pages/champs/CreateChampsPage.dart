
import 'package:bbopt_mobile/controllers/ChampController.dart';
import 'package:bbopt_mobile/pages/user/ProfilPage.dart';
import 'package:bbopt_mobile/utils/Constantes.dart';
import 'package:bbopt_mobile/utils/Routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CreateChampsPage extends StatefulWidget {
  const CreateChampsPage({Key? key}) : super(key: key);

  @override
  State<CreateChampsPage> createState() => _CreateChampsPageState();
}

class _CreateChampsPageState extends State<CreateChampsPage> {
  TextEditingController nomChamps = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController typeSol = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  // TextEditingController nomChamps = TextEditingController();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var champCtrl = context.read<ChampController>();
      champCtrl.recuperChampAPI();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constantes.ColorLight,
      appBar: AppBar(
        title: Text("CREATION CHAMPS"),
        leadingWidth: 25.sp,
        centerTitle: true,
        backgroundColor: Constantes.ColorvertFonce,
      ),
      body: _body(),
    );
  }
  int _activeStep = 0;

  Widget _body(){
    return Stack(
      children: [
        stepCreate()
      ],
    );
  }
  List<Map> _myListCulture = [
    {
      "type":"mais"
    }
  ];
  List<Step> listOfStep()=>[
     Step(
      state: _activeStep<=0? StepState.editing:StepState.complete,
        isActive:  _activeStep>=0,
        title: Text("Champ"),
        content: Center(
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Center(
                        child: Text(
                            "Informations du champ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0.sp
                          ),
                        )
                    ),
                    SizedBox(height: 20.sp,),
                    TextFormField(
                      controller: nomChamps,
                      decoration: InputDecoration(
                        labelText: 'Nom du champ',
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 16.0.sp,
                          horizontal: 16.0.sp,
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Veuillez entrer le nom du champ';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        nomChamps.text = value!;
                      },
                    ),
                    SizedBox(height: 15.sp),
                    TextFormField(
                      controller: location,
                      decoration: InputDecoration(
                        labelText: 'Location du champ',
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 16.0.sp,
                          horizontal: 16.0.sp,
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Veuillez entrer la location de votre champ';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        location.text = value!;
                      },
                    ),
                    SizedBox(height: 15.sp),
                    TextFormField(
                      controller: typeSol,
                      decoration: InputDecoration(
                        labelText: 'Type de sol',
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 16.0.sp,
                          horizontal: 16.0.sp,
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Veuillez entrer la location de votre champ';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        typeSol.text = value!;
                      },
                    ),
                  ],
                ),
              ),
            )
        )
    ),
     Step(
         state: _activeStep<=1? StepState.editing:StepState.complete,
         isActive: _activeStep>=1,
        title: Text("Cultures"),
        content: Center(
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Form(
                key: _formKey2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Center(
                        child: Text(
                          "Ajouter la(les) culture(s)",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0.sp
                          ),
                        )
                    ),
                    SizedBox(height: 20.sp,),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Ajouter les cultures',
                        hintText: 'eg: manioc, riz...',
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 16.0.sp,
                          horizontal: 16.0.sp,
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Veuillez entrer les cultures';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _myListCulture = value! as List<Map>;
                      },
                    ),
                  ],
                ),
              ),
            )
        )
    ),
     Step(
         state: _activeStep<=2? StepState.editing:StepState.complete,
         isActive: _activeStep>=2,
        title: Text("Confirmer"),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                  "Confirmer les données",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0.sp
                ),
              ),
            ),
            SizedBox(height: 20.sp,),
            Text("Nom du champ : ${nomChamps.text}",style: TextStyle(fontSize: 18.sp),),
            SizedBox(height: 10.sp,),
            Text("Location : ${location.text}",style: TextStyle(fontSize: 18.sp),),
            SizedBox(height: 10.sp,),
            Text("Type de sol : ${typeSol.text}",style: TextStyle(fontSize: 18.sp),),
            SizedBox(height: 10.sp,),
            Text("Cultures : ${_myListCulture.map((e) => e['type']).toList()}",style: TextStyle(fontSize: 18.sp),),
          ],
        )
    ),
  ];

  stepCreate(){
    return Theme(
      data: ThemeData(
        colorScheme: Theme.of(context).colorScheme.copyWith(
          primary: Constantes.ColorvertFonce,
        ),
      ),
      child: Stepper(
        type: StepperType.horizontal,
          currentStep: _activeStep,
          steps: listOfStep(),
        onStepContinue: (){
          if (_activeStep < (listOfStep().length-1)){
            _activeStep +=1;
          }
          setState(() {});
        },
        onStepCancel: (){
          if(_activeStep==0){
            return;
          }
          _activeStep -=1;
          setState(() {});
        },
        onStepTapped: (value)=> setState(()=>_activeStep=value),
        controlsBuilder: (BuildContext context, ControlsDetails details){
          return Container(
          margin: EdgeInsets.only(top: 25.sp),
            child: Row(
              children: [
                if (_activeStep == (listOfStep().length-1))
                Expanded(child: ElevatedButton(
                  onPressed:  details.onStepContinue ,
                  child: Text("ENVOYER"),
                ))
                else
                Expanded(child: ElevatedButton(
                  onPressed:  details.onStepContinue ,
                  child: Text("CONTINUE"),
                )),
                SizedBox(width: 6.sp,),
                if(_activeStep!=0)
                Expanded(child: ElevatedButton(
                  onPressed:  details.onStepCancel ,
                  child: Text("RENTRER"),
                )),
              ],
            ),
          );
        },
      ),
    );
  }

}

