import 'package:flutter/material.dart';
import './ui/page.dart';
import 'package:kaka_flutter_mp/component/MAppBar.dart';

class WalletIndex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
       appBar: MAppBar(
         title: Text('钱包',style: TextStyle(
           fontSize: 18,
         ),),
         isgoback:true
       ).build(context),
       body:Page()
     );
   }
}