import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:zeta_flutter/zeta_flutter.dart';

import 'pages/assets/icon_widgetbook.dart';
import 'pages/components/accordion_widgetbook.dart';
import 'pages/components/avatar_widgetbook.dart';
import 'pages/components/badges_widgetbook.dart';
import 'pages/components/banner_widgetbook.dart';
import 'pages/components/bottom_sheet_widgetbook.dart';
import 'pages/components/button_widgetbook.dart';
import 'pages/components/checkbox_widgetbook.dart';
import 'pages/components/chip_widgetbook.dart';
import 'pages/components/dial_pad_widgetbook.dart';
import 'pages/components/in_page_banner_widgetbook.dart';
import 'pages/components/navigation_bar_widgetbook.dart';
import 'pages/components/password_input_widgetbook.dart';
import 'pages/components/progress_widgetbook.dart';
import 'pages/theme/color_widgetbook.dart';
import 'pages/theme/radius_widgetbook.dart';
import 'pages/theme/spacing_widgetbook.dart';
import 'pages/theme/typography_widgetbook.dart';
import 'utils/zebra.dart';

void main() => runApp(const HotReload());

class HotReload extends StatelessWidget {
  const HotReload({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook(
      appBuilder: (context, child) => child,
      directories: [
        WidgetbookCategory(
          name: 'Components',
          isInitiallyExpanded: false,
          children: [
            WidgetbookComponent(
              name: 'Badge',
              useCases: [
                WidgetbookUseCase(name: 'Status Label', builder: (context) => statusLabelUseCase(context)),
                WidgetbookUseCase(name: 'Priority Pill', builder: (context) => priorityPillUseCase(context)),
                WidgetbookUseCase(name: 'Badge', builder: (context) => badgeUseCase(context)),
                WidgetbookUseCase(name: 'Indicators', builder: (context) => indicatorsUseCase(context)),
                WidgetbookUseCase(name: 'Tags', builder: (context) => tagsUseCase(context)),
                WidgetbookUseCase(
                    name: 'Workcloud Indicators', builder: (context) => workcloudIndicatorsUseCase(context)),
              ],
            ),
            WidgetbookUseCase(name: 'Avatar', builder: (context) => avatarUseCase(context)),
            WidgetbookUseCase(name: 'Checkbox', builder: (context) => checkboxUseCase(context)),
            WidgetbookComponent(
              name: 'Buttons',
              useCases: [
                WidgetbookUseCase(name: 'Button', builder: (context) => buttonUseCase(context)),
                WidgetbookUseCase(name: 'Icon Button', builder: (context) => iconButtonUseCase(context)),
                WidgetbookUseCase(
                    name: 'Floating Action Button', builder: (context) => floatingActionButtonUseCase(context)),
                WidgetbookUseCase(name: 'Group Button', builder: (context) => buttonGroupUseCase(context)),
              ],
            ),
            WidgetbookUseCase(name: 'Banners', builder: (context) => bannerUseCase(context)),
            WidgetbookUseCase(name: 'In Page Banners', builder: (context) => inPageBannerUseCase(context)),
            WidgetbookUseCase(name: 'Accordion', builder: (context) => accordionUseCase(context)),
            WidgetbookComponent(
              name: 'Chips',
              useCases: [
                WidgetbookUseCase(name: 'Filter Chip', builder: (context) => filterChipUseCase(context)),
                WidgetbookUseCase(name: 'Input Chip', builder: (context) => inputChipUseCase(context)),
                WidgetbookUseCase(name: 'Assist Chip', builder: (context) => assistChipUseCase(context)),
              ],
            ),
            WidgetbookUseCase(name: 'Password Input', builder: (context) => passwordInputUseCase(context)),
            WidgetbookUseCase(name: 'Bottom Sheet', builder: (context) => bottomSheetContentUseCase(context)),
            WidgetbookUseCase(name: 'Dial Pad', builder: (context) => dialPadUseCase(context)),
            WidgetbookUseCase(name: 'Navigation Bar', builder: (context) => navigationBarUseCase(context)),
            WidgetbookComponent(
              name: 'Progress',
              useCases: [
                WidgetbookUseCase(name: 'Bar', builder: (context) => progressBarUseCase(context)),
                WidgetbookUseCase(name: 'Circle', builder: (context) => progressCircleUseCase(context))
              ],
            ),
          ]..sort((a, b) => a.name.compareTo(b.name)),
        ),
        WidgetbookCategory(
          name: 'Theme',
          isInitiallyExpanded: false,
          children: [
            WidgetbookUseCase(name: 'Typography', builder: (context) => typographyUseCase(context)),
            WidgetbookUseCase(name: 'Color', builder: (context) => colorUseCase(context)),
            WidgetbookUseCase(name: 'Spacing', builder: (context) => spacingUseCase(context)),
            WidgetbookUseCase(name: 'Radius', builder: (context) => radiusUseCase(context)),
          ]..sort((a, b) => a.name.compareTo(b.name)),
        ),
        WidgetbookCategory(
          name: 'Assets',
          isInitiallyExpanded: false,
          children: [
            WidgetbookUseCase(name: 'Icons', builder: (context) => iconsUseCase(context)),
          ]..sort((a, b) => a.name.compareTo(b.name)),
        ),
      ],
      addons: [
        DeviceFrameAddon(
          devices: [
            Devices.windows.wideMonitor,
            Devices.macOS.wideMonitor,
            Devices.ios.iPad,
            Devices.ios.iPhone13,
            Zebra.ec30,
            Zebra.ec50,
          ],
        ),
        ThemeAddon(
          themes: [
            WidgetbookTheme(name: 'Light Mode', data: _Theme(isDark: false, isAAA: false)),
            WidgetbookTheme(name: 'Dark Mode', data: _Theme(isDark: true, isAAA: false)),
            WidgetbookTheme(name: 'Light Mode AAA', data: _Theme(isDark: false, isAAA: true)),
            WidgetbookTheme(name: 'Dark Mode AAA', data: _Theme(isDark: true, isAAA: true)),
          ],
          themeBuilder: (context, theme, child) {
            _Theme _theme = theme;
            return ZetaProvider(
              initialContrast: _theme.isAAA ? ZetaContrast.aaa : ZetaContrast.aa,
              initialThemeMode: _theme.isDark ? ThemeMode.dark : ThemeMode.light,
              builder: (context, theme, themeMode) {
                return Builder(
                  builder: (context) {
                    final dark = theme.colorsDark.toScheme();
                    final light = theme.colorsLight.toScheme();

                    return MaterialApp(
                      debugShowCheckedModeBanner: false,
                      themeMode: themeMode,
                      theme: ThemeData(
                        useMaterial3: true,
                        scaffoldBackgroundColor: light.background,
                        colorScheme: light,
                        textTheme: zetaTextTheme,
                        brightness: Brightness.light,
                      ),
                      darkTheme: ThemeData(
                        useMaterial3: true,
                        scaffoldBackgroundColor: dark.background,
                        colorScheme: dark,
                        textTheme: zetaTextTheme,
                        brightness: Brightness.dark,
                      ),
                      builder: (context, child) {
                        return ColoredBox(
                          color: Zeta.of(context).colors.surfacePrimary,
                          child: child,
                        );
                      },
                      home: child,
                    );
                  },
                );
              },
            );
          },
        ),
      ],
    );
  }
}

class _Theme {
  final bool isDark;
  final bool isAAA;

  _Theme({required this.isDark, required this.isAAA});
}
