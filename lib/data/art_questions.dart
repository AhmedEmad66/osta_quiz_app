

import '../models/questions_model.dart';

List<QuestionModel> artQuestions = [
  QuestionModel(
    'Who painted the Mona Lisa?',
    {
      'Vincent van Gogh': false,
      'Pablo Picasso': false,
      'Michelangelo': false,
      'Leonardo da Vinci': true,
    },
  ),
  QuestionModel(
    'Which artist is known for his "Campbell\'s Soup Cans" artwork?',
    {
      'Salvador Dali': false,
      'Jackson Pollock': false,
      'Andy Warhol': true,
      'Claude Monet': false,
    },
  ),
  QuestionModel(
    'Who sculpted the statue of David?',
    {
      'Gustav Klimt': false,
      'Michelangelo': true,
      'Auguste Rodin': false,
      'Pablo Picasso': false,
    },
  ),
  QuestionModel(
    'Which artist is famous for his "Starry Night" painting?',
    {
      'Piet Mondrian': false,
      'Edvard Munch': false,
      'Leonardo da Vinci': false,
      'Vincent van Gogh': true,
    },
  ),
  QuestionModel(
    'Who painted the ceiling of the Sistine Chapel?',
    {
      'Claude Monet': false,
      'Henri Matisse': false,
      'Georgia O\'Keeffe': false,
      'Michelangelo': true,
    },
  ),
];
