import 'package:flutter/material.dart';

class ChatDetailScreen extends StatelessWidget {
  final int chatId;
  const ChatDetailScreen({super.key, required this.chatId});
  Widget buildChatBubble({required String text, required bool isMe}) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isMe ? Colors.blue[100] : Colors.grey[300],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(text),
      ),
    );
  }

  List<Widget> getChatContent(int id) {
    if (id == 0) {
      return [
        buildChatBubble(
          text: 'Halo, desain ordernya udah aku lihat.',
          isMe: true,
        ),
        buildChatBubble(
          text: 'Baik, apakah sudah cukup puas kak?',
          isMe: false,
        ),
        buildChatBubble(text: 'Sudah okee sih, otw pembayaran', isMe: true),
        buildChatBubble(text: 'mantap, makasih bos', isMe: false),
      ];
    } else if (id == 1) {
      return [
        buildChatBubble(
          text: 'Haloo bagaimana desain yang saya order?',
          isMe: true,
        ),
        buildChatBubble(
          text: 'Sedang dalam pengerjaan kak, mohon ditunggu selama 1 tahun',
          isMe: false,
        ),
        buildChatBubble(
          text: 'RAAAAAAHHHHH SELENAA PEAKKK FR FR FR',
          isMe: true,
        ),
        buildChatBubble(text: 'ga ngerti bahasa webs', isMe: false),
        buildChatBubble(
          text:
              'Desain ini terlalu ramai menurutku. Mungkin bisa dikurangi beberapa elemen yang kurang penting',
          isMe: true,
        ),
        buildChatBubble(text: 'Noted, utiwi revisi', isMe: false),
      ];
    } else {
      return [
        buildChatBubble(
          text: 'Halo, desain ordernya udah aku lihat.',
          isMe: true,
        ),
        buildChatBubble(text: 'Oke, apakah ada revisi?', isMe: false),
        buildChatBubble(
          text:
              'hmmm, sepertinya lebih baik kamu berhenti jadi desainer saja. Bahkan gambar anakku yang belum lahir lebih bagus',
          isMe: true,
        ),
        buildChatBubble(text: ' 😭 😭', isMe: false),
        buildChatBubble(text: 'Cancel, aku gamau bayar', isMe: true),
        buildChatBubble(text: 'Gini amat nyari duit :(', isMe: false),
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    final chatContent = getChatContent(chatId);
    var title;
    if (chatId == 0) {
      title = 'Dzaky';
    } else if (chatId == 1) {
      title = 'Najma';
    } else {
      title = 'Xeyla';
    }
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: chatContent,
              ),
            ),
          ),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Ketik pesan...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(icon: const Icon(Icons.send), onPressed: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
