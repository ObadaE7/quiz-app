import 'package:quiz/models/question.dart';

class Quiz {
  int _questionNumber = 0;

  List<Question> questions = [
    Question(
      text: 'ما هي عاصمة فلسطين؟',
      options: [
        'بيروت',
        'عمان',
        'القدس',
        'الرياض',
      ],
      answer: 2,
    ),
    Question(
      text: 'ما هو أكبر كوكب في نظامنا الشمسي؟',
      options: [
        'زحل',
        'المريخ',
        'الأرض',
        'المشتري',
      ],
      answer: 3,
    ),
    Question(
      text: 'من هو النبي الذي ابتلعه الحوت؟',
      options: [
        'محمد',
        'يونس',
        'موسى',
        'عيسى',
      ],
      answer: 1,
    ),
    Question(
      text: 'ما هو أصغر كوكب في نظامنا الشمسي؟',
      options: [
        'عطارد',
        'المريخ',
        'الزهرة',
        'الأرض',
      ],
      answer: 0,
    ),
    Question(
      text: 'ما هي اللغة الرسمية في اليابان؟',
      options: [
        'الصينية',
        'الفرنسية',
        'الإنجليزية',
        'اليابانية',
      ],
      answer: 3,
    ),
    Question(
      text: 'ما هو أكبر محيط في العالم؟',
      options: [
        'المحيط الأطلسي',
        'المحيط الهادئ',
        'المحيط الهندي',
        'المحيط المتجمد الشمالي',
      ],
      answer: 1,
    ),
    Question(
      text: 'ما هو لون الحبر المستخدم في كتابة القرآن؟',
      options: [
        'أسود',
        'أخضر',
        'أزرق',
        'أحمر',
      ],
      answer: 0,
    ),
    Question(
      text: 'من هو مؤسس شركة مايكروسوفت؟',
      options: [
        'مارك زوكربيرغ',
        'لاري بيج',
        'بيل غيتس',
        'ستيف جوبز',
      ],
      answer: 2,
    ),
    Question(
      text: 'ما هي أكبر قارة في العالم؟',
      options: [
        'أفريقيا',
        'آسيا',
        'أوروبا',
        'أمريكا الشمالية',
      ],
      answer: 1,
    ),
    Question(
      text: 'ما هو الحيوان الذي يعتبر ملك الغابة؟',
      options: [
        'الفيل',
        'النمر',
        'الأسد',
        'الدب',
      ],
      answer: 2,
    ),
    Question(
      text: 'ما هو العنصر الكيميائي الذي يحمل الرمز O؟',
      options: [
        'الكربون',
        'النيتروجين',
        'الهيدروجين',
        'الأكسجين',
      ],
      answer: 3,
    ),
    Question(
      text: 'ما هي أطول نهر في العالم؟',
      options: [
        'الأمازون',
        'الميسيسيبي',
        'النيل',
        'اليانغستي',
      ],
      answer: 2,
    ),
    Question(
      text: 'ما هي العملة المستخدمة في اليابان؟',
      options: [
        'الجنيه',
        'الدولار',
        'الين',
        'اليورو',
      ],
      answer: 2,
    ),
    Question(
      text: 'من هو أول رائد فضاء عربي؟',
      options: [
        'عبدالله بن غازي',
        'محمود خليل',
        'سلطان النيادي',
        'أحمد المسعودي',
      ],
      answer: 2,
    ),
    Question(
      text: 'ما هو الكوكب المعروف بالكوكب الأحمر؟',
      options: [
        'الأرض',
        'عطارد',
        'المريخ',
        'زحل',
      ],
      answer: 2,
    ),
    Question(
      text: 'ما هي اللغة الرسمية في مصر؟',
      options: [
        'الفرنسية',
        'العربية',
        'الإسبانية',
        'الإنجليزية',
      ],
      answer: 1,
    ),
    Question(
      text: 'ما هو اسم أكبر صحراء في العالم؟',
      options: [
        'صحراء أريزونا',
        'صحراء الكبرى',
        'صحراء ساهارا',
        'صحراء كولورادو',
      ],
      answer: 2,
    ),
    Question(
      text: 'ما هي أول جامعة في العالم؟',
      options: [
        'جامعة الأزهر',
        'جامعة هارفارد',
        'جامعة أكسفورد',
        'جامعة القرويين',
      ],
      answer: 3,
    ),
    Question(
      text: 'ما هي أكبر دولة في العالم من حيث المساحة؟',
      options: [
        'كندا',
        'الولايات المتحدة',
        'الصين',
        'روسيا',
      ],
      answer: 3,
    ),
    Question(
      text: 'ما هو العنصر الكيميائي الذي يحمل الرمز Na؟',
      options: [
        'البوتاسيوم',
        'المغنيسيوم',
        'النيكل',
        'الصوديوم',
      ],
      answer: 3,
    ),
    Question(
      text: 'ما هو اسم الجهاز الذي يستخدم لقياس الزلازل؟',
      options: [
        'السيسموغراف',
        'البارومتر',
        'المنظار',
        'الثيرمومتر',
      ],
      answer: 0,
    ),
    Question(
      text: 'ما هي أول لغة مكتوبة في التاريخ؟',
      options: [
        'العربية',
        'الهيروغليفية',
        'اللاتينية',
        'السومرية',
      ],
      answer: 3,
    ),
    Question(
      text: 'ما هو اسم أطول نهر في أفريقيا؟',
      options: [
        'النيجر',
        'زامبيزي',
        'الكونغو',
        'النيل',
      ],
      answer: 3,
    ),
    Question(
      text: 'ما هي العاصمة الثقافية للعالم العربي؟',
      options: [
        'تونس',
        'بيروت',
        'دمشق',
        'القاهرة',
      ],
      answer: 3,
    ),
    Question(
      text: 'ما هي المادة التي تتكون منها الزهور؟',
      options: [
        'السليلوز',
        'الهيموجلوبين',
        'الكلوروفيل',
        'البروتين',
      ],
      answer: 2,
    ),
    Question(
      text: 'من هو مؤلف رواية 1984؟',
      options: [
        'دوستويفسكي',
        'أجاثا كريستي',
        'مارك توين',
        'جورج أورويل',
      ],
      answer: 3,
    ),
    Question(
      text: 'ما هو الاسم العلمي للأرض؟',
      options: [
        'مارس',
        'كوكب الأرض',
        'تيررا',
        'أرض',
      ],
      answer: 2,
    ),
    Question(
      text: 'ما هو اسم أكبر غابة في العالم؟',
      options: [
        'غابة سيبيريا',
        'غابة الأوكالبتوس',
        'غابة الصنوبر',
        'غابة الأمازون',
      ],
      answer: 3,
    ),
    Question(
      text: 'ما هي أعلى قمة في العالم؟',
      options: [
        'قمة إيفرست',
        'قمة كليمنجارو',
        'قمة أنابورنا',
        'قمة كينيا',
      ],
      answer: 0,
    ),
    Question(
      text: 'ما هو البحر الذي يفصل بين قارة آسيا وقارة أفريقيا؟',
      options: [
        'البحر الأحمر',
        'البحر الأبيض المتوسط',
        'البحر الأسود',
        'بحر قزوين',
      ],
      answer: 0,
    ),
  ];

  String getQuestionName() {
    return questions[_questionNumber].text;
  }

  List<String> getOptions() {
    return questions[_questionNumber].options;
  }

  int getAnswer() {
    return questions[_questionNumber].answer;
  }

  int getQuestionNumber() {
    return _questionNumber;
  }

  void nextQuestion() {
    if (_questionNumber < questions.length - 1) {
      _questionNumber++;
    }
  }

  void reset() {
    _questionNumber = 0;
  }

  bool isFinished() {
    return _questionNumber == questions.length - 1;
  }
}
