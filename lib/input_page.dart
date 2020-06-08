import 'package:bmi_calculator/resusable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constants.dart';
import 'icon_content.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender { MALE, FEMALE }

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                  child: Row(
                children: <Widget>[
                  Expanded(
                      child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.MALE;
                      });
                    },
                    cardColor: selectedGender == Gender.MALE
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardWidget: IconContent(
                      iconData: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                  )),
                  Expanded(
                      child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.FEMALE;
                      });
                    },
                    cardColor: selectedGender == Gender.FEMALE
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardWidget: IconContent(
                        iconData: FontAwesomeIcons.venus, label: 'FEMALE'),
                  )),
                ],
              )),
              Expanded(
                  child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      cardColor: kActiveCardColor,
                      cardWidget: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('HEIGHT', style: kLabelTextStyle),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: <Widget>[
                              Text(
                                height.toString(),
                                style: kNumberTextStyle,
                              ),
                              Text(
                                'cm',
                                style: kLabelTextStyle,
                              )
                            ],
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              activeTrackColor: Colors.white,
                              thumbColor: Color(0xFFEB1555),
                              overlayColor: Color(0x29EB1555),
                              thumbShape: RoundSliderThumbShape(
                                enabledThumbRadius: 12
                              ),
                              overlayShape: RoundSliderOverlayShape(
                                overlayRadius: 24
                              )
                            ),
                            child: Slider(
                              value: height.toDouble(),
                              min: kMinHeight,
                              max: kMaxHeight,
                              inactiveColor: Color(0xFF8D8E98),
                              onChanged: (double newValue){
                                setState(() {
                                  this.height = newValue.round();
                                });
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )),
              Expanded(
                  child: Row(
                children: <Widget>[
                  Expanded(
                      child: ReusableCard(
                    cardColor: kInactiveCardColor,
                  )),
                  Expanded(
                      child: ReusableCard(
                    cardColor: kInactiveCardColor,
                  )),
                ],
              )),
              Container(
                color: kButtonColor,
                margin: EdgeInsets.only(top: 8.0),
                width: double.infinity,
                height: kButtonContainerHeight,
              )
            ],
          ),
        ));
  }
}
