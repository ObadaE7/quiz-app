import 'package:quiz/models/category.dart';
import 'package:quiz/models/question.dart';
import 'package:quiz/models/leaderboard.dart';

class DummyData {
  static List<Category> categories = [
    Category(
      id: 1,
      title: 'الرياضة',
      imagePath: 'images/sports.png',
      questionCount: 30,
    ),
    Category(
      id: 2,
      title: 'الكيمياء',
      imagePath: 'images/chemistry.png',
      questionCount: 30,
    ),
    Category(
      id: 3,
      title: 'الرياضيات',
      imagePath: 'images/math.png',
      questionCount: 30,
    ),
    Category(
      id: 4,
      title: 'التاريخ',
      imagePath: 'images/history.png',
      questionCount: 30,
    ),
    Category(
      id: 5,
      title: 'الأحياء',
      imagePath: 'images/biological.png',
      questionCount: 30,
    ),
    Category(
      id: 6,
      title: 'الجغرافيا',
      imagePath: 'images/geography.png',
      questionCount: 30,
    ),
  ];

  static List<Question> questions = [
    // Sports
    Question(
      text: 'في أي سنة فاز منتخب فرنسا بكأس العالم لأول مرة؟',
      options: ['1998', '2002', '2010', '2018'],
      answer: 0,
      categoryId: 1,
    ),
    Question(
      text: 'كم عدد لاعبي فريق كرة السلة على أرض الملعب؟',
      options: ['5', '6', '7', '11'],
      answer: 0,
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
        'ميسي',
        'كريستيانو رونالدو',
        'زلاتان إبراهيموفيتش',
        'لوكا مودريتش'
      ],
      answer: 0,
      categoryId: 1,
    ),
    Question(
      text: 'من فاز بكأس العالم 2014 في البرازيل؟',
      options: ['ألمانيا', 'الأرجنتين', 'البرازيل', 'فرنسا'],
      answer: 0,
      categoryId: 1,
    ),
    Question(
      text:
          'ما هو أكبر عدد من الأهداف التي سجلها لاعب في تاريخ دوري الأبطال الأوروبي؟',
      options: ['134', '140', '150', '170'],
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
      options: ['1968', '1982', '1999', '2008'],
      answer: 0,
      categoryId: 1,
    ),
    Question(
      text: 'من فاز بالميدالية الذهبية في سباق 100 متر في أولمبياد 2016؟',
      options: [
        'يوسين بولت',
        'جاستن جاتلين',
        'كريستيانو رونالدو',
        'تيمو فيرنر'
      ],
      answer: 0,
      categoryId: 1,
    ),
    Question(
      text: 'كم عدد الأشواط في مباراة كرة الطائرة؟',
      options: ['3', '4', '5', '6'],
      answer: 2,
      categoryId: 1,
    ),
    Question(
      text: 'من هو أعلى هداف في تاريخ كأس العالم لكرة القدم؟',
      options: ['ميسي', 'رونالدو', 'جيرد مولر', 'بيليه'],
      answer: 1,
      categoryId: 1,
    ),
    Question(
      text: 'من فاز ببطولة كأس الأمم الأوروبية 2016؟',
      options: ['البرتغال', 'فرنسا', 'ألمانيا', 'إسبانيا'],
      answer: 0,
      categoryId: 1,
    ),
    Question(
      text: 'من هو بطل سباق الفورمولا 1 لعام 2021؟',
      options: [
        'لويس هاميلتون',
        'ماكس فيرستابن',
        'سيباستيان فيتل',
        'شارل لوكلير'
      ],
      answer: 1,
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
      options: ['التنس', 'الكرة الطائرة', 'البولينغ', 'السباحة'],
      answer: 2,
      categoryId: 1,
    ),

