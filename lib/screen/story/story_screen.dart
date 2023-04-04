import 'package:enitproject/screen/story/story_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../../const/color.dart';

class StoryScreen extends GetView<StoryController> {
  final int storyIndex;
  const StoryScreen({
    required this.storyIndex,
    Key? key
  }) : super(key: key);

  @override

  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        backgroundColor: Colors.white,


        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: Padding(
            padding: const EdgeInsets.all(10.0),
            child: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                color: Colors.black,
                iconSize: 35.0,
                onPressed: (){
                
                  Navigator.maybePop(context);
                },
                ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              
              child: Obx(() => controller.storyList[storyIndex].isLike?
              IconButton(
                  onPressed: () => {
                    controller.updateUnLike('${controller.storyList[storyIndex].storyPlayListKey}', storyIndex)
                  },
                  icon: const Icon(
                    Icons.favorite,
                    color: GREEN_DARK_COLOR,
                    size: 35.0,
                  )
              )
                  :
              IconButton(
                  onPressed: ()=>{
                    controller.updateLike('${controller.storyList[storyIndex].storyPlayListKey}',storyIndex)
                  },
                  icon: const Icon(
                    Icons.favorite_border,
                    color: Colors.grey,
                    size: 35.0,
                  )
              )
              ),
            )
          ],
        ),


        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20.0,),
                Container(
                  child: Column(
                    children: [
                      Text(
                      
                        '${controller.storyList[storyIndex].title}',
                        style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${controller.storyList[storyIndex].addressDetail}',
                            style: TextStyle(
                                fontSize: 16.0,

                                fontWeight: FontWeight.w500
                            ),
                          ),
                          TextButton(
                              child: Text(
                                  '지도보기',
                                style: TextStyle(
                                    fontSize: 15.0,
                                    color: GREEN_BRIGHT_COLOR,
                                ),
                              ),
                              onPressed: (){},
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 15.0,),
                Image.network(
                  '${controller.storyList[storyIndex].image}',
                  width: double.infinity,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 15.0,),
                Slider(
                    min: 0,
                      max: controller.duration.inSeconds.toDouble(),
                      value: controller.position.inSeconds.toDouble(),
                      onChanged: (value) async{
                      final position = Duration(seconds: value.toInt());
                      await controller.audioPlayer.seek(position);

                      await controller.audioPlayer.resume();
                      },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${controller.position}'),
                      Text('${controller.duration - controller.position}'),
                    ],
                  ),
                CircleAvatar(
                  backgroundColor: GREEN_DARK_COLOR,
                  radius: 40,
                  child: Obx(() => controller.isPlaying.value?
                    IconButton(
                      icon: Icon(
                        Icons.pause,
                        color: Colors.white,
                        size: 35.0,
                      ),
                      onPressed: () async{
                        controller.updatePause();
                      },
                    )
                    :
                    IconButton(
                        onPressed: () async{
                          controller.updatePlay(storyIndex);
                        },
                        icon: Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                          size: 30.0,
                        ),
                    )
                  ),
                ),
                SizedBox(height: 20.0,),
                Container(
                  child: Text(
                    '${controller.storyList[storyIndex].script}',
                    style: TextStyle(
                      fontSize: 15.0
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
