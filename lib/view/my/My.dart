import 'package:flutter/material.dart';
import 'package:kaka_flutter_mp/style/MTheme.dart';

import 'ui/Layout.dart';

//
class My extends StatelessWidget {
  final jumppage;

  My({Key key, this.jumppage}) :super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      color: MTheme.themeBGColor,
      child: Layout(jumppage: this.jumppage,),
    );
  }
}
