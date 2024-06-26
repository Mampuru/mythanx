import 'package:flutter/material.dart';
import 'package:mythanx/data/dto/follow_dto.dart';
import 'package:mythanx/views/widgets/primary_button_outlined.dart';

import '../../constants.dart';

class FollowView extends StatefulWidget {
  const FollowView({Key? key}) : super(key: key);

  @override
  _FollowViewState createState() => _FollowViewState();
}

class _FollowViewState extends State<FollowView> {
  List<FollowDto> followDtoItems = [];
  late Future _getFollowDto;

  @override
  void initState() {
    super.initState();
    _getFollowDto = getFollowDto();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _getFollowDto,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                'ERROR: ${snapshot.error}',
                style: const TextStyle(fontSize: 18),
              ),
            );
          } else if (snapshot.hasData) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: followDtoItems.length,
                    itemBuilder: (BuildContext context, int index) {
                      final followItem = followDtoItems[index];
                      return Card(
                        elevation: 1,
                        child: ListTile(
                          onTap: () {
                          },
                          title: Text(
                            followItem.username.toString(),
                            style: const TextStyle(
                                color: kCharcoal,
                                fontFamily: 'Sora',
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(followItem.name.toString(),
                              style: const TextStyle(
                                  fontFamily: 'Sora', color: kPrimaryColor)),
                          leading: Image.asset(userIconPath),
                          trailing: PrimaryButtonOutlined(textColor: kCharcoal,width: 110,height: 28, onTap: () {  }, buttonName: 'Remove',),
                        ),
                      );
                    },
                  ),
                ),

              ],
            );
          }else{
            return Column(children: const [
              SizedBox(height: 200,),
              Center(
                child: Text(
                  'No Followers yet!',
                  style: TextStyle(fontSize: 24),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 100),
                child: CircularProgressIndicator(color: kCharcoal,),
              )
            ]);
          }

        });
  }

  Future<List<dynamic>> getFollowDto() async {
    followDtoItems = [];
    for (int i = 0; i < 10; i++) {
      followDtoItems.add(FollowDto(id: "Id $i", name: "Name $i", username: "Username $i", image: "Image $i",));
    }
    return followDtoItems;
  }
}