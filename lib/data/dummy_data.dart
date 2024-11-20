import 'package:quiz/models/category.dart';
import 'package:quiz/models/question.dart';
import 'package:quiz/models/leaderboard.dart';

class DummyData {
  static List<Category> categories = [
    Category(
      id: 1,
      title: 'الرياضة',
      description:
          'اختبر معرفتك في عالم الرياضة! مجموعة من الأسئلة المتنوعة حول الألعاب، البطولات، والرياضيين المشهورين.',
      imagePath: 'assets/categories/sports.png',
      questionCount: 30,
    ),
    Category(
      id: 2,
      title: 'الكيمياء',
      description:
          'هل أنت مستعد لاكتشاف العناصر، التفاعلات، والمركبات الكيميائية؟ استعد لتحدي معلوماتك في الكيمياء.',
      imagePath: 'assets/categories/chemistry.png',
      questionCount: 30,
    ),
    Category(
      id: 3,
      title: 'الرياضيات',
      description:
          'اختبر مهاراتك في الحساب، الأشكال، والمعادلات. رحلة مثيرة لعشاق الأرقام والتفكير المنطقي!',
      imagePath: 'assets/categories/math.png',
      questionCount: 30,
    ),
    Category(
      id: 4,
      title: 'التاريخ',
      description:
          'استرجع الأحداث، الشخصيات، والمراحل التاريخية التي شكلت العالم. اكتشف مدى معرفتك بالتاريخ.',
      imagePath: 'assets/categories/history.png',
      questionCount: 30,
    ),
    Category(
      id: 5,
      title: 'الأحياء',
      description:
          'هل لديك شغف بالكائنات الحية؟ تحدّ معرفتك بالأحياء، من الخلايا إلى الأنظمة البيئية.',
      imagePath: 'assets/categories/biological.png',
      questionCount: 30,
    ),
    Category(
      id: 6,
      title: 'الجغرافيا',
      description:
          'استكشف العالم من خلال الأسئلة الجغرافية حول البلدان، التضاريس، والمناخات المتنوعة.',
      imagePath: 'assets/categories/geography.png',
      questionCount: 30,
    ),
  ];

