import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:file_picker_web/file_picker_web.dart';
import 'package:flutter/material.dart';
import 'package:rich_edit/rich_edit.dart';
import 'package:video_player/video_player.dart';

class SimpleRichEditController extends RichEditController {

  Map<String, ChewieController> controllers = Map();


  //添加视频方法
  @override
  Future<String> addVideo() async {


    var file = await FilePicker.getFile(
        allowedExtensions: ['mp4', 'png']);

//    var pickedFile = await ImagePicker().getVideo(source: ImageSource.gallery);
//    if (pickedFile != null) {
//      //模拟上传后返回的路径
//      return "http://static.fanghnet.com/uploads/szx/uploads/2020/06/353f2c48ce164e368cc040c4fb425331.mp4";
//    }
      return "http://static.fanghnet.com/uploads/szx/uploads/2020/06/353f2c48ce164e368cc040c4fb425331.mp4";
  }

  //添加图片方法
  @override
  Future<String> addImage() async {
    var file = await FilePicker.getFile(
        allowedExtensions: ['jpg', 'png']);
    return "https://img.iplaysoft.com/wp-content/uploads/2019/free-images/free_stock_photo.jpg";
  }

  //生成视频view方法
  @override
  Widget generateVideoView(RichEditData data) {
    if (!controllers.containsKey(data.data)) {
      var controller = ChewieController(
        videoPlayerController: VideoPlayerController.network(data.data),
        autoPlay: false,
        autoInitialize: true,
        aspectRatio: 16 / 9,
        looping: false,
        showControls: true,
        // 占位图
        placeholder: new Container(
          color: Colors.grey,
        ),
      );
      controllers[data.data] = controller;
    }
    var video = Chewie(
      controller: controllers[data.data],
    );
    return video;
  }

  //生成图片view方法
  @override
  Widget generateImageView(RichEditData data) =>
      Image.network(data.data, height: 200, width: double.infinity);
}