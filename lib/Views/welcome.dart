import 'package:alemeno/Views/pricing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Welcome extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 115, bottom: 120),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InitialText(),
          InstImage(),
          PricingButton(),
        ],
      ),
    );
  }
}
class InitialText extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 314,
      child: Text('This is the last animal left on the planet, save this animal to survive.', style: TextStyle(fontSize: 14), textAlign: TextAlign.center,),
    );
  }
}

class InstImage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 298,
      width: 298,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage('assets/images/animal.gif'),
          fit: BoxFit.fill
        )
      ),
    );
  }
}
class PricingButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Pricing()));
        },
        child: Text('Show Pricing', style: TextStyle(fontSize: 20, color: Colors.white),),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Color(0xFF5F2EEA)),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8)
        )),
        padding: MaterialStateProperty.all(EdgeInsets.only(top: 11, bottom: 11, left: 35, right: 35))
      ),
    );
  }
}