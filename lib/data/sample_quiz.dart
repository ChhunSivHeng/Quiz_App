import '../model/question.dart';

final List<Question> mockQuestions = [
  Question(
    title: 'What is the capital of France?',
    choices: ['Paris', 'London', 'Berlin'],
    goodChoice: 'Paris',
  ),
  Question(
    title: 'What is 2 + 2?',
    choices: ['3', '4', '5'],
    goodChoice: '4',
  ),
  Question(
    title: 'Which programming language is used for Flutter?',
    choices: ['Java', 'Dart', 'Python'],
    goodChoice: 'Dart',
  ),
    Question(
    title: 'Does G3 is the best',
    choices: ['No', 'Yes', 'Yes, but Teacher Ronan is more the best'],
    goodChoice: 'Yes, but Teacher Ronan is more the best',
  ),
];