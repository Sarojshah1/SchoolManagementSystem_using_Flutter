import 'package:web_socket_channel/web_socket_channel.dart';

final channel = WebSocketChannel.connect(
  Uri.parse('ws://192.168.56.1:7000/send-notification'),
);

void sendNotification(String message) {
  channel.sink.add(message);
}
