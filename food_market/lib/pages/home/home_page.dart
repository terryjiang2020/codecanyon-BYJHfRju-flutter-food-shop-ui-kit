import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:food_market/helpers/constants.dart';
import 'package:food_market/models/food.dart';
import 'package:food_market/pages/home/new_taste/new_taste_tab.dart';
import 'package:food_market/pages/home/popular/popular_tab.dart';
import 'package:food_market/pages/home/recommended/recommended_tab.dart';
import 'package:food_market/providers/theme_provider.dart';
import 'package:food_market/widgets/food_card.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  ScrollController? _scrollViewController;
  TabController? _tabController;
  bool _showAppbar = true;
  bool isScrollingDown = false;

  @override
  void initState() {
    super.initState();
    _scrollViewController = ScrollController();
    _tabController = TabController(length: 3, vsync: this);
    _tabController!.addListener(_handleTabSelection);
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

  void _handleTabSelection() {
    if (_tabController!.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _scrollViewController!.dispose();
    _tabController!.dispose();
    super.dispose();
  }

  List<Widget> _homeTabBarList(BuildContext context) => [
        Tab(text: AppLocalizations.of(context)!.new_taste),
        Tab(text: AppLocalizations.of(context)!.popular),
        Tab(text: AppLocalizations.of(context)!.recommended),
      ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
      children: [
        buildMainContent(context),
        if (_showAppbar) buildCollapseAppBar(theme) else const SizedBox(),
      ],
    );
  }

  Positioned buildCollapseAppBar(ThemeData theme) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: AnimatedContainer(
        height: _showAppbar ? 85.0 : 0.0,
        duration: const Duration(milliseconds: 1000),
        child: AppBar(
          backgroundColor: theme.colorScheme.background,
          actions: const [
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: CircleAvatar(
                radius: 32,
                backgroundImage: CachedNetworkImageProvider(
                  Const.mockProfileImage,
                ),
              ),
            ),
            SizedBox(width: Const.margin),
          ],
        ),
      ),
    );
  }

  Positioned buildMainContent(BuildContext context) {
    final theme = Theme.of(context);
    final themeProv = Provider.of<ThemeProvider>(context);
    return Positioned.fill(
      child: SingleChildScrollView(
        controller: _scrollViewController,
        physics: const ScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 85),
            Padding(
              padding: const EdgeInsets.only(left: Const.margin),
              child: Text(
                AppLocalizations.of(context)!.lets_find_something_delicious,
                style: theme.textTheme.headlineLarge,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: Const.margin),
              padding: const EdgeInsets.symmetric(horizontal: Const.margin),
              decoration: BoxDecoration(
                color: theme.cardColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      autocorrect: false,
                      decoration: InputDecoration(
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        hintText: AppLocalizations.of(context)!
                            .search_your_favorite_food,
                        icon: Icon(
                          Feather.search,
                          size: 20,
                          color: themeProv.isDarkTheme! ? Colors.white : null,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Feather.sliders),
                    iconSize: 20,
                    color: theme.primaryColor,
                    onPressed: slidersOnTap,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: Const.margin),
              child: TabBar(
                controller: _tabController,
                indicatorColor: theme.primaryColor,
                labelColor: theme.primaryColor,
                unselectedLabelColor: theme.disabledColor,
                isScrollable: true,
                tabs: _homeTabBarList(context),
              ),
            ),
            Center(
              child: const [
                NewTasteTab(),
                PopularTab(),
                RecommendedTab(),
              ][_tabController!.index],
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.only(left: Const.margin),
              child: Text(
                AppLocalizations.of(context)!.which_you_might_like,
                style: theme.textTheme.headlineLarge,
              ),
            ),
            ListView.builder(
              itemCount: mockFoodList.length,
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(
                horizontal: Const.margin,
                vertical: 15,
              ),
              physics: const ScrollPhysics(),
              itemBuilder: (context, index) {
                final food = mockFoodList[index];
                return FoodVerticalCard(food: food);
              },
            ),
          ],
        ),
      ),
    );
  }

  void slidersOnTap() {}
}
