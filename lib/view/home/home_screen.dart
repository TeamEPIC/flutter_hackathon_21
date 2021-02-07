import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hackathon_21/core/constants/app/app_constants.dart';
import 'package:flutter_hackathon_21/core/providers/boxs_api_providers.dart';
import 'package:flutter_hackathon_21/view/home/bulletin/bulletin_edit_page.dart';
import 'package:flutter_hackathon_21/view/home/bulletin/bulletin_listview_widget.dart';
import 'package:flutter_hackathon_21/view/home/profile/profile_dialog.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        heroTag: 'bulletin',
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BulletinCreatePage(
                      user: context.read(UserBoxApiProvider.provider).user)));
        },
        child: Icon(Icons.add),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, _) {
          return [
            SliverAppBar(
              // collapsedHeight: 200,
              // flexibleSpace: FlexibleSpaceBar(),
              leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              floating: true,
              actions: [
                IconButton(icon: Icon(Icons.search), onPressed: () {}),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: IconButton(
                      icon: Icon(Icons.person),
                      onPressed: () {
                        showDialog(
                            context: context,
                            child: ProfileDialog(context
                                .read(UserBoxApiProvider.provider)
                                .user));
                      }),
                )
              ],
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 4),
                  const Text(AppConstants.APP_NAME),
                  const SizedBox(height: 4),
                  const Opacity(
                    opacity: 0.6,
                    child: Text('Yardimlasma Platformu',
                        style: TextStyle(fontSize: 9)),
                  ),
                ],
              ),
              shadowColor: Colors.red.withOpacity(0.5),
              elevation: 50,
              centerTitle: true,
              automaticallyImplyLeading: false,
            )
          ];
        },
        body: BulletinListViewWidget(),

        //  SliverFillRemaining(child: BulletinListViewWidget())
      ),
    );

    return FadeIn(
      child: Scaffold(
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              const Text(AppConstants.APP_NAME),
              const SizedBox(height: 4),
              const Opacity(
                opacity: 0.6,
                child:
                    Text('slogan slogan slogan', style: TextStyle(fontSize: 9)),
              ),
            ],
          ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
          actions: [
            IconButton(icon: Icon(Icons.search), onPressed: () {}),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                  icon: Icon(Icons.person),
                  onPressed: () {
                    showDialog(
                        context: context,
                        child: ProfileDialog(
                            context.read(UserBoxApiProvider.provider).user));
                  }),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          heroTag: 'bulletin',
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BulletinCreatePage(
                        user: context.read(UserBoxApiProvider.provider).user)));
          },
          child: Icon(Icons.add),
        ),
        body: BulletinListViewWidget(),
      ),
    );
  }
}
