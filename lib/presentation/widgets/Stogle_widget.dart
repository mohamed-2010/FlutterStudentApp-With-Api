import 'package:flutter/material.dart';

class STogleWidget extends StatefulWidget {
  STogleWidget({Key? key}) : super(key: key);

  @override
  State<STogleWidget> createState() => _STogleWidgetState();
}

class _STogleWidgetState extends State<STogleWidget> {
  bool toggleValue = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child:InkWell(
        onTap: (){
          setState(() {
            toggleValue = !toggleValue;
          });
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          height: 40,
          width: 80,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: toggleValue
                  ? Colors.greenAccent.shade100
                  : Colors.redAccent.shade100.withOpacity(0.5)),
          child:Stack(
            children: [
              AnimatedPositioned(
                duration: Duration(milliseconds: 200),
                curve: Curves.easeIn,
                top: 3,
                left: toggleValue ? 48 : 0,
                right: toggleValue ? 0 : 48,
                child: InkWell(
                  onTap: (){
                    setState(() {
                      toggleValue = !toggleValue;
                    });
                  },
                  child: AnimatedSwitcher(
                    duration: Duration(milliseconds: 200),
                    transitionBuilder:
                        (Widget child, Animation<double> animation) {
                      return RotationTransition(
                        child: child,
                        turns: animation,
                      );
                    },
                    child: toggleValue
                        ? Icon(
                      Icons.check_circle,
                      color: Colors.green,
                      size: 32,
                      key: UniqueKey(),
                    )
                        : Icon(
                      Icons.remove_circle_outline,
                      color: Colors.red,
                      size: 32,
                      key: UniqueKey(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )
      ,
    );
  }
}
