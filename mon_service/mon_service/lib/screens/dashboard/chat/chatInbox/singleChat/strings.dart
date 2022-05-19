class strings {
  List<messageModel> listOfMessages = [
    messageModel(
      date: '12:06',
      description: 'hey,how are you.',
      isMe: true,
    ),
    messageModel(
      date: '12:06',
      description: 'I am good. And you?',
      isMe: false,
    ),
    messageModel(
      date: '12:06',
      description: 'Same. So what you doing tonight?',
      isMe: true,
    ),
    messageModel(
      date: '12:06',
      description: 'Let\'s catch up.I want to introduce you to someone.',
      isMe: true,
    ),
    messageModel(
      date: '12:06',
      description:
          'Sure thing!By the way do I know that special person already.',
      isMe: false,
    ),
    messageModel(
      date: '12:06',
      description:
          'You will know when you meet him.Cool,then be ready at 10 sharp.',
      isMe: true,
    ),
    messageModel(
      date: '12:06',
      description: 'Got it.',
      isMe: false,
    ),
    messageModel(
      date: '12:06',
      description: 'Bye',
      isMe: true,
    ),
    messageModel(
      date: '12:06',
      description: 'Ok bye',
      isMe: false,
    ),
  ];
}

class messageModel {
  final String date;
  final String description;
  bool isMe;
  messageModel(
      {required this.date, required this.description, required this.isMe});
}
