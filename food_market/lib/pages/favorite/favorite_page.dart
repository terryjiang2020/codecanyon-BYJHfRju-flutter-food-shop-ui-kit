import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:food_market/helpers/constants.dart';
import 'package:food_market/models/favorite.dart';
import 'package:food_market/widgets/empty_widget.dart';
import 'package:food_market/widgets/food_card.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});
  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage>
    with SingleTickerProviderStateMixin {
  ScrollController? _scrollViewController;
  bool _showAppbar = true;
  bool isScrollingDown = false;

  @override
  void initState() {
    super.initState();
    _scrollViewController = ScrollController();
    _scrollViewController!.addListener(() {
      if (_scrollViewController!.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (!isScrollingDown) {
          isScrollingDown = true;
          _showAppbar = false;
          setState(() {});
        }
      }

      if (_scrollViewController!.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (isScrollingDown) {
          isScrollingDown = false;
          _showAppbar = true;
          setState(() {});
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollViewController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return mockFavoriteList.isNotEmpty
        ? Stack(
            children: [
              buildMainContent(theme),
              if (_showAppbar) buildCollapseAppBar(theme) else const SizedBox(),
            ],
          )
        : EmptyWidget(
            image: Const.illustration1,
            title: AppLocalizations.of(context)!.ouch_hungry,
            subtitle: AppLocalizations.of(context)!
                .seems_like_you_have_not_have_a_favorite_food_yet,
            labelButton: AppLocalizations.of(context)!.find_foods,
          );
  }

  Positioned buildCollapseAppBar(ThemeData theme) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      height: 85,
      child: AnimatedContainer(
        height: _showAppbar ? 85.0 : 0.0,
        duration: const Duration(milliseconds: 1000),
        child: Container(
          color: theme.colorScheme.background,
          alignment: Alignment.bottomLeft,
          padding: const EdgeInsets.only(left: Const.margin, bottom: 15),
          child: Text(
            AppLocalizations.of(context)!.your_favorite_food,
            style: theme.textTheme.headlineLarge,
          ),
        ),
      ),
    );
  }

  Positioned buildMainContent(ThemeData theme) {
    final content = Positioned.fill(
      child: SingleChildScrollView(
        key: const PageStorageKey('favorite_page'),
        controller: _scrollViewController,
        child: GridView.builder(
          itemCount: mockFavoriteList.length,
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          padding: const EdgeInsets.symmetric(
            horizontal: Const.margin,
            vertical: 100,
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            childAspectRatio: 2.0 / 3.5,
          ),
          itemBuilder: (context, index) {
            final fav = mockFavoriteList[index];
            return FoodCard(
              food: fav.food,
              isGrid: true,
            );
          },
        ),
      ),
    );

    return content;
  }
}
