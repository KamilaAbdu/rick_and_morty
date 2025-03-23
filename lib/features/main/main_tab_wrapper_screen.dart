import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/core/assets/app_assets.dart';
import 'package:rick_and_morty/core/extensions/context_extension.dart';
import 'package:rick_and_morty/core/provider/theme_provider.dart';
import 'package:rick_and_morty/core/service/auto_router.dart';
import 'package:rick_and_morty/core/theme/app_colors.dart';
import 'package:rick_and_morty/core/theme/app_theme.dart';

@RoutePage()
class MainTabWrapperScreen extends StatelessWidget {
  const MainTabWrapperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.read<ThemeProvider>();
    return AutoTabsRouter.tabBar(
      routes: const [
        AllCharactersRoute(),
        LocationsRoute(),
        EpisodesRoute(),
        SettingsRoute(),
      ],
      builder: (context, child, controller) {
        final tabsRouter = AutoTabsRouter.of(context);

        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
            backgroundColor:
                themeProvider.currentTheme == AppTheme.darkTheme
                    ? AppColors.secondaryDark
                    : AppColors.lightGrey,
            selectedItemColor: AppColors.characterStatusGreen,
            unselectedItemColor: AppColors.uiDarkGrey,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppAssets.charactersNavigationBarItem,
                  height: 24,
                  width: 24,
                  colorFilter: ColorFilter.mode(
                    tabsRouter.activeIndex == 0
                        ? AppColors.characterStatusGreen
                        : AppColors.uiDarkGrey,
                    BlendMode.srcIn,
                  ),
                ),
                label: context.lang.navigationBarCharacters,
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppAssets.locationNavigationBarItem,
                  height: 24,
                  width: 24,
                  colorFilter: ColorFilter.mode(
                    tabsRouter.activeIndex == 1
                        ? AppColors.characterStatusGreen
                        : AppColors.uiDarkGrey,
                    BlendMode.srcIn,
                  ),
                ),
                label: context.lang.navigationBarLocations,
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppAssets.episodesNavigationBarItem,
                  height: 24,
                  width: 24,
                  colorFilter: ColorFilter.mode(
                    tabsRouter.activeIndex == 2
                        ? AppColors.characterStatusGreen
                        : AppColors.uiDarkGrey,
                    BlendMode.srcIn,
                  ),
                ),
                label: context.lang.navigationBarEpisodes,
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppAssets.settingsNavigationBarItem,
                  height: 24,
                  width: 24,
                  colorFilter: ColorFilter.mode(
                    tabsRouter.activeIndex == 3
                        ? AppColors.characterStatusGreen
                        : AppColors.uiDarkGrey,
                    BlendMode.srcIn,
                  ),
                ),
                label: context.lang.navigationBarSettings,
              ),
            ],
          ),
        );
      },
    );
  }
}
