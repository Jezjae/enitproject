import 'package:enitproject/app/screen/bottom_popup_player/controller/bottom_popup_player_controller.dart';
import 'package:enitproject/app/screen/favorite_list/controller/favorite_list_controller.dart';
import 'package:enitproject/app/screen/story/controller/story_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class FavoriteListScreen extends GetView<FavoriteListController> {
  const FavoriteListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double a = 10;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: Padding(
          padding:  const EdgeInsets.all(10),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: const Text(
          '좋아요',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              '전체 ${StoryController.to.storyList.length}건',
              style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 20,
            ),
            /// 여기서부터 고치기!!!! 고치기
            // Expanded(
            //   child: ListView.builder(
            //       itemCount:UserController.to.userList.length,
            //       itemBuilder: (BuildContext context, int index2) {
            //         return ListView.builder(   /// 여기서부터 고치기!!!!
            //               itemCount: StoryController.to.storyList.length,
            //               itemBuilder: (BuildContext context, int index) {
            //                 return InkWell(
            //                   child: Container(
            //                     height: 100,
            //                     child: Padding(
            //                       padding:
            //                           const EdgeInsets.fromLTRB(0, 0, 0, 8.0),
            //                       child: Row(
            //                         mainAxisAlignment:
            //                             MainAxisAlignment.spaceBetween,
            //                         crossAxisAlignment:
            //                             CrossAxisAlignment.center,
            //                         children: [
            //                           ClipRRect(
            //                             borderRadius:
            //                                 BorderRadius.circular(10.0),
            //                             child: Image.network(
            //                               '${StoryController.to.storyList[index].image}',
            //                               width: 100,
            //                               height: 100,
            //                               fit: BoxFit.cover,
            //                             ),
            //                           ),
            //                           SizedBox(
            //                             width: 10,
            //                           ),
            //                           Expanded(
            //                             child: Column(
            //                               mainAxisAlignment:
            //                                   MainAxisAlignment.center,
            //                               crossAxisAlignment:
            //                                   CrossAxisAlignment.start,
            //                               children: [
            //                                 Padding(
            //                                   padding:
            //                                       const EdgeInsets.symmetric(
            //                                           horizontal: 2.0),
            //                                   child: Text(
            //                                     '${StoryController.to.storyList[index].addressSearch}',
            //                                     style: TextStyle(
            //                                       fontSize: 13.0,
            //                                       fontWeight: FontWeight.w500,
            //                                       color: GREEN_DARK_COLOR,
            //                                     ),
            //                                   ),
            //                                 ),
            //                                 SizedBox(
            //                                   height: 5.0,
            //                                 ),
            //                                 Row(
            //                                   children: [
            //                                     Text(
            //                                       '${StoryController.to.storyList[index].title}',
            //                                       style: TextStyle(
            //                                           fontSize: 20.0,
            //                                           fontWeight:
            //                                               FontWeight.w500),
            //                                     ),
            //                                     SizedBox(
            //                                       width: 5.0,
            //                                     ),
            //                                     // Obx(() => controller.storyList[index].changeStoryColor == GREEN_BRIGHT_COLOR?
            //                                     //   Badge(
            //                                     //     badgeStyle: BadgeStyle(
            //                                     //       badgeColor: GREEN_BRIGHT_COLOR,
            //                                     //     ),
            //                                     //     showBadge: true,
            //                                     //   )
            //                                     //     :
            //                                     // Badge(
            //                                     //   badgeStyle: BadgeStyle(
            //                                     //     badgeColor: LIGHT_YELLOW_COLOR,
            //                                     //   ),
            //                                     //   showBadge: true,
            //                                     // ),
            //                                     // ),
            //                                   ],
            //                                 ),
            //                                 SizedBox(
            //                                   height: 10.0,
            //                                 ),
            //                                 Text(
            //                                   '${StoryController.to.storyList[index].addressDetail}',
            //                                   style: TextStyle(
            //                                     fontSize: 15.0,
            //                                   ),
            //                                 )
            //                               ],
            //                             ),
            //                           ),
            //                           SizedBox(
            //                             width: 5,
            //                           ),
            //                           Obx(
            //                             () => StoryController
            //                                         .to
            //                                         .storyList[index]
            //                                         .changeStoryColor ==
            //                                     GREEN_BRIGHT_COLOR
            //                                 ? IconButton(
            //                                     onPressed: () async {
            //                                       StoryController.to
            //                                           .updatePlay(index);
            //                                     },
            //                                     icon: Obx(() => StoryController
            //                                             .to.isPlaying.value
            //                                         ? Icon(
            //                                             Icons.headphones,
            //                                             color: GREEN_MID_COLOR,
            //                                           )
            //                                         : Icon(
            //                                             Icons.headphones,
            //                                             color: GREEN_MID_COLOR,
            //                                           )),
            //                                   )
            //                                 : SizedBox.shrink(),
            //                           ),
            //                           Obx(() => StoryController
            //                                   .to.storyList[index].isLike
            //                               ? IconButton(
            //                                   onPressed: () => {
            //                                     StoryController.to.updateUnLike('${StoryController.to.storyList[index].storyPlayListKey}', index)
            //                                     // 여기서 유저 키랑 해당 story key 받아야 한다.
            //                                   },
            //                                   icon: const Icon(
            //                                     Icons.favorite,
            //                                     color: GREEN_DARK_COLOR,
            //                                   ),
            //                                 )
            //                               : IconButton(
            //                                   onPressed: () => {
            //                                         StoryController.to.updateLike(
            //                                             '${StoryController.to.storyList[index].storyPlayListKey}',
            //                                             index)
            //                                       },
            //                                   icon: const Icon(
            //                                     Icons.favorite_border,
            //                                     color: Colors.grey,
            //                                   ),
            //                                   padding: EdgeInsets.zero)),
            //                         ],
            //                       ),
            //                     ),
            //                   ),
            //                   onTap: () {
            //                     if (StoryController
            //                             .to.storyList[index].changeStoryColor ==
            //                         GREEN_BRIGHT_COLOR) {
            //
            //                       Get.to(() => const StoryScreen(), binding: StoryBinding(storyIndex: index,));
            //                     }
            //                   },
            //                 );
            //               }
            //         );
            //       }),
            // ),
            Obx(() => BottomPopupPlayerController.to.isPopup.value
                ? const SizedBox(
                    height: 90,
                  )
                : SizedBox.shrink())
          ],
        ),
      ),
    );
  }
}
