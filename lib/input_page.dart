import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_widget.dart';
import 'icon_content.dart';

const bottomContainerHeight = 50.0;
const activeCard = Color(0xFF1D1E33);
const inActiveCardColour = Color(0xFF111328);
const BottomContainerColor = Color(0xFFEB1555);

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColour = inActiveCardColour;
  Color femaleCardColour = inActiveCardColour;

  //1 = male, 2= female
  void updateColour(Gender selectedGender) {
    if (selectedGender == Gender.male) {
      if (maleCardColour == inActiveCardColour) {
        maleCardColour = activeCard;
        femaleCardColour = inActiveCardColour;
      } else {
        maleCardColour = inActiveCardColour;
      }
    }
    if (selectedGender == Gender.female) {
      if (femaleCardColour == inActiveCardColour) {
        femaleCardColour = activeCard;
        maleCardColour = inActiveCardColour;
      } else {
        femaleCardColour = inActiveCardColour;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            //jenis kelamin
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: Expanded(
                      child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColour(Gender.male);
                      });
                    },
                    child: ReusableWidget(
                      color: maleCardColour,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                    ),
                  )),
                ),
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    setState(() {
                      updateColour(Gender.female);
                    });
                  },
                  child: ReusableWidget(
                    color: femaleCardColour,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                  ),
                )),
              ],
            )),
            //untuk tinggi badan
            Expanded(
                child: Row(
              children: [
                Expanded(child: ReusableWidget(color: activeCard)),
              ],
            )),
            //untuk berat dan umur
            Expanded(
                child: Row(
              children: [
                Expanded(child: ReusableWidget(color: activeCard)),
                Expanded(child: ReusableWidget(color: activeCard)),
              ],
            )),

            //tombol calculate

            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    color: BottomContainerColor,
                  ),
                  height: bottomContainerHeight,
                  width: double.infinity,
                  child: Text("CALCULATE"),
                )),
              ],
            ))
          ],
        ));
  }
}
