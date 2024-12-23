import "package:flutter/foundation.dart";
import "package:flutter/material.dart";

import "package:front_end_flutter_tracker/styles/colors.dart";
import "package:front_end_flutter_tracker/styles/typography.dart";
import "package:front_end_flutter_tracker/util/no_trasition.dart";

class AppTheme {

  static ThemeData theme(IAppColorScheme colorScheme) => ThemeData(
    pageTransitionsTheme: PageTransitionsTheme(
    builders: kIsWeb ? {
        for(final platform in TargetPlatform.values)
          platform: const NoTransitionBuilder()
      } : {
        for(final platform in TargetPlatform.values)
          platform: const CupertinoPageTransitionsBuilder()
      }
    ),
    useMaterial3: true,
    colorScheme: ColorScheme(
      brightness: colorScheme.brightness, 
      primary: colorScheme.main001, 
      surfaceTint: colorScheme.mono005,
      onPrimary: colorScheme.mono002,
      primaryContainer: colorScheme.static002,
      onPrimaryContainer: colorScheme.mono008,
      secondary: colorScheme.mono002,
      onSecondary: colorScheme.mono003,
      secondaryContainer: colorScheme.static002,
      onSecondaryContainer: colorScheme.mono007,
      tertiary: colorScheme.mono001,
      onTertiary: colorScheme.mono0014,
      tertiaryContainer: colorScheme.static002,
      onTertiaryContainer: colorScheme.mono006,
      error: colorScheme.system001,
      onError: colorScheme.onError,
      errorContainer: colorScheme.errorContainer,
      onErrorContainer: colorScheme.onErrorContainer,
      surface: colorScheme.mono0014,
      onSurface: colorScheme.mono002,
      onSurfaceVariant: colorScheme.mono003,
      shadow: colorScheme.static002,
      scrim: colorScheme.static002,
      outline: colorScheme.outline,
      inverseSurface: colorScheme.inverseSurface,
      inversePrimary: colorScheme.inversePrimary,
      primaryFixed: colorScheme.primaryFixed,
      onPrimaryFixed: colorScheme.onPrimaryFixed,
      primaryFixedDim: colorScheme.primaryFixedDim,
      onPrimaryFixedVariant: colorScheme.onPrimaryFixedVariant,
      secondaryFixed: colorScheme.secondaryFixed,
      onSecondaryFixed: colorScheme.onSecondaryFixed,
      secondaryFixedDim: colorScheme.secondaryFixedDim,
      onSecondaryFixedVariant: colorScheme.onSecondaryFixedVariant,
      tertiaryFixed: colorScheme.tertiaryFixed,
      onTertiaryFixed: colorScheme.onTertiaryFixed,
      tertiaryFixedDim: colorScheme.tertiaryFixedDim,
      onTertiaryFixedVariant: colorScheme.onTertiaryFixedVariant,
      surfaceDim: colorScheme.surfaceDim,
      surfaceBright: colorScheme.surfaceBright,
      surfaceContainerLowest: colorScheme.surfaceContainerLowest,
      surfaceContainerLow: colorScheme.surfaceContainerLow,
      surfaceContainer: colorScheme.surfaceContainer,
      surfaceContainerHigh: colorScheme.surfaceContainerHigh,
      surfaceContainerHighest: colorScheme.surfaceContainerHighest,
    ),
    canvasColor: colorScheme.surface,
    textTheme: TextTheme(
      displayLarge: AppTypography.displayLarge(),
      displayMedium: AppTypography.displayMedium(),
      displaySmall: AppTypography.displaySmall(),
      headlineLarge: AppTypography.headlineLarge(),
      headlineMedium: AppTypography.headlineMedium(),
      headlineSmall: AppTypography.headlineSmall(),
      bodyLarge: AppTypography.bodyLarge(),
      bodyMedium: AppTypography.bodyMedium(),
      bodySmall: AppTypography.bodySmall(),
      labelLarge: AppTypography.labelLarge(),
      labelMedium: AppTypography.labelMedium(),
      labelSmall: AppTypography.labelSmall(),
      titleLarge: AppTypography.titleLarge(),
      titleMedium: AppTypography.titleMedium(),
      titleSmall: AppTypography.titleSmall(),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(56), // Button height
        backgroundColor: colorScheme.main001, // Background color
        foregroundColor: colorScheme.static001, // Text color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // Rounded corners
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20), // Horizontal padding
      ),
    ),
  );

}