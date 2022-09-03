import 'package:flutter/material.dart';
import 'package:agora_uikit/agora_uikit.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({super.key});

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  final AgoraClient _client = AgoraClient(
    //this create agora client
    agoraConnectionData: AgoraConnectionData(
        appId: '1bb2ca2f1106426b8eadabc0728f96b1',
        channelName: 'fluttercall',
        tempToken:
            '007eJxTYEh3NWYrK3m8s1E7WP381u0CRxr/vGm8vEunsJbzsXqx0lUFBsOkJKPkRKM0Q0MDMxMjsySL1MSUxKRkA3MjizRLsyTDwtnCye/fiCQ/XKrOysgAgSA+N0NaTmlJSWpRcmJODgMDAIoZJYI='),
  );
  @override
  void initState() {
    super.initState();
    _initAgora();
  }

  Future<void> _initAgora() async {
    await _client.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Video call'),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: SafeArea(
            child: Stack(
          children: [
            AgoraVideoViewer(
              client: _client,
              layoutType: Layout.floating,
              showNumberOfUsers: true,
            ),
            AgoraVideoButtons(
              client: _client,
              enabledButtons: const [
                BuiltInButtons.toggleCamera,
                BuiltInButtons.callEnd,
                BuiltInButtons.toggleMic,
              ],
            )
          ],
        )),
      ),
    );
  }
}