    // Chemistry
    Question(
      text: 'ما هو العنصر الكيميائي الذي يرمز له بالرمز "O"?',
      options: ['الأوكسجين', 'الذهب', 'النحاس', 'اليود'],
      answer: 0,
      categoryId: 2,
    ),
    Question(
      text: 'ما هو الرقم الذري لعنصر الكربون؟',
      options: ['6', '12', '14', '16'],
      answer: 0,
      categoryId: 2,
    ),
    Question(
      text: 'أي من الغازات التالية يعتبر من الغازات النبيلة؟',
      options: ['الأكسجين', 'النيتروجين', 'الهيليوم', 'الهيدروجين'],
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
      options: ['الأوكسجين', 'النيتروجين', 'الأرجون', 'ثاني أكسيد الكربون'],
      answer: 0,
      categoryId: 2,
    ),
    Question(
      text: 'ما هو العنصر الذي يستخدم في صناعة البطاريات القابلة لإعادة الشحن؟',
      options: ['الليثيوم', 'الحديد', 'النحاس', 'الألمنيوم'],
      answer: 0,
      categoryId: 2,
    ),
    Question(
      text: 'ما هي الصيغة الكيميائية للماء؟',
      options: ['H2O', 'CO2', 'O2', 'H2O2'],
      answer: 0,
      categoryId: 2,
    ),
    Question(
      text: 'أي من العناصر التالية لا ينتمي إلى مجموعة الفلزات؟',
      options: ['الحديد', 'الكربون', 'الذهب', 'النحاس'],
      answer: 1,
      categoryId: 2,
    ),
    Question(
      text: 'ما هو العنصر الذي يستخدم في صناعة الأنابيب في معظم الأحيان؟',
      options: ['النحاس', 'الحديد', 'الفضة', 'الألومنيوم'],
      answer: 0,
      categoryId: 2,
    ),
    Question(
      text: 'ما هي المادة الكيميائية التي تشكل أغلب الغلاف الجوي للأرض؟',
      options: ['الأوكسجين', 'النيتروجين', 'ثاني أكسيد الكربون', 'الأرجون'],
      answer: 1,
      categoryId: 2,
    ),
    Question(
      text: 'ما هو الأيون الذي يكون موجودًا في محلول الحمض؟',
      options: ['OH-', 'H+', 'Na+', 'Cl-'],
      answer: 1,
      categoryId: 2,
    ),
    Question(
      text: 'ما هو الغاز المسؤول عن ظاهرة الاحتباس الحراري؟',
      options: ['الأوكسجين', 'الميثان', 'ثاني أكسيد الكربون', 'الأرجون'],
      answer: 2,
      categoryId: 2,
    ),

    // Mathematics
    Question(
      text: 'ما هو العدد الأولي بين هذه الأعداد؟',
      options: ['4', '6', '8', '7'],
      answer: 3,
      categoryId: 3,
    ),
    Question(
      text: 'ما هو قيمة π (باي) تقريباً؟',
      options: ['3.14', '2.71', '1.62', '1.41'],
      answer: 0,
      categoryId: 3,
    ),
    Question(
      text: 'ما هو ناتج 9 × 9؟',
      options: ['81', '72', '90', '99'],
      answer: 0,
      categoryId: 3,
    ),
    Question(
      text: 'ما هو الجذر التربيعي للعدد 16؟',
      options: ['2', '4', '6', '8'],
      answer: 1,
      categoryId: 3,
    ),
    Question(
      text: 'ما هو ناتج 25 ÷ 5؟',
      options: ['4', '5', '6', '7'],
      answer: 1,
      categoryId: 3,
    ),
    Question(
      text: 'إذا كان لديك 3 تفاحات وأخذت 2 منها، كم تبقى لديك؟',
      options: ['0', '1', '2', '3'],
      answer: 1,
      categoryId: 3,
    ),
    Question(
      text: 'ما هو ناتج 12 × 8؟',
      options: ['96', '84', '88', '92'],
      answer: 0,
      categoryId: 3,
    ),
    Question(
      text: 'ما هو العدد الذي يكون ناتج ضربه مع 9 هو 72؟',
      options: ['6', '8', '9', '10'],
      answer: 0,
      categoryId: 3,
    ),
    Question(
      text: 'ما هو المجموع: 15 + 28؟',
      options: ['43', '45', '44', '47'],
      answer: 0,
      categoryId: 3,
    ),
    Question(
      text: 'ما هو الفرق بين 100 و 37؟',
      options: ['63', '67', '72', '60'],
      answer: 0,
      categoryId: 3,
    ),
    Question(
      text: 'ما هو العدد الذي يأتي بعد 99؟',
      options: ['100', '98', '101', '102'],
      answer: 0,
      categoryId: 3,
    ),
    Question(
      text:
          'إذا كان لديك 50 ريالًا وقمت بشراء منتج بقيمة 30 ريالًا، كم تبقى لديك؟',
      options: ['15', '20', '25', '30'],
      answer: 1,
      categoryId: 3,
    ),
    Question(
      text: 'ما هو ناتج 7 × 6؟',
      options: ['42', '46', '48', '50'],
      answer: 0,
      categoryId: 3,
    ),

