import 'package:flutter/material.dart';
import 'package:githao/generated/i18n.dart';
import 'package:githao/widgets/common_search_delegate.dart';
import 'package:githao/widgets/search_repo_tab.dart';

class CommonSearchPage extends StatefulWidget {
  static const ROUTE_NAME = '/common_search';
  static final List<String> tabTitles = [S.current.repositories, S.current.users];
  @override
  _CommonSearchPageState createState() => _CommonSearchPageState();
}

class _CommonSearchPageState extends State<CommonSearchPage> with TickerProviderStateMixin {
  TabController _tabController;
  String _query;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: CommonSearchPage.tabTitles.length, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if(mounted) {
        Future.delayed(const Duration(milliseconds: 100)).then((_) {
          if(mounted) {
            _showSearchView();
          }
        });
      }
    });
  }

  Future _showSearchView() async {
    String q = await showSearch<String>(context: context, delegate: CommonSearchDelegate(_query));
    if(q !=null && q.isNotEmpty) {
      this._query = '';
      if(mounted) {
        setState(() {
        });
      }
      Future.delayed(const Duration(milliseconds: 100)).then((_) async {
        if(mounted) {
          setState(() {
            this._query = q;
          });
        }
      });
    }
  }

  Widget _buildDefaultEmpty() {
    return Container(
      child: Center(
        child: IconButton(icon: const Icon(Icons.search), onPressed: () {
          _showSearchView();
        }),
      ),
    );
  }

  Widget _buildRepoTab() {
    if(this._query != null && this._query.isNotEmpty) {
      return SearchRepoTab(_query);
    } else {
      return _buildDefaultEmpty();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxScrolled) => [
            SliverAppBar(
              title: Text(S.current.search,),
              actions: <Widget>[
                IconButton(icon: const Icon(Icons.search), onPressed: () {
                  _showSearchView();
                }),
              ],
              floating: true, //是否随着滑动隐藏标题，为true时，当有下滑手势的时候就会显示SliverAppBar
              snap:true,   //与floating结合使用
              pinned: true, //为true时，SliverAppBar折叠后不消失
            ),
            SliverPersistentHeader(
              pinned: false,
              delegate: _SliverAppBarDelegate(
                Container(
                  color: Theme.of(context).primaryColor,
                  child: TabBar(
                    indicatorColor: Theme.of(context).primaryColorLight,
                    controller: _tabController,
                    tabs: CommonSearchPage.tabTitles.map((title) => Tab(child: Text(title),)).toList(growable: false),
                  ),
                ),
              ),
            ),
          ],
          body: TabBarView(
            controller: _tabController,
            children: <Widget>[
              _buildRepoTab(),
              Text(S.current.users),
            ],
          ),
        ),
      ),
    );
  }
}

/// 定义tab栏高度
class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final Container _tabBar;
  _SliverAppBarDelegate(this._tabBar);
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(child: _tabBar,);
  }
  @override
  double get maxExtent => 48;
  @override
  double get minExtent => 48;
  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}