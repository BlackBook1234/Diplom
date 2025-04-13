import 'dart:io';

import 'package:chat_system/constants.dart';
import 'package:chat_system/test/common/enums/message_enum.dart';
import 'package:chat_system/test/common/providers/message_reply_provider.dart';
import 'package:chat_system/test/common/utils/utils.dart';
import 'package:chat_system/test/features/chat/controller/chat_controller.dart';
import 'package:chat_system/test/features/chat/widgets/message_reply_preview.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_sound/public/flutter_sound_recorder.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class BottomChatField extends ConsumerStatefulWidget {
  final String recieverUserId;
  final bool isGroupChat;
  const BottomChatField({
    super.key,
    required this.recieverUserId,
    required this.isGroupChat,
  });

  @override
  ConsumerState<BottomChatField> createState() => _BottomChatFieldState();
}

class _BottomChatFieldState extends ConsumerState<BottomChatField> {
  bool isShowSendButton = false;
  final TextEditingController _messageController = TextEditingController();
  FlutterSoundRecorder? _soundRecorder;
  bool isRecorderInit = false;
  bool isShowEmojiContainer = false;
  bool isRecording = false;
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    // _soundRecorder = FlutterSoundRecorder();
    _initRecorder();
  }

  Future<void> _initRecorder() async {
    final status = await Permission.microphone.request();

    print("Microphone permission status: $status");

    if (!status.isGranted) {
      //  await openAppSettings();
      print('Microphone permission not granted');
      if (await Permission.microphone.isPermanentlyDenied) {
        print("Permission permanently denied. Redirecting to settings...");
        await openAppSettings();
      }
      return;
    }

    _soundRecorder = FlutterSoundRecorder();
    await _soundRecorder!.openRecorder();

    isRecorderInit = true;
    setState(() {});
  }

  @override
  void dispose() {
    _soundRecorder?.closeRecorder();
    _soundRecorder = null;
    _messageController.dispose();
    isRecorderInit = false;
    super.dispose();
  }

  void sendTextMessage() async {
    if (isShowSendButton) {
      if (_messageController.text.trim() != "") {
        ref.read(chatControllerProvider).sendTextMessage(
              context,
              _messageController.text.trim(),
              widget.recieverUserId,
              widget.isGroupChat,
            );
      }
      setState(() {
        _messageController.text = '';
      });
    } else {
      print("opne mic;");
      var tempDir = await getTemporaryDirectory();
      var path = '${tempDir.path}/flutter_sound.aac';
      if (!isRecorderInit) {
        return;
      }
      if (isRecording) {
        await _soundRecorder!.stopRecorder();
        sendFileMessage(File(path), MessageEnum.audio);
      } else {
        await _soundRecorder!.startRecorder(
          toFile: path,
        );
      }

      setState(() {
        isRecording = !isRecording;
      });
    }
  }

  void sendFileMessage(
    File file,
    MessageEnum messageEnum,
  ) {
    ref.read(chatControllerProvider).sendFileMessage(
          context,
          file,
          widget.recieverUserId,
          messageEnum,
          widget.isGroupChat,
        );
  }

  void selectImage() async {
    File? image = await pickImageFromGallery(context);
    if (image != null) {
      sendFileMessage(image, MessageEnum.image);
    }
  }

  // void selectVideo() async {
  //   File? video = await pickVideoFromGallery(context);
  //   if (video != null) {
  //     sendFileMessage(video, MessageEnum.video);
  //   }
  // }

  // void selectGIF() async {
  //   final gif = await pickGIF(context);
  //   if (gif != null) {
  //     if (!context.mounted) return;
  //     ref.read(chatControllerProvider).sendGIFMessage(
  //           context,
  //           gif.url,
  //           widget.recieverUserId,
  //           widget.isGroupChat,
  //         );
  //   }
  // }

  void hideEmojiContainer() {
    setState(() {
      isShowEmojiContainer = false;
    });
  }

  void showEmojiContainer() {
    setState(() {
      isShowEmojiContainer = true;
    });
  }

  void showKeyboard() => focusNode.requestFocus();
  void hideKeyboard() => focusNode.unfocus();

  void toggleEmojiKeyboardContainer() {
    if (isShowEmojiContainer) {
      showKeyboard();
      hideEmojiContainer();
    } else {
      hideKeyboard();
      showEmojiContainer();
    }
  }

  @override
  Widget build(BuildContext context) {
    final messageReply = ref.watch(messageReplyProvider);
    final isShowMessageReply = messageReply != null;
    return Column(
      children: [
        isShowMessageReply
            ? const MessageReplyPreview()
            : const SizedBox.shrink(),
        SizedBox(height: 4),
        Row(
          children: [
            SizedBox(
              width: 50,
              child: Row(
                children: [
                  IconButton(
                    onPressed: toggleEmojiKeyboardContainer,
                    icon: Icon(
                      size: 30,
                      Icons.emoji_emotions,
                      color: primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TextFormField(
                focusNode: focusNode,
                controller: _messageController,
                onChanged: (val) {
                  if (val.isNotEmpty) {
                    setState(() {
                      isShowSendButton = true;
                    });
                  } else {
                    setState(() {
                      isShowSendButton = false;
                    });
                  }
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.transparent,
                  suffixIcon: SizedBox(
                    width: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: selectImage,
                          icon: Icon(
                            Icons.camera_alt,
                            color: shadowColorLight,
                          ),
                        ),
                        // IconButton(
                        //   onPressed: selectVideo,
                        //   icon: Icon(
                        //     Icons.attach_file,
                        //     color: Theme.of(context)
                        //         .colorScheme
                        //         .onPrimaryContainer,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  hintText: 'Type a message',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide(
                      width: 0.4,
                      color: shadowColorLight.withOpacity(0.8),
                    ),
                  ),
                  contentPadding: const EdgeInsets.all(10),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 10,
                left: 10,
              ),
              child: GestureDetector(
                onTap: sendTextMessage,
                child: Icon(
                  size: 24,
                  isShowSendButton
                      ? Icons.send
                      : isRecording
                          ? Icons.close
                          : Icons.mic_sharp,
                  color: shadowColorLight,
                ),
              ),
            ),
          ],
        ),
        isShowEmojiContainer
            ? SizedBox(
                height: 310,
                child: EmojiPicker(
                  onEmojiSelected: ((category, emoji) {
                    setState(() {
                      _messageController.text =
                          _messageController.text + emoji.emoji;
                    });

                    if (!isShowSendButton) {
                      setState(() {
                        isShowSendButton = true;
                      });
                    }
                  }),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
