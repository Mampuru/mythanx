import 'package:flutter/material.dart';
import 'package:mythanx/views/bottom_nav_views/follow_view.dart';
import 'package:mythanx/views/widgets/primary_textfield.dart';

import '../../constants.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key key}) : super(key: key);

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context){
    double _height =  MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: PrimaryTextfield(label: "Search",controller:searchController,),
          ),
          SizedBox(
            height: _height,
              child: const FollowView())
        ],
      ),
    );
  }
}