  static List<Question> questions = [
    // Sports
    Question(
      text: 'في أي سنة فاز منتخب فرنسا بكأس العالم لأول مرة؟',
      options: ['2010', '2002', '1998', '2018'],
      answer: 2,
      categoryId: 1,
    ),
    Question(
      text: 'كم عدد لاعبي فريق كرة السلة على أرض الملعب؟',
      options: ['11', '6', '7', '5'],
      answer: 3,
      categoryId: 1,
    ),
    Question(
      text: 'ما هو أول بلد استضاف كأس العالم؟',
      options: ['البرازيل', 'الأوروغواي', 'إيطاليا', 'الأرجنتين'],
      answer: 1,
      categoryId: 1,
    ),
    Question(
      text: 'من هو لاعب كرة القدم الذي فاز بأكبر عدد من جوائز الكرة الذهبية؟',
      options: [
        'كريستيانو رونالدو',
        'ميسي',
        'زلاتان إبراهيموفيتش',
        'لوكا مودريتش'
      ],
      answer: 1,
      categoryId: 1,
    ),
    Question(
      text: 'من فاز بكأس العالم 2014 في البرازيل؟',
      options: ['ألمانيا', 'البرازيل', 'الأرجنتين', 'فرنسا'],
      answer: 0,
      categoryId: 1,
    ),
    Question(
      text:
          'ما هو أكبر عدد من الأهداف التي سجلها لاعب في تاريخ دوري الأبطال الأوروبي؟',
      options: ['134', '170', '150', '140'],
      answer: 1,
      categoryId: 1,
    ),
    Question(
      text: 'كم عدد اللاعبين في فريق كرة القدم؟',
      options: ['7', '9', '11', '13'],
      answer: 2,
      categoryId: 1,
    ),
    Question(
      text:
          'في أي سنة فاز فريق مانشستر يونايتد بدوري الأبطال الأوروبي للمرة الأولى؟',
      options: ['1982', '1999', '1968', '2008'],
      answer: 2,
      categoryId: 1,
    ),
    Question(
      text: 'من فاز بالميدالية الذهبية في سباق 100 متر في أولمبياد 2016؟',
      options: [
        'يوسين بولت',
        'تيمو فيرنر',
        'كريستيانو رونالدو',
        'جاستن جاتلين'
      ],
      answer: 0,
      categoryId: 1,
    ),
    Question(
      text: 'كم عدد الأشواط في مباراة كرة الطائرة؟',
      options: ['5', '3', '6', '4'],
      answer: 2,
      categoryId: 1,
    ),
    Question(
      text: 'من هو أعلى هداف في تاريخ كأس العالم لكرة القدم؟',
      options: ['رونالدو', 'ميسي', 'بيليه', 'جيرد مولر'],
      answer: 1,
      categoryId: 1,
    ),
    Question(
      text: 'من فاز ببطولة كأس الأمم الأوروبية 2016؟',
      options: ['إسبانيا', 'البرتغال', 'ألمانيا', 'فرنسا'],
      answer: 1,
      categoryId: 1,
    ),
    Question(
      text: 'من هو بطل سباق الفورمولا 1 لعام 2021؟',
      options: [
        'ماكس فيرستابن',
        'لويس هاميلتون',
        'سيباستيان فيتل',
        'شارل لوكلير'
      ],
      answer: 0,
      categoryId: 1,
    ),
    Question(
      text: 'في أي عام أقيمت أول دورة ألعاب أولمبية حديثة؟',
      options: ['1896', '1900', '1924', '1936'],
      answer: 0,
      categoryId: 1,
    ),
    Question(
      text: 'في أي رياضة يتم استخدام كرة تسمى "البولينغ"?',
      options: ['التنس', 'السباحة', 'البولينغ', 'الكرة الطائرة'],
      answer: 2,
      categoryId: 1,
    ),

    // Chemistry
    Question(
      text: 'ما هو العنصر الكيميائي الذي يرمز له بالرمز "O"?',
      options: ['النحاس', 'اليود', 'الأوكسجين', 'الذهب'],
      answer: 2,
      categoryId: 2,
    ),
    Question(
      text: 'ما هو الرقم الذري لعنصر الكربون؟',
      options: ['12', '6', '14', '16'],
      answer: 1,
      categoryId: 2,
    ),
    Question(
      text: 'أي من الغازات التالية يعتبر من الغازات النبيلة؟',
      options: ['الهيدروجين', 'الأوكسجين', 'الهيليوم', 'النيتروجين'],
      answer: 2,
      categoryId: 2,
    ),
    Question(
      text: 'ما هو العنصر الكيميائي الذي يرمز له بـ "H"?',
      options: ['الهيليوم', 'الهيدروجين', 'الهوايون', 'الهيدروكلوريد'],
      answer: 1,
      categoryId: 2,
    ),
    Question(
      text: 'ما هو الغاز الذي يتنفسه البشر بشكل رئيسي؟',
      options: ['ثاني أكسيد الكربون', 'النيتروجين', 'الأرجون', 'الأوكسجين'],
      answer: 3,
      categoryId: 2,
    ),
    Question(
      text: 'ما هو العنصر الذي يستخدم في صناعة البطاريات القابلة لإعادة الشحن؟',
      options: ['الألمنيوم', 'النحاس', 'الحديد', 'الليثيوم'],
      answer: 3,
      categoryId: 2,
    ),
    Question(
      text: 'ما هي الصيغة الكيميائية للماء؟',
      options: ['CO2', 'H2O2', 'H2O', 'O2'],
      answer: 2,
      categoryId: 2,
    ),
    Question(
      text: 'أي من العناصر التالية لا ينتمي إلى مجموعة الفلزات؟',
      options: ['الكربون', 'الذهب', 'الحديد', 'النحاس'],
      answer: 0,
      categoryId: 2,
    ),
    Question(
      text: 'ما هو العنصر الذي يستخدم في صناعة الأنابيب في معظم الأحيان؟',
      options: ['النحاس', 'الفضة', 'الحديد', 'الألومنيوم'],
      answer: 0,
      categoryId: 2,
    ),
    Question(
      text: 'ما هي المادة الكيميائية التي تشكل أغلب الغلاف الجوي للأرض؟',
      options: ['ثاني أكسيد الكربون', 'النيتروجين', 'الأوكسجين', 'الأرجون'],
      answer: 1,
      categoryId: 2,
    ),
    Question(
      text: 'ما هو الأيون الذي يكون موجودًا في محلول الحمض؟',
      options: ['OH-', 'Na+', 'Cl-', 'H+'],
      answer: 3,
      categoryId: 2,
    ),
    Question(
      text: 'ما هو الغاز المسؤول عن ظاهرة الاحتباس الحراري؟',
      options: ['الميثان', 'الأوكسجين', 'ثاني أكسيد الكربون', 'الأرجون'],
      answer: 2,
      categoryId: 2,
    ),

    // Mathematics
    Question(
      text: 'ما هو العدد الأولي بين هذه الأعداد؟',
      options: ['8', '6', '4', '7'],
      answer: 3,
      categoryId: 3,
    ),
    Question(
      text: 'ما هو قيمة π (باي) تقريباً؟',
      options: ['3.14', '2.71', '1.41', '1.62'],
      answer: 0,
      categoryId: 3,
    ),
    Question(
      text: 'ما هو ناتج 9 × 9؟',
      options: ['81', '90', '72', '99'],
      answer: 0,
      categoryId: 3,
    ),
    Question(
      text: 'ما هو الجذر التربيعي للعدد 16؟',
      options: ['8', '6', '2', '4'],
      answer: 3,
      categoryId: 3,
    ),
    Question(
      text: 'ما هو ناتج 25 ÷ 5؟',
      options: ['4', '7', '6', '5'],
      answer: 3,
      categoryId: 3,
    ),
    Question(
      text: 'إذا كان لديك 3 تفاحات وأخذت 2 منها، كم تبقى لديك؟',
      options: ['3', '2', '1', '0'],
      answer: 2,
      categoryId: 3,
    ),
    Question(
      text: 'ما هو ناتج 12 × 8؟',
      options: ['96', '88', '78', '86'],
      answer: 0,
      categoryId: 3,
    ),
    Question(
      text: 'ما هو العدد الذي يكون نفسه عندما يُضاف إليه 1؟',
      options: ['0', '1', '2', '5'],
      answer: 1,
      categoryId: 3,
    ),
    Question(
      text: 'ما هو الشكل الهندسي الذي يحتوي على 4 أضلاع؟',
      options: ['مثلث', 'مستطيل', 'دائرة', 'مربع'],
      answer: 1,
      categoryId: 3,
    ),
    Question(
      text: 'ما هو جمع 15 + 12؟',
      options: ['27', '25', '29', '30'],
      answer: 0,
      categoryId: 3,
    ),

    // Biology
    Question(
      text: 'ما هو العضو الذي يضخ الدم في جسم الإنسان؟',
      options: ['الرئتين', 'المعدة', 'القلب', 'الكبد'],
      answer: 2,
      categoryId: 4,
    ),
    Question(
      text: 'ما هو الغاز الذي يتنفسه الإنسان من الهواء؟',
      options: ['الأوكسجين', 'ثاني أكسيد الكربون', 'النيتروجين', 'الأرجون'],
      answer: 0,
      categoryId: 4,
    ),
    Question(
      text: 'أي من الكائنات التالية هو نبات؟',
      options: ['الأسد', 'السمكة', 'الشجرة', 'الطائر'],
      answer: 2,
      categoryId: 4,
    ),
    Question(
      text: 'ما هو عدد الكروموسومات في الخلية البشرية؟',
      options: ['46', '48', '50', '44'],
      answer: 0,
      categoryId: 4,
    ),
    Question(
      text: 'ما هو أصغر وحدة بنائية في الكائنات الحية؟',
      options: ['الخلية', 'العضو', 'الأنسجة', 'الجهاز'],
      answer: 0,
      categoryId: 4,
    ),
    Question(
      text: 'ما هو الجزء الذي يحتوي على الحمض النووي في الخلية؟',
      options: ['النواة', 'الميتوكوندريا', 'السيتوبلازم', 'الغشاء البلازمي'],
      answer: 0,
      categoryId: 4,
    ),
    Question(
      text: 'أي من الكائنات التالية يعتبر مخلوقًا متعدد الخلايا؟',
      options: ['البكتيريا', 'الفقاريات', 'الفطريات', 'الطحالب'],
      answer: 1,
      categoryId: 4,
    ),
    Question(
      text: 'ما هو الحيوان الذي يبيض ويتكاثر في الماء؟',
      options: ['الطيور', 'الزواحف', 'الثدييات', 'البرمائيات'],
      answer: 3,
      categoryId: 4,
    ),
    Question(
      text: 'ما هي الخلايا التي تحمل الأوكسجين في جسم الإنسان؟',
      options: [
        'خلايا الدم البيضاء',
        'خلايا الدم الحمراء',
        'الصفائح الدموية',
        'الخلايا العصبية'
      ],
      answer: 1,
      categoryId: 4,
    ),
    Question(
      text: 'أي من العمليات التالية يساهم في إنتاج الطاقة داخل الخلية؟',
      options: [
        'التمثيل الضوئي',
        'التنفس الخلوي',
        'الانقسام الخلوي',
        'النقل السلبي'
      ],
      answer: 1,
      categoryId: 4,
    ),

    // History
    Question(
      text: 'من هو أول رئيس للولايات المتحدة الأمريكية؟',
      options: [
        'أبراهام لينكولن',
        'جورج واشنطن',
        'توماس جيفرسون',
        'فرانكلين روزفلت'
      ],
      answer: 1,
      categoryId: 5,
    ),
    Question(
      text: 'في أي سنة بدأت الحرب العالمية الثانية؟',
      options: ['1938', '1941', '1939', '1945'],
      answer: 2,
      categoryId: 5,
    ),
    Question(
      text: 'من هو الذي أسس إمبراطورية المغول في الهند؟',
      options: ['أكبر', 'شاه جيهان', 'بابر', 'أورنجزيب'],
      answer: 2,
      categoryId: 5,
    ),
    Question(
      text: 'من هو الفاتح الذي فتح القسطنطينية؟',
      options: ['صلاح الدين', 'محمد الفاتح', 'خالد بن الوليد', 'عمر بن الخطاب'],
      answer: 1,
      categoryId: 5,
    ),
    Question(
      text: 'من هو الذي كتب إعلان الاستقلال الأمريكي؟',
      options: ['توماس جيفرسون', 'جورج واشنطن', 'بن فرانكلين', 'جون آدامز'],
      answer: 0,
      categoryId: 5,
    ),
    Question(
      text:
          'ما هو التاريخ الذي تم فيه توقيع معاهدة السلام بين ألمانيا والولايات المتحدة؟',
      options: ['1914', '1918', '1919', '1920'],
      answer: 2,
      categoryId: 5,
    ),
    Question(
      text: 'في أي عام أُسست منظمة الأمم المتحدة؟',
      options: ['1945', '1950', '1939', '1919'],
      answer: 0,
      categoryId: 5,
    ),
    Question(
      text: 'أي من الحروب كانت بين الولايات المتحدة الأمريكية والفيتنام؟',
      options: [
        'الحرب العالمية الثانية',
        'الحرب الكورية',
        'حرب فيتنام',
        'الحرب الأهلية الأمريكية'
      ],
      answer: 2,
      categoryId: 5,
    ),
    Question(
      text: 'من كان الزعيم الذي قاد الثورة الفرنسية؟',
      options: [
        'روبسبيير',
        'نابليون بونابرت',
        'لويس السادس عشر',
        'ماري أنطوانيت'
      ],
      answer: 0,
      categoryId: 5,
    ),
    Question(
      text: 'من هو مكتشف قارة أمريكا؟',
      options: [
        'كريستوفر كولومبوس',
        'ماجلان',
        'فاسكو دا غاما',
        'أميرال نيلسون'
      ],
      answer: 0,
      categoryId: 5,
    ),

    // Geography
    Question(
      text: 'ما هو أكبر قارة في العالم؟',
      options: ['أفريقيا', 'آسيا', 'أوروبا', 'أمريكا'],
      answer: 1,
      categoryId: 6,
    ),
    Question(
      text: 'ما هو أطول نهر في العالم؟',
      options: ['النيل', 'الأمازون', 'اليانغتسي', 'الميزوري'],
      answer: 0,
      categoryId: 6,
    ),
    Question(
      text: 'ما هي عاصمة فرنسا؟',
      options: ['برلين', 'روما', 'باريس', 'مدريد'],
      answer: 2,
      categoryId: 6,
    ),
    Question(
      text: 'أين تقع هضبة التبت؟',
      options: ['في أمريكا', 'في آسيا', 'في أفريقيا', 'في أوروبا'],
      answer: 1,
      categoryId: 6,
    ),
    Question(
      text: 'ما هي أكبر بحيرة في العالم؟',
      options: ['بحيرة سوخوي', 'البحر الأسود', 'بحيرة قزوين', 'بحيرة أونتاريو'],
      answer: 2,
      categoryId: 6,
    ),
    Question(
      text: 'ما هي الدولة التي يمر بها نهر النيل؟',
      options: ['السودان', 'مصر', 'إثيوبيا', 'جميع ما ذكر'],
      answer: 3,
      categoryId: 6,
    ),
    Question(
      text: 'ما هو أعلى جبل في العالم؟',
      options: ['إيفرست', 'كي2', 'كانغتشينجونغا', 'ماكنلي'],
      answer: 0,
      categoryId: 6,
    ),
    Question(
      text: 'ما هي أقرب دولة إلى القارة القطبية الجنوبية؟',
      options: ['شيلي', 'الأرجنتين', 'جنوب أفريقيا', 'أستراليا'],
      answer: 1,
      categoryId: 6,
    ),
    Question(
      text: 'أين يقع البحر الأبيض المتوسط؟',
      options: [
        'في آسيا',
        'في أفريقيا',
        'بين قارات أوروبا وآسيا وأفريقيا',
        'في أمريكا'
      ],
      answer: 2,
      categoryId: 6,
    ),
    Question(
      text: 'ما هي أكبر مدينة في العالم من حيث عدد السكان؟',
      options: ['مكسيكو سيتي', 'نيودلهي', 'طوكيو', 'شanghai'],
      answer: 2,
      categoryId: 6,
    ),
  ];

