
import 'package:bbopt_mobile/controllers/ChampController.dart';
import 'package:bbopt_mobile/controllers/UserController.dart';
import 'package:bbopt_mobile/utils/Constantes.dart';
import 'package:flutter/cupertino.dart';
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
  TextEditingController cultures = TextEditingController();
  List<Map<String, String>> culturesList = [];
  var list;
  bool isCompleted = false; //check completeness of inputs
  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var userCtrl = context.read<UserCtrl>();
      userCtrl.recuperDataAPI();
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

  List<Step> listOfStep()=>[
     Step(
      state: _activeStep<=0? StepState.indexed:StepState.complete,
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
         state: _activeStep<=1? StepState.indexed:StepState.complete,
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
                      controller: cultures,
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
                        setState(() {
                          // var cultures = value?.split(",");
                          // for(var culture in cultures!) {
                          //   culturesList.add({"type": culture.trim()});
                          //   // print("DATA TAPER : =${cultures}");
                          // }
                        });
                      },
                    ),
                  ],
                ),
              ),
            )
        )
    ),
     Step(
         state: _activeStep>=2? StepState.complete:StepState.indexed,
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
            Text("Cultures : ${cultures.text}", style: TextStyle(fontSize: 18.sp)),
          ],
        )
    ),
  ];


  stepCreate(){
    var userCtrl = context.watch<UserCtrl>();
    var champCtrl = context.watch<ChampController>();
    var culturesTemp;
    culturesTemp = cultures.text.trim().split(",");
    culturesList.clear();
    for(String culture in culturesTemp) {
      culturesList.add({"type": culture});
    }


      Map<String, dynamic> formData = {
        'nom': nomChamps.text,
        'location': location.text.trim(),
        'type_sol': typeSol.text.trim(),
        'cultures': culturesList,
        "user_id":userCtrl.user?.id.toString()
      };
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
          final isLastStep = _activeStep == (listOfStep().length-1);
          _formKey.currentState!.validate();
          _formKey2.currentState!.validate();

          if ((
              _activeStep == (listOfStep().length-1))
              &&_formKey.currentState!.validate()
              && _formKey2.currentState!.validate()) {
            // Envoyer le formData à l'API
            print("DATA A ENVOYER : ${formData}");
            // print("DATA TAPER : ${culturesList}");
            champCtrl.createChampAPI(formData);
            Navigator.pop(context);
            setState(() {});
          }
          bool isDetailValid = isDetailComplete();
          if (isDetailValid) {
            if (isLastStep) {
              setState(() {
                isCompleted = true;
              });
            } else {
              setState(() {
                _activeStep +=1;
              });
            }
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
        // onStepTapped: (value)=> setState(()=>_activeStep=value),
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

  bool isDetailComplete() {
    if (_activeStep == 0) {
      //check sender fields
      if (nomChamps.text.isEmpty || location.text.isEmpty || typeSol.text.isEmpty) {
        return false;
      } else {
        return true; //if all fields are not empty
      }
    } else if (_activeStep == 1) {
      //check receiver fields
      if (cultures.text.isEmpty) {
        return false;
      } else {
        return true;
      }
    }
    return false;
  }

}