    // History
    Question(
      text: 'في أي سنة وقعت الثورة الفرنسية؟',
      options: ['1776', '1789', '1804', '1815'],
      answer: 1,
      categoryId: 4,
    ),
    Question(
      text: 'من كان أول رئيس للولايات المتحدة الأمريكية؟',
      options: ['جورج واشنطن', 'توماس جيفرسون', 'أبراهام لينكولن', 'جون آدامز'],
      answer: 0,
      categoryId: 4,
    ),
    Question(
      text: 'أين تقع الأهرامات الشهيرة التي بنيت في العصور القديمة؟',
      options: ['المكسيك', 'الهند', 'الصين', 'مصر'],
      answer: 3,
      categoryId: 4,
    ),
    Question(
      text: 'من هو قائد الثورة الروسية في عام 1917؟',
      options: ['لينين', 'ستالين', 'تروتسكي', 'كارل ماركس'],
      answer: 0,
      categoryId: 4,
    ),
    Question(
      text: 'ما هي الدولة التي أسسها المهاتما غاندي؟',
      options: ['الهند', 'باكستان', 'أفغانستان', 'بنغلاديش'],
      answer: 0,
      categoryId: 4,
    ),
    Question(
      text: 'من هو مؤسس الدولة الإسلامية؟',
      options: [
        'علي بن أبي طالب',
        'أبو بكر الصديق',
        'محمد صلى الله عليه وسلم',
        'عمر بن الخطاب'
      ],
      answer: 2,
      categoryId: 4,
    ),
    Question(
      text: 'في أي عام انتهت الحرب العالمية الثانية؟',
      options: ['1942', '1945', '1950', '1939'],
      answer: 1,
      categoryId: 4,
    ),
    Question(
      text: 'من هو مكتشف أمريكا؟',
      options: [
        'كريستوفر كولومبوس',
        'ماركو بولو',
        'فرانسيسكو بيزارو',
        'هرنان كورتيز'
      ],
      answer: 0,
      categoryId: 4,
    ),
    Question(
      text: 'في أي دولة وقعت معركة واترلو؟',
      options: ['فرنسا', 'ألمانيا', 'إنجلترا', 'بلجيكا'],
      answer: 3,
      categoryId: 4,
    ),
    Question(
      text: 'من هو آخر حكام الدولة العثمانية؟',
      options: [
        'محمد السادس',
        'سليمان القانوني',
        'عبد الحميد الثاني',
        'محمود الثاني'
      ],
      answer: 0,
      categoryId: 4,
    ),
    Question(
      text: 'من هو القائد العسكري الذي قاد الغزو العربي لفارس؟',
      options: [
        'خالد بن الوليد',
        'عمرو بن العاص',
        'سعد بن أبي وقاص',
        'طريق بن زهير'
      ],
      answer: 2,
      categoryId: 4,
    ),
    // Biology
    Question(
      text: 'ما هي الوحدة الأساسية للحياة؟',
      options: ['الخلية', 'العضلة', 'النسيج', 'العصب'],
      answer: 0,
      categoryId: 5,
    ),
    Question(
      text: 'ما هو العنصر الذي يوجد بشكل أساسي في عظام الإنسان؟',
      options: ['الكالسيوم', 'البوتاسيوم', 'الحديد', 'اليود'],
      answer: 0,
      categoryId: 5,
    ),
    Question(
      text: 'ما هو الجزء الذي يربط بين العظام في جسم الإنسان؟',
      options: ['الأربطة', 'الأعصاب', 'الأوعية', 'العضلات'],
      answer: 0,
      categoryId: 5,
    ),
    Question(
      text: 'ما هي وظيفة القلب في الجسم؟',
      options: ['ضخ الدم', 'تحريك العظام', 'تنظيم الحرارة', 'تنفس الأوكسجين'],
      answer: 0,
      categoryId: 5,
    ),
    Question(
      text: 'ما هي الخلايا المسؤولة عن نقل الإشارات العصبية؟',
      options: [
        'الخلايا العصبية',
        'الخلايا الدموية',
        'الخلايا العضلية',
        'الخلايا الجذعية'
      ],
      answer: 0,
      categoryId: 5,
    ),
    Question(
      text: 'أي من الأعضاء التالية يعتبر جزءًا من الجهاز التنفسي؟',
      options: ['الرئتين', 'الكبد', 'الكلى', 'المعدة'],
      answer: 0,
      categoryId: 5,
    ),
    Question(
      text: 'ما هو أكبر عضو في جسم الإنسان؟',
      options: ['الجلد', 'الكبد', 'الرئتين', 'القلب'],
      answer: 0,
      categoryId: 5,
    ),
    Question(
      text: 'ما هو العضو الذي يضخ الدم في الجسم؟',
      options: ['القلب', 'الرئتين', 'المعدة', 'الدماغ'],
      answer: 0,
      categoryId: 5,
    ),
    Question(
      text: 'ما هو الدور الرئيسي للدم في الجسم؟',
      options: [
        'نقل الأوكسجين',
        'التحكم في الحركة',
        'تحفيز العظام',
        'تنظيم درجة الحرارة'
      ],
      answer: 0,
      categoryId: 5,
    ),
    Question(
      text: 'ما هو الأنسجة التي تغطي الأعضاء الداخلية؟',
      options: ['الغشاء المخاطي', 'الأربطة', 'الأنسجة الدهنية', 'الأعصاب'],
      answer: 0,
      categoryId: 5,
    ),
    Question(
      text: 'ما هي الخلايا المسؤولة عن تصنيع الأنسولين؟',
      options: [
        'الخلايا بيتا في البنكرياس',
        'الخلايا العصبية',
        'الخلايا اللمفاوية',
        'الخلايا الدموية'
      ],
      answer: 0,
      categoryId: 5,
    ),
    Question(
      text: 'ما هو الجزء الذي يربط العضلات بالعظام؟',
      options: ['الأوتار', 'الأربطة', 'الأعصاب', 'الأوعية الدموية'],
      answer: 0,
      categoryId: 5,
    ),
    Question(
      text: 'ما هو النظام المسؤول عن الحركة في جسم الإنسان؟',
      options: [
        'الجهاز العضلي',
        'الجهاز الهضمي',
        'الجهاز التنفسي',
        'الجهاز الدوري'
      ],
      answer: 0,
      categoryId: 5,
    ),
    Question(
      text: 'أي من هذه الكائنات الحية يتكاثر عن طريق الانقسام الخلوي؟',
      options: ['البكتيريا', 'الفراشات', 'الأسماك', 'الطيور'],
      answer: 0,
      categoryId: 5,
    ),

