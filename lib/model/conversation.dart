class Conversation {
  final String question;
  final String answers;

  Conversation(this.question, this.answers);

  factory Conversation.fromJson(Map json) => Conversation(
    json['question'],
    json['answer']
  );

}