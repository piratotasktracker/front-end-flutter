import 'package:flutter/material.dart';

abstract class IAppColorScheme {

  Brightness get brightness;

  //specific colors
  Color get onError;
  Color get errorContainer;
  Color get onErrorContainer;
  Color get surface;
  Color get outline;
  Color get outlineVariant;
  Color get inverseSurface;
  Color get inversePrimary;
  Color get primaryFixed;
  Color get onPrimaryFixed;
  Color get primaryFixedDim;
  Color get onPrimaryFixedVariant;
  Color get secondaryFixed;
  Color get onSecondaryFixed;
  Color get secondaryFixedDim;
  Color get onSecondaryFixedVariant;
  Color get tertiaryFixed;
  Color get onTertiaryFixed;
  Color get tertiaryFixedDim;
  Color get onTertiaryFixedVariant;
  Color get surfaceDim;
  Color get surfaceBright;
  Color get surfaceContainerLowest;
  Color get surfaceContainerLow;
  Color get surfaceContainer;
  Color get surfaceContainerHigh;
  Color get surfaceContainerHighest;

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

  @override
  Brightness get brightness => Brightness.light;

  //specific colors
  @override
  Color get onError => const Color(0xffffffff);
  @override
  Color get errorContainer => const Color(0xffffdad6);
  @override
  Color get onErrorContainer => const Color(0xff410002);
  @override
  Color get surface => const Color(0xfffcf8f8);
  @override
  Color get outline => const Color(0xff747879);
  @override
  Color get outlineVariant => const Color(0xffc4c7c8);
  @override
  Color get inverseSurface => const Color(0xff313030);
  @override
  Color get inversePrimary => const Color(0xffc6c6c6);
  @override
  Color get primaryFixed => const Color(0xffe2e2e2);
  @override
  Color get onPrimaryFixed => const Color(0xff1b1b1b);
  @override
  Color get primaryFixedDim => const Color(0xffc6c6c6);
  @override
  Color get onPrimaryFixedVariant => const Color(0xff474747);
  @override
  Color get secondaryFixed => const Color(0xffe2e2e2);
  @override
  Color get onSecondaryFixed => const Color(0xff1b1b1b);
  @override
  Color get secondaryFixedDim => const Color(0xffc6c6c6);
  @override
  Color get onSecondaryFixedVariant => const Color(0xff474747);
  @override
  Color get tertiaryFixed => const Color(0xffe2e2e2);
  @override
  Color get onTertiaryFixed => const Color(0xff1b1b1b);
  @override
  Color get tertiaryFixedDim => const Color(0xffc6c6c6);
  @override
  Color get onTertiaryFixedVariant => const Color(0xff474747);
  @override
  Color get surfaceDim => const Color(0xffddd9d9);
  @override
  Color get surfaceBright => const Color(0xfffcf8f8);
  @override
  Color get surfaceContainerLowest => const Color(0xffffffff);
  @override
  Color get surfaceContainerLow => const Color(0xfff7f3f2);
  @override
  Color get surfaceContainer => const Color(0xfff1edec);
  @override
  Color get surfaceContainerHigh => const Color(0xffebe7e7);
  @override
  Color get surfaceContainerHighest => const Color(0xffe5e2e1);

  //main colors
  @override
  Color get main001 => const Color(0xff000000);
  @override
  Color get main002 => const Color(0xff42b44d);

  //system colors
  @override
  Color get system001 => const Color(0xffba1a1a);
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

  @override
  Brightness get brightness => Brightness.dark;

  //specific colors
  @override
  Color get onError => const Color(0xff690005);
  @override
  Color get errorContainer => const Color(0xff93000a);
  @override
  Color get onErrorContainer => const Color(0xffffdad6);
  @override
  Color get surface => const Color(0xff141313);
  @override
  Color get outline => const Color(0xff8e9192);
  @override
  Color get outlineVariant => const Color(0xff444748);
  @override
  Color get inverseSurface => const Color(0xffe5e2e1);
  @override
  Color get inversePrimary => const Color(0xff5e5e5e);
  @override
  Color get onPrimaryFixed => const Color(0xff1b1b1b);
  @override
  Color get primaryFixed => const Color(0xffe2e2e2);
  @override
  Color get surfaceContainerLowest => const Color(0xff0e0e0e);
  @override
  Color get surfaceBright => const Color(0xff3a3939);
  @override
  Color get surfaceDim => const Color(0xff141313);
  @override
  Color get onTertiaryFixedVariant => const Color(0xff474747);
  @override
  Color get tertiaryFixedDim => const Color(0xffc6c6c6);
  @override
  Color get onTertiaryFixed => const Color(0xff1b1b1b);
  @override
  Color get tertiaryFixed => const Color(0xffe2e2e2);
  @override
  Color get onSecondaryFixedVariant => const Color(0xff474747);
  @override
  Color get secondaryFixedDim => const Color(0xffc6c6c6);
  @override
  Color get onSecondaryFixed => const Color(0xff1b1b1b);
  @override
  Color get secondaryFixed => const Color(0xffe2e2e2);
  @override
  Color get onPrimaryFixedVariant => const Color(0xff474747);
  @override
  Color get primaryFixedDim => const Color(0xffc6c6c6);
  @override
  Color get surfaceContainerLow => const Color(0xff1c1b1b);
  @override
  Color get surfaceContainer => const Color(0xff201f1f);
  @override
  Color get surfaceContainerHigh => const Color(0xff2a2a2a);
  @override
  Color get surfaceContainerHighest => const Color(0xff353434);

  //main colors
  @override
  Color get main001 => const Color(0xffD4D4D4);
  @override
  Color get main002 => const Color(0xff42b44d);

  //system colors
  @override
  Color get system001 => const Color(0xffffb4ab);
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