  static List<Leaderboard> leaderboard = [
    Leaderboard(
      rank: 1,
      name: "عبادة",
      avatar: 'assets/avatars/avatar-1.png',
      score: 145.093,
    ),
    Leaderboard(
      rank: 2,
      name: "محمد",
      avatar: 'assets/avatars/avatar-2.png',
      score: 139.874,
    ),
    Leaderboard(
      rank: 3,
      name: "فاطمة",
      avatar: 'assets/avatars/avatar-3.png',
      score: 128.657,
    ),
    Leaderboard(
      rank: 4,
      name: "سارة",
      avatar: 'assets/avatars/avatar-4.png',
      score: 117.348,
    ),
    Leaderboard(
      rank: 5,
      name: "نورة",
      avatar: 'assets/avatars/avatar-5.png',
      score: 110.592,
    ),
    Leaderboard(
      rank: 6,
      name: "خالد",
      avatar: 'assets/avatars/avatar-6.png',
      score: 104.781,
    ),
    Leaderboard(
      rank: 7,
      name: "مريم",
      avatar: 'assets/avatars/avatar-7.png',
      score: 98.674,
    ),
    Leaderboard(
      rank: 8,
      name: "سعيد",
      avatar: 'assets/avatars/avatar-8.png',
      score: 93.572,
    ),
    Leaderboard(
      rank: 9,
      name: "أحمد",
      avatar: 'assets/avatars/avatar-9.png',
      score: 89.463,
    ),
    Leaderboard(
      rank: 10,
      name: "ريم",
      avatar: 'assets/avatars/avatar-10.png',
      score: 84.357,
    ),
    Leaderboard(
      rank: 11,
      name: "ماجد",
      avatar: 'assets/avatars/avatar-11.png',
      score: 79.541,
    ),
    Leaderboard(
      rank: 12,
      name: "علي",
      avatar: 'assets/avatars/avatar-12.png',
      score: 74.823,
    ),
    Leaderboard(
      rank: 13,
      name: "مها",
      avatar: 'assets/avatars/avatar-13.png',
      score: 69.407,
    ),
  ];
}
