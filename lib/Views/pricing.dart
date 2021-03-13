import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Pricing extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Page(),
    );
  }
}
class Page extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 55, bottom: 150),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // new Expanded(child: heading()),
          // new Expanded(child: title()),
          // new Expanded(child: info()),
          // new Expanded(child: priceCards()),
          // new Expanded(child: proccedToPay()),
          Heading(),
          Title(),
          Info(),
          PriceCards(),
          ProccedToPay(),
        ],
      ),
    );
  }
}
class Heading extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        new Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 15),
                child:
                IconButton(icon: Icon(Icons.arrow_back, color: Colors.black,), onPressed: (){ Navigator.pop(context);},),
              )
            ],
          ),
        ),
        new Expanded(
          child: Image.asset('assets/images/logo.png'),
        ),
        new Expanded(child: SizedBox())
      ],
    );
  }
}

class Title extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Text('Pricing', style: TextStyle(color: Color(0xFF5F2EEA), fontSize: 20),);
  }
}

class Info extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Text('Go Premium to get more out of Alemeno', style: TextStyle(fontSize: 14),);
  }
}

List basicBenefits = <String>['Benefit 1', 'Benefit 2', 'Benefit 3'];
List goldBenefits = ['Benefit 1', 'Benefit 2', 'Benefit 3', 'Benefit 4', 'Benefit 5'];
class Plan {
  bool recommended;
  String name;
  List benefits;
  String price;
  Plan(this.recommended, this.name, this.benefits, this.price){}
}
int planSelected =1;
List <Plan> plans = [new Plan(false, 'Basic', basicBenefits, 'Monthly ₹499'), new Plan(true, 'Gold', goldBenefits, '3 Months ₹999')];
class PriceCards extends StatefulWidget{
  PriceCardState createState() => PriceCardState();
}
class PriceCardState extends State<PriceCards>{
  benifits(List b){
    return ListView.builder(
      shrinkWrap: true,
        itemCount: b.length,
        itemBuilder: (BuildContext context, int index) {
          return Row(
            children: [
              Icon(Icons.circle, size: 4, color: Color(0xFFD6D8E7),),
              Text('  ' + b[index], style: TextStyle(fontSize: 12, color: Color(0xFF6E7191)),)
            ],
          );
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 257,
          width: 358,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: plans.length,
            itemBuilder: (context, int index){
              return Container(
                child: InkWell(
                  onTap: (){
                    setState(() {
                      planSelected = index;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 4, right: 4),
                    padding: EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      color: Color(0xFFFCFCFC),
                      borderRadius: BorderRadius.circular(16),
                      border: index == planSelected? Border.all(color: Color(0xFF5F2EEA), width: 2): Border.all(color: Colors.white, width: 2),
                      boxShadow: index != planSelected?[
                        BoxShadow(
                          color: Color(0xFFEFF0F6),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ] : [],
                    ),
                    height: 257,
                    width: 170,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        plans[index].recommended == true? Text('RECOMMENDED', style: TextStyle(fontSize: 10, color: Color(0xFFA0A3BD)),) : SizedBox( height: 16,),
                        Text(plans[index].name, style: TextStyle(fontSize: 14, color: Color(0xFF5F2EEA)),),
                        SizedBox(
                            height: 150,
                            child: benifits(plans[index].benefits)
                        ),
                        Container(
                          transform: Matrix4.translationValues(-4, 0, 0),
                          child: Row(
                            children: [
                              Icon(Icons.fiber_manual_record_outlined,color: index == planSelected? Color(0xFF5F2EEA): Color(0xFFD6D8E7), size: 12,),
                              Text('  ' + plans[index].price, style: TextStyle(color: index == planSelected? Color(0xFF5F2EEA): Colors.black),),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}

class ProccedToPay extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 347,
            height: 64,
            decoration: BoxDecoration(
              color: Color(0xFF5F2EEA),
              borderRadius: BorderRadius.circular(8)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(' ₹999/3 Month', style: TextStyle(color: Colors.white),),
                Container(
                  margin: EdgeInsets.only(right: 38),
                  child: TextButton(
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.only(left: 27, right: 27)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)
                        )),
                        backgroundColor: MaterialStateProperty.all(Colors.white)
                    ),
                    child: Text('Continue', style: TextStyle(color: Colors.black),),
                  ),
                ),
              ],
            )
        )
      ],
    );
  }
}