    // Geography
    Question(
      text: 'ما هي أكبر قارة في العالم من حيث المساحة؟',
      options: ['آسيا', 'أفريقيا', 'أوروبا', 'أمريكا الشمالية'],
      answer: 0,
      categoryId: 6,
    ),
    Question(
      text: 'ما هو البحر الذي يقع بين أوروبا وأفريقيا؟',
      options: [
        'البحر الأحمر',
        'البحر الأبيض المتوسط',
        'البحر الأسود',
        'البحر الكاريبي'
      ],
      answer: 1,
      categoryId: 6,
    ),
    Question(
      text: 'في أي قارة يقع نهر النيل؟',
      options: ['آسيا', 'أفريقيا', 'أوروبا', 'أمريكا الجنوبية'],
      answer: 1,
      categoryId: 6,
    ),
    Question(
      text: 'ما هي أصغر دولة في العالم من حيث المساحة؟',
      options: ['الفاتيكان', 'موناكو', 'سان مارينو', 'مالطا'],
      answer: 0,
      categoryId: 6,
    ),
    Question(
      text: 'أي من هذه البحيرات هي الأكبر في العالم؟',
      options: ['بحيرة قزوين', 'بحيرة فيكتوريا', 'بحيرة إيري', 'بحيرة الدوم'],
      answer: 0,
      categoryId: 6,
    ),
    Question(
      text: 'ما هي الدولة التي تحتوي على أطول حدود في العالم؟',
      options: ['روسيا', 'كندا', 'الصين', 'الولايات المتحدة الأمريكية'],
      answer: 0,
      categoryId: 6,
    ),
    Question(
      text: 'ما هي عاصمة اليابان؟',
      options: ['طوكيو', 'كيوتو', 'أوساكا', 'ناغويا'],
      answer: 0,
      categoryId: 6,
    ),
    Question(
      text: 'في أي قارة يقع جبل إيفرست؟',
      options: ['آسيا', 'أفريقيا', 'أوروبا', 'أمريكا الشمالية'],
      answer: 0,
      categoryId: 6,
    ),
    Question(
      text: 'ما هو أكبر محيط في العالم؟',
      options: [
        'المحيط الأطلسي',
        'المحيط الهادئ',
        'المحيط الهندي',
        'المحيط القطبي الشمالي'
      ],
      answer: 1,
      categoryId: 6,
    ),
    Question(
      text: 'ما هو أكبر بحر في العالم؟',
      options: [
        'البحر الأبيض المتوسط',
        'البحر الأحمر',
        'بحر الصين الجنوبي',
        'البحر الكاريبي'
      ],
      answer: 2,
      categoryId: 6,
    ),
    Question(
      text: 'ما هي أعلى قمة جبلية في العالم؟',
      options: ['جبل إيفرست', 'جبل كي 2', 'جبل ماكنلي', 'جبل فينسون'],
      answer: 0,
      categoryId: 6,
    ),
    Question(
      text: 'ما هي الدولة التي تضم أكبر عدد من الجزر؟',
      options: ['إندونيسيا', 'اليونان', 'المالديف', 'الفلبين'],
      answer: 0,
      categoryId: 6,
    ),
    Question(
      text: 'ما هو أكبر نهر في العالم؟',
      options: ['نهر النيل', 'نهر الأمازون', 'نهر الميسيسيبي', 'نهر الغانج'],
      answer: 1,
      categoryId: 6,
    ),
  ];

  static List<Leaderboard> leaderboard = [
    Leaderboard(
      rank: 1,
      name: "عبادة",
      avatar: 'images/avatar-1.png',
      score: 145.093,
    ),
    Leaderboard(
      rank: 2,
      name: "محمد",
      avatar: 'images/avatar-2.png',
      score: 139.874,
    ),
    Leaderboard(
      rank: 3,
      name: "فاطمة",
      avatar: 'images/avatar-3.png',
      score: 128.657,
    ),
    Leaderboard(
      rank: 4,
      name: "سارة",
      avatar: 'images/avatar-4.png',
      score: 117.348,
    ),
    Leaderboard(
      rank: 5,
      name: "نورة",
      avatar: 'images/avatar-5.png',
      score: 110.592,
    ),
    Leaderboard(
      rank: 6,
      name: "خالد",
      avatar: 'images/avatar-6.png',
      score: 104.781,
    ),
    Leaderboard(
      rank: 7,
      name: "مريم",
      avatar: 'images/avatar-7.png',
      score: 98.674,
    ),
    Leaderboard(
      rank: 8,
      name: "سعيد",
      avatar: 'images/avatar-8.png',
      score: 93.572,
    ),
    Leaderboard(
      rank: 9,
      name: "أحمد",
      avatar: 'images/avatar-9.png',
      score: 89.463,
    ),
    Leaderboard(
      rank: 10,
      name: "ريم",
      avatar: 'images/avatar-10.png',
      score: 84.357,
    ),
    Leaderboard(
      rank: 11,
      name: "ماجد",
      avatar: 'images/avatar-11.png',
      score: 79.541,
    ),
    Leaderboard(
      rank: 12,
      name: "علي",
      avatar: 'images/avatar-12.png',
      score: 74.823,
    ),
    Leaderboard(
      rank: 13,
      name: "مها",
      avatar: 'images/avatar-13.png',
      score: 69.407,
    ),
  ];
}
