

import '../models/questions_model.dart';

List<QuestionModel> healthQuestions = [
  QuestionModel(
    'Do you exercise regularly?',
    {
      'Yes': true,
      'No': false,
      'Sometimes': false,
    },
  ),
  QuestionModel(
    'Do you eat a balanced diet?',
    {
      'Always': true,
      'Sometimes': false,
      'Rarely': false,
      'Never': false,
    },
  ),
  QuestionModel(
    'Do you get enough sleep?',
    {
      'Yes': true,
      'No': false,
      'Not sure': false,
    },
  ),
  QuestionModel(
    'Do you drink enough water?',
    {
      'Yes': true,
      'No': false,
      'I don\'t know': false,
    },
  ),
  QuestionModel(
    'Do you avoid excessive stress?',
    {
      'Yes': true,
      'No': false,
      'Sometimes': false,
      'Not applicable': false,
    },
  ),
  QuestionModel(
    'Do you take regular breaks during work?',
    {
      'Yes': true,
      'No': false,
      'Sometimes': false,
      'I don\'t work': false,
    },
  ),
  QuestionModel(
    'Do you practice good hygiene?',
    {
      'Yes': true,
      'No': false,
      'Sometimes': false,
      'What is hygiene?': false,
    },
  ),
];
