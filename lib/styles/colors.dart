import 'package:flutter/material.dart';

abstract class IAppColorScheme {

  //main colors
  Color get main001;
  Color get main002;

  //system colors
  Color get system001;
  Color get system002;
  Color get system003;
  Color get system004;
  Color get system005;
  Color get system006;
  Color get system007;

  //mono colors
  Color get mono001;
  Color get mono002;
  Color get mono003;
  Color get mono004;
  Color get mono005;
  Color get mono006;
  Color get mono007;
  Color get mono008;
  Color get mono009;
  Color get mono0010;
  Color get mono0011;
  Color get mono0012;
  Color get mono0013;
  Color get mono0014;

  //static colors
  Color get static001;
  Color get static002;

}


class LightAppColorsScheme implements IAppColorScheme {

  //main colors
  @override
  Color get main001 => const Color(0xff000000);
  @override
  Color get main002 => const Color(0xff42b44d);

  //system colors
  @override
  Color get system001 => const Color(0xffB44242);
  @override
  Color get system002 => const Color(0xffD07836);
  @override
  Color get system003 => const Color(0xffC0C93F);
  @override
  Color get system004 => const Color(0xff42B44D);
  @override
  Color get system005 => const Color(0xff2C79D4);
  @override
  Color get system006 => const Color(0xff7030A0);
  @override
  Color get system007 => const Color(0xff49154A);

  //mono colors
  @override
  Color get mono001 => const Color(0xff000000);
  @override
  Color get mono002 => const Color(0xff1A1A1A);
  @override
  Color get mono003 => const Color(0xff333333);
  @override
  Color get mono004 => const Color(0xff4D4D4D);
  @override
  Color get mono005 => const Color(0xff666666);
  @override
  Color get mono006 => const Color(0xff808080);
  @override
  Color get mono007 => const Color(0xff999999);
  @override
  Color get mono008 => const Color(0xffB3B3B3);
  @override
  Color get mono009 => const Color(0xffCCCCCC);
  @override
  Color get mono0010 => const Color(0xffE5E5E5);
  @override
  Color get mono0011 => const Color(0xffEBEBEB);
  @override
  Color get mono0012 => const Color(0xffF2F2F2);
  @override
  Color get mono0013 => const Color(0xffF9F9F9);
  @override
  Color get mono0014 => const Color(0xffFFFFFF);

  //static colors
  @override
  Color get static001 => const Color(0xffFFFFFF);
  @override
  Color get static002 => const Color(0xff000000);

}

class DarkAppColorsScheme implements IAppColorScheme {

  //main colors
  @override
  Color get main001 => const Color(0xffD4D4D4);
  @override
  Color get main002 => const Color(0xff42b44d);

  //system colors
  @override
  Color get system001 => const Color(0xffB44242);
  @override
  Color get system002 => const Color(0xffD07836);
  @override
  Color get system003 => const Color(0xffC0C93F);
  @override
  Color get system004 => const Color(0xff42B44D);
  @override
  Color get system005 => const Color(0xff2C79D4);
  @override
  Color get system006 => const Color(0xff7030A0);
  @override
  Color get system007 => const Color(0xff49154A);

  //mono colors
  @override
  Color get mono001 => const Color(0xffA3A3A3);
  @override
  Color get mono002 => const Color(0xffA2A2A2);
  @override
  Color get mono003 => const Color(0xff9F9F9F);
  @override
  Color get mono004 => const Color(0xff9B9B9B);
  @override
  Color get mono005 => const Color(0xff929292);
  @override
  Color get mono006 => const Color(0xff828282);
  @override
  Color get mono007 => const Color(0xff727272);
  @override
  Color get mono008 => const Color(0xff626262);
  @override
  Color get mono009 => const Color(0xff525252);
  @override
  Color get mono0010 => const Color(0xff272727);
  @override
  Color get mono0011 => const Color(0xff1C1C1C);
  @override
  Color get mono0012 => const Color(0xff212121);
  @override
  Color get mono0013 => const Color(0xff0D0D0D);
  @override
  Color get mono0014 => const Color(0xff000000);

  //static colors
  @override
  Color get static001 => const Color(0xffFFFFFF);
  @override
  Color get static002 => const Color(0xff000000);

}