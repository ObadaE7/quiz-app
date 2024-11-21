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
      questionsCount: 30,
    ),
    Category(
      id: 2,
      title: 'الكيمياء',
      description:
          'هل أنت مستعد لاكتشاف العناصر، التفاعلات، والمركبات الكيميائية؟ استعد لتحدي معلوماتك في الكيمياء.',
      imagePath: 'assets/categories/chemistry.png',
      questionsCount: 30,
    ),
    Category(
      id: 3,
      title: 'الرياضيات',
      description:
          'اختبر مهاراتك في الحساب، الأشكال، والمعادلات. رحلة مثيرة لعشاق الأرقام والتفكير المنطقي!',
      imagePath: 'assets/categories/math.png',
      questionsCount: 30,
    ),
    Category(
      id: 4,
      title: 'التاريخ',
      description:
          'استرجع الأحداث، الشخصيات، والمراحل التاريخية التي شكلت العالم. اكتشف مدى معرفتك بالتاريخ.',
      imagePath: 'assets/categories/history.png',
      questionsCount: 30,
    ),
    Category(
      id: 5,
      title: 'الأحياء',
      description:
          'هل لديك شغف بالكائنات الحية؟ تحدّ معرفتك بالأحياء، من الخلايا إلى الأنظمة البيئية.',
      imagePath: 'assets/categories/biological.png',
      questionsCount: 30,
    ),
    Category(
      id: 6,
      title: 'الجغرافيا',
      description:
          'استكشف العالم من خلال الأسئلة الجغرافية حول البلدان، التضاريس، والمناخات المتنوعة.',
      imagePath: 'assets/categories/geography.png',
      questionsCount: 30,
    ),
  ];

  static List<Question> questions = [
    // Sports
    Question(
      text: "ما هي الرياضة التي يتم فيها استخدام المضرب والكرة الصغيرة؟",
      options: ["كرة القدم", "التنس", "ركوب الدراجات", "السباحة"],
      answer: 1,
      categoryId: 1,
    ),
    Question(
      text: "كم عدد اللاعبين في فريق كرة السلة الواحد داخل الملعب؟",
      options: ["خمسة لاعبين", "ستة لاعبين", "سبعة لاعبين", "أربعة لاعبين"],
      answer: 0,
      categoryId: 1,
    ),
    Question(
      text: "ما هو اسم البطولة الأكبر لكرة القدم في العالم؟",
      options: [
        "دوري أبطال أوروبا",
        "كأس العالم",
        "كأس أمم أفريقيا",
        "كوبا أمريكا"
      ],
      answer: 1,
      categoryId: 1,
    ),
    Question(
      text: "ما هي الرياضة التي يتم فيها استخدام المضرب والكرة على طاولة؟",
      options: ["كرة الطاولة", "التنس الأرضي", "كرة السلة", "البيسبول"],
      answer: 0,
      categoryId: 1,
    ),
    Question(
      text: "كم عدد اللاعبين في فريق كرة القدم الأساسي؟",
      options: ["9", "10", "11", "12"],
      answer: 2,
      categoryId: 1,
    ),
    Question(
      text: "من هو اللاعب الذي يُلقب بالأسطورة في كرة القدم؟",
      options: ["دييغو مارادونا", "ليونيل ميسي", "كريستيانو رونالدو", "بيليه"],
      answer: 3,
      categoryId: 1,
    ),
    Question(
      text: "من هو اللاعب الذي يُعرف بلقب 'البرغوث' في كرة القدم؟",
      options: ["محمد صلاح", "كريستيانو رونالدو", "ليونيل ميسي", "نيمار"],
      answer: 2,
      categoryId: 1,
    ),
    Question(
      text: "أي دولة تستضيف سباق الفورمولا 1 في موناكو؟",
      options: ["ألمانيا", "موناكو", "إيطاليا", "فرنسا"],
      answer: 1,
      categoryId: 1,
    ),
    Question(
      text: "ما هي الرياضة التي تُلعب باستخدام القرص الطائر؟",
      options: ["التنس", "الهوكي", "كرة اليد", "ألتيميت فريزبي"],
      answer: 3,
      categoryId: 1,
    ),
    Question(
      text: "في أي عام أُقيمت أول دورة ألعاب أولمبية حديثة؟",
      options: ["1888", "1896", "1912", "1900"],
      answer: 1,
      categoryId: 1,
    ),
    Question(
      text: "ما هو عدد الحلقات الأولمبية الموجودة في الشعار؟",
      options: ["6 حلقات", "5 حلقات", "7 حلقات", "4 حلقات"],
      answer: 1,
      categoryId: 1,
    ),
    Question(
      text: "أي رياضة يُستخدم فيها الحزام الأسود؟",
      options: ["الجودو", "الملاكمة", "الكاراتيه", "التيكواندو"],
      answer: 0,
      categoryId: 1,
    ),
    Question(
      text:
          "من هو اللاعب الذي يحمل الرقم القياسي في الفوز ببطولات التنس الكبرى؟",
      options: [
        "بيت سامبراس",
        "رافاييل نادال",
        "روجر فيدرير",
        "نوفاك ديوكوفيتش"
      ],
      answer: 3,
      categoryId: 1,
    ),
    Question(
      text: "ما هي الدولة التي فازت بكأس العالم 5 مرات؟",
      options: ["الأرجنتين", "إيطاليا", "البرازيل", "ألمانيا"],
      answer: 2,
      categoryId: 1,
    ),
    Question(
      text: "في أي رياضة يُطلق على الهدف اسم 'محاولة'؟",
      options: ["الكريكيت", "البيسبول", "الرجبي", "كرة القدم"],
      answer: 2,
      categoryId: 1,
    ),
    Question(
      text: "كم عدد الأشواط في مباراة كرة الطائرة؟",
      options: ["4 أشواط", "2 شوط", "3 أشواط", "5 أشواط"],
      answer: 3,
      categoryId: 1,
    ),
    Question(
      text: "ما اسم الرياضة التي تُلعب على الجليد باستخدام عصا وقرص؟",
      options: ["التزلج الفني", "البياثلون", "الهوكي الجليدي", "الباندي"],
      answer: 2,
      categoryId: 1,
    ),
    Question(
      text: "ما هو لقب محمد علي كلاي في عالم الملاكمة؟",
      options: ["الأعظم", "المقاتل", "الملك", "الأسطورة"],
      answer: 0,
      categoryId: 1,
    ),

    // Chemistry
    Question(
      text: "ما هو الرمز الكيميائي للماء؟",
      options: ["CH4", "CO2", "H2O", "O2"],
      answer: 2,
      categoryId: 2,
    ),
    Question(
      text: "ما هي الوحدة المستخدمة لقياس كمية المادة؟",
      options: ["مولارية", "كيلوغرام", "مول", "لتر"],
      answer: 2,
      categoryId: 2,
    ),
    Question(
      text: "ما العنصر الذي يُعتبر أساس الحياة؟",
      options: ["الأكسجين", "الهيدروجين", "النيتروجين", "الكربون"],
      answer: 3,
      categoryId: 2,
    ),
    Question(
      text: "ما هو الرقم الهيدروجيني للماء النقي؟",
      options: ["6", "5", "9", "7"],
      answer: 3,
      categoryId: 2,
    ),
    Question(
      text: "ما الغاز الذي يسبب الاحتباس الحراري؟",
      options: ["الأكسجين", "ثاني أكسيد الكربون", "الهيدروجين", "النيتروجين"],
      answer: 1,
      categoryId: 2,
    ),
    Question(
      text: "ما هو العنصر الأكثر وفرة في القشرة الأرضية؟",
      options: ["الكربون", "الأكسجين", "السيليكون", "الألمنيوم"],
      answer: 1,
      categoryId: 2,
    ),
    Question(
      text: "ما هو الرمز الكيميائي لعنصر الذهب؟",
      options: ["Au", "Ag", "Hg", "Pb"],
      answer: 0,
      categoryId: 2,
    ),
    Question(
      text: "ما هي الحالة الرابعة من حالات المادة؟",
      options: ["البلازما", "الغاز", "السائل", "الصلب"],
      answer: 0,
      categoryId: 2,
    ),
    Question(
      text: "ما نوع الرابطة الكيميائية في جزيء الماء؟",
      options: ["فلزية", "تساهمية", "هيدروجينية", "أيونية"],
      answer: 1,
      categoryId: 2,
    ),
    Question(
      text: "ما هو عدد البروتونات في نواة ذرة الهيدروجين؟",
      options: ["2", "0", "1", "3"],
      answer: 2,
      categoryId: 2,
    ),
    Question(
      text: "ما هي الحالة الرابعة للمادة؟",
      options: ["الصلب", "البلازما", "السائل", "الغاز"],
      answer: 1,
      categoryId: 2,
    ),
    Question(
      text: "ما هو العنصر الذي يستخدم في صناعة البطاريات؟",
      options: ["الكالسيوم", "الليثيوم", "الماغنيسيوم", "الصوديوم"],
      answer: 1,
      categoryId: 2,
    ),
    Question(
      text: "أي من هذه المركبات هو ملح الطعام؟",
      options: ["KCl", "NaCl", "HCl", "CaCO3"],
      answer: 1,
      categoryId: 2,
    ),
    Question(
      text: "ما هو الغاز المستخدم في تعبئة المصابيح الكهربائية؟",
      options: ["الهيليوم", "الأرجون", "الأكسجين", "النيتروجين"],
      answer: 1,
      categoryId: 2,
    ),
    Question(
      text: "ما هو الاسم الشائع لثاني أكسيد الكربون الصلب؟",
      options: [
        "الكربون المتجمد",
        "الثلج المائي",
        "الثلج الغازي",
        "الثلج الجاف"
      ],
      answer: 3,
      categoryId: 2,
    ),
    Question(
      text: "ما هي المادة التي تتكون بالكامل من نوع واحد من الذرات؟",
      options: ["العنصر", "المركب", "الإلكترون", "الجزيء"],
      answer: 0,
      categoryId: 2,
    ),
    Question(
      text: "ما هو العنصر المسؤول عن لون اللهب الأحمر في الألعاب النارية؟",
      options: ["الحديد", "السترونتيوم", "الصوديوم", "البوتاسيوم"],
      answer: 1,
      categoryId: 2,
    ),

    // Mathematics
    Question(
      text: "ما هو مجموع زوايا المثلث؟",
      options: ["180 درجة", "90 درجة", "360 درجة", "270 درجة"],
      answer: 0,
      categoryId: 3,
    ),
    Question(
      text: "كم يساوي 7 × 8؟",
      options: ["64", "48", "56", "49"],
      answer: 2,
      categoryId: 3,
    ),
    Question(
      text: "ما هو الجذر التربيعي للعدد 64؟",
      options: ["6", "9", "8", "7"],
      answer: 2,
      categoryId: 3,
    ),
    Question(
      text: "ما هي النسبة المئوية التي تساوي الكسر 1/2؟",
      options: ["75%", "33%", "50%", "25%"],
      answer: 2,
      categoryId: 3,
    ),
    Question(
      text: "ما هو الرقم الأولي التالي بعد 7؟",
      options: ["9", "10", "8", "11"],
      answer: 3,
      categoryId: 3,
    ),
    Question(
      text: "كم عدد الأضلاع في الشكل السداسي؟",
      options: ["6", "4", "7", "5"],
      answer: 0,
      categoryId: 3,
    ),
    Question(
      text: "كم يساوي 9 ÷ 3؟",
      options: ["6", "4", "2", "3"],
      answer: 3,
      categoryId: 3,
    ),
    Question(
      text: "ما هي قيمة π (باي) بالتقريب؟",
      options: ["3.12", "3.15", "3.141", "3.14"],
      answer: 3,
      categoryId: 3,
    ),
    Question(
      text: "ما هو العدد الذي إذا ضُرب في نفسه يعطي 36؟",
      options: ["9", "5", "7", "6"],
      answer: 3,
      categoryId: 3,
    ),
    Question(
      text: "كم عدد الزوايا في المربع؟",
      options: ["6", "3", "5", "4"],
      answer: 3,
      categoryId: 3,
    ),
    Question(
      text: "ما هو ناتج طرح 15 - 7؟",
      options: ["7", "9", "6", "8"],
      answer: 3,
      categoryId: 3,
    ),
    Question(
      text: "ما هو أكبر عدد مكون من رقمين؟",
      options: ["99", "98", "90", "100"],
      answer: 0,
      categoryId: 3,
    ),
    Question(
      text: "إذا كان محيط دائرة يساوي 31.4، فما هو نصف قطرها؟ (π = 3.14)",
      options: ["10", "5", "15", "7"],
      answer: 1,
      categoryId: 3,
    ),
    Question(
      text: "ما هي صيغة قانون مساحة المستطيل؟",
      options: [
        "الطول ÷ العرض",
        "الطول × العرض",
        "الطول + العرض",
        "2 × (الطول + العرض)"
      ],
      answer: 1,
      categoryId: 3,
    ),
    Question(
      text: "ما هو العدد الذي يساوي 2⁴؟",
      options: ["12", "16", "8", "24"],
      answer: 1,
      categoryId: 3,
    ),

    // History
    Question(
      text: "في أي عام وقعت الثورة الفرنسية؟",
      options: ["1776", "1804", "1789", "1799"],
      answer: 2,
      categoryId: 4,
    ),
    Question(
      text: "ما هو الحدث الذي أنهى الحرب العالمية الأولى؟",
      options: ["معاهدة فرساي", "معركة واترلو", "معاهدة باريس", "معاهدة جنيف"],
      answer: 0,
      categoryId: 4,
    ),
    Question(
      text: "من كان أول خليفة للمسلمين بعد وفاة النبي محمد صلى الله عليه وسلم؟",
      options: [
        "عثمان بن عفان",
        "علي بن أبي طالب",
        "عمر بن الخطاب",
        "أبو بكر الصديق"
      ],
      answer: 3,
      categoryId: 4,
    ),
    Question(
      text: "ما هي الحضارة التي بنت أهرامات الجيزة؟",
      options: [
        "الحضارة الرومانية",
        "الحضارة البابلية",
        "الحضارة الإغريقية",
        "الحضارة المصرية القديمة"
      ],
      answer: 3,
      categoryId: 4,
    ),
    Question(
      text: "في أي عام انتهت الحرب العالمية الثانية؟",
      options: ["1939", "1945", "1950", "1941"],
      answer: 1,
      categoryId: 4,
    ),
    Question(
      text: "من هو أول رئيس للولايات المتحدة الأمريكية؟",
      options: [
        "بنجامين فرانكلين",
        "جون آدامز",
        "جورج واشنطن",
        "توماس جيفرسون"
      ],
      answer: 2,
      categoryId: 4,
    ),
    Question(
      text: "ما اسم الملكة المصرية الشهيرة التي تزوجت من يوليوس قيصر؟",
      options: ["حتشبسوت", "نفرتيتي", "كليوباترا", "أنخس إن آمون"],
      answer: 2,
      categoryId: 4,
    ),
    Question(
      text: "ما هو اسم الحرب التي استمرت 100 عام؟",
      options: [
        "الحرب العالمية الأولى",
        "حرب الثلاثين عامًا",
        "الحرب الباردة",
        "حرب المئة عام"
      ],
      answer: 3,
      categoryId: 4,
    ),
    Question(
      text: "أي مدينة كانت عاصمة الإمبراطورية العثمانية؟",
      options: ["إسطنبول", "بغداد", "أنقرة", "دمشق"],
      answer: 0,
      categoryId: 4,
    ),
    Question(
      text: "من كان زعيم حركة الحقوق المدنية في الولايات المتحدة؟",
      options: [
        "روزا باركس",
        "مارتن لوثر كينغ جونيور",
        "مالكوم إكس",
        "فريدريك دوغلاس"
      ],
      answer: 1,
      categoryId: 4,
    ),
    Question(
      text: "ما اسم الحرب التي قادها صلاح الدين ضد الصليبيين؟",
      options: [
        "الحروب الصليبية",
        "الحرب الباردة",
        "الحرب العالمية الأولى",
        "حرب المئة عام"
      ],
      answer: 0,
      categoryId: 4,
    ),
    Question(
      text: "أي حضارة قديمة اخترعت الكتابة المسمارية؟",
      options: [
        "الحضارة الفينيقية",
        "الحضارة المصرية",
        "الحضارة البابلية",
        "الحضارة السومرية"
      ],
      answer: 3,
      categoryId: 4,
    ),
    Question(
      text:
          "ما هي القارة التي استعمرتها الدول الأوروبية في القرن التاسع عشر بشكل واسع؟",
      options: ["آسيا", "أمريكا الجنوبية", "أوقيانوسيا", "أفريقيا"],
      answer: 3,
      categoryId: 4,
    ),
    Question(
      text: "في أي عام تم فتح القسطنطينية؟",
      options: ["1453", "1492", "1517", "1415"],
      answer: 0,
      categoryId: 4,
    ),
    Question(
      text: "من هو الفرعون الذي بنى أبو الهول؟",
      options: ["رمسيس الثاني", "خفرع", "توت عنخ آمون", "أمنحتب"],
      answer: 1,
      categoryId: 4,
    ),
    Question(
      text: "ما اسم الحرب التي اندلعت بين الشمال والجنوب في الولايات المتحدة؟",
      options: [
        "الحرب الإسبانية الأمريكية",
        "الحرب الأهلية",
        "الحرب المكسيكية الأمريكية",
        "الحرب الباردة"
      ],
      answer: 1,
      categoryId: 4,
    ),

    // Biology
    Question(
      text: "ما هو العضو المسؤول عن ضخ الدم في جسم الإنسان؟",
      options: ["القلب", "الكبد", "الدماغ", "الرئتين"],
      answer: 0,
      categoryId: 5,
    ),
    Question(
      text: "ما هي الوحدة الأساسية التي يتكون منها جسم الكائن الحي؟",
      options: ["النواة", "الجسم الخلوي", "الخلية", "الأعضاء"],
      answer: 2,
      categoryId: 5,
    ),
    Question(
      text: "ما هو الغاز الذي تستنشقه النباتات أثناء عملية البناء الضوئي؟",
      options: ["الأكسجين", "الهيدروجين", "النيتروجين", "ثاني أكسيد الكربون"],
      answer: 3,
      categoryId: 5,
    ),
    Question(
      text: "ما اسم العظام التي تحمي الدماغ؟",
      options: ["الأضلاع", "عظم الجمجمة", "عظم الفخذ", "الفقرة"],
      answer: 1,
      categoryId: 5,
    ),
    Question(
      text: "ما هي الوحدة الوراثية الأساسية في جسم الإنسان؟",
      options: ["الكروموسومات", "الجينات", "الخلايا", "الحمض النووي"],
      answer: 1,
      categoryId: 5,
    ),
    Question(
      text: "ما هو العضو المسؤول عن تنقية الدم في جسم الإنسان؟",
      options: ["الرئتين", "الكبد", "القلب", "الكلى"],
      answer: 3,
      categoryId: 5,
    ),
    Question(
      text: "ما هو العضو الذي ينتج الأنسولين في جسم الإنسان؟",
      options: ["الكبد", "البنكرياس", "الكلى", "القلب"],
      answer: 1,
      categoryId: 5,
    ),
    Question(
      text: "ما هي الأجزاء التي تتكون منها الزهرة؟",
      options: [
        "الساق والأوراق",
        "الكأس والتويج",
        "المدقة والأسدية",
        "البذور والجذر"
      ],
      answer: 2,
      categoryId: 5,
    ),
    Question(
      text:
          "ما هو الاسم العلمي الذي يطلق على الحيوانات التي تتغذى على النباتات فقط؟",
      options: [
        "آكلة اللحوم",
        "آكلة النباتات",
        "آكلة كل شيء",
        "الحيوانات الطفيلية"
      ],
      answer: 1,
      categoryId: 5,
    ),
    Question(
      text: "ما هو اسم المادة التي تعطي النباتات لونها الأخضر؟",
      options: ["الهيموغلوبين", "الأوكسجين", "الكلوروفيل", "النيتروجين"],
      answer: 2,
      categoryId: 5,
    ),
    Question(
      text: "أي من هذه الكائنات يصنف على أنه من اللافقاريات؟",
      options: ["الثعبان", "السمكة", "الدودة", "القرد"],
      answer: 2,
      categoryId: 5,
    ),
    Question(
      text: "ما هو الجهاز الذي يربط العضلات بالعظام في الجسم؟",
      options: ["الأوتار", "الأربطة", "الغضاريف", "الأنسجة العضلية"],
      answer: 0,
      categoryId: 5,
    ),
    Question(
      text: "ما اسم الهرمون الذي ينظم مستوى السكر في الدم؟",
      options: ["الأنسولين", "الأدرينالين", "الإستروجين", "التستوستيرون"],
      answer: 0,
      categoryId: 5,
    ),
    Question(
      text: "ما هي أصغر عظمة في جسم الإنسان؟",
      options: ["عظمة الركاب", "عظمة الفخذ", "عظمة الترقوة", "عظمة العضد"],
      answer: 0,
      categoryId: 5,
    ),
    Question(
      text:
          "ما اسم العملية التي تستخدمها النباتات لتحويل الطاقة الشمسية إلى غذاء؟",
      options: [
        "التنفس الخلوي",
        "التمثيل الضوئي",
        "النقل النشط",
        "الانقسام الفتيلي"
      ],
      answer: 1,
      categoryId: 5,
    ),
    Question(
      text: "ما هي الطبقة الخارجية من الجلد التي توفر الحماية؟",
      options: ["الأدمة", "البشرة", "الأنسجة", "الغضاريف"],
      answer: 1,
      categoryId: 5,
    ),
    Question(
      text: "ما اسم الفيروس الذي يسبب مرض نقص المناعة المكتسب (الإيدز)؟",
      options: [
        "فيروس الإنفلونزا",
        "فيروس نقص المناعة البشري (HIV)",
        "فيروس كورونا",
        "فيروس شلل الأطفال"
      ],
      answer: 1,
      categoryId: 5,
    ),

    // Geography
    Question(
      text: "ما هو أكبر قارة من حيث المساحة؟",
      options: ["أفريقيا", "آسيا", "أوروبا", "أمريكا الشمالية"],
      answer: 1,
      categoryId: 6,
    ),
    Question(
      text: "ما هو أطول نهر في العالم؟",
      options: ["نهر الأمازون", "نهر النيل", "نهر اليانغتسي", "نهر المسيسيبي"],
      answer: 1,
      categoryId: 6,
    ),
    Question(
      text: "ما هي عاصمة اليابان؟",
      options: ["سيول", "بكين", "طوكيو", "كيوتو"],
      answer: 2,
      categoryId: 6,
    ),
    Question(
      text: "ما هو البحر الذي يفصل بين قارة أوروبا وقارة إفريقيا؟",
      options: [
        "بحر الصين الجنوبي",
        "بحر الشمال",
        "بحر البحر الأبيض المتوسط",
        "بحر العرب"
      ],
      answer: 2,
      categoryId: 6,
    ),
    Question(
      text: "ما هي الدولة التي يمر بها خط غرينتش؟",
      options: ["فرنسا", "بريطانيا", "ألمانيا", "السويد"],
      answer: 1,
      categoryId: 6,
    ),
    Question(
      text: "ما هي أكبر دولة من حيث عدد السكان؟",
      options: ["الولايات المتحدة", "الهند", "الصين", "روسيا"],
      answer: 2,
      categoryId: 6,
    ),
    Question(
      text: "ما هو اسم القارة القطبية الجنوبية؟",
      options: ["أنتاركتيكا", "أوقيانوسيا", "أوراسيا", "أمريكا الجنوبية"],
      answer: 0,
      categoryId: 6,
    ),
    Question(
      text: "أي من هذه البلدان ليس في قارة أفريقيا؟",
      options: ["مصر", "نيجيريا", "ألمانيا", "كينيا"],
      answer: 2,
      categoryId: 6,
    ),
    Question(
      text: "ما هو أعلى جبل في العالم؟",
      options: ["جبل كليمنجارو", "جبل إيفرست", "جبل فوجي", "جبل مونبلان"],
      answer: 1,
      categoryId: 6,
    ),
    Question(
      text: "ما هي عاصمة فرنسا؟",
      options: ["برلين", "مدريد", "باريس", "روما"],
      answer: 2,
      categoryId: 6,
    ),
    Question(
      text: "في أي قارة يقع جبل إيفرست؟",
      options: ["أفريقيا", "آسيا", "أمريكا الجنوبية", "أوروبا"],
      answer: 1,
      categoryId: 6,
    ),
    Question(
      text: "أي من هذه الدول تعد جزيرة؟",
      options: ["البرازيل", "أستراليا", "كندا", "الأرجنتين"],
      answer: 1,
      categoryId: 6,
    ),
    Question(
      text: "أي من هذه البلدان يمر فيها خط الاستواء؟",
      options: ["الأرجنتين", "إندونيسيا", "روسيا", "كندا"],
      answer: 1,
      categoryId: 6,
    ),
    Question(
      text: "ما هو أكبر محيط في العالم؟",
      options: [
        "المحيط الأطلسي",
        "المحيط الهندي",
        "المحيط الهادئ",
        "المحيط المتجمد الشمالي"
      ],
      answer: 2,
      categoryId: 6,
    ),
    Question(
      text: "ما هو أكبر بحيرة في العالم من حيث المساحة؟",
      options: [
        "بحيرة فيكتوريا",
        "بحيرة سوبيريور",
        "بحيرة قزوين",
        "بحيرة بايكال"
      ],
      answer: 2,
      categoryId: 6,
    ),
    Question(
      text: "ما هو أطول خط ساحلي في العالم؟",
      options: ["كندا", "أستراليا", "البرازيل", "روسيا"],
      answer: 0,
      categoryId: 6,
    ),
    Question(
      text: "ما هو أكبر صحراء في العالم؟",
      options: [
        "صحراء أتاكاما",
        "صحراء النقب",
        "الصحراء الكبرى",
        "صحراء كالهاري"
      ],
      answer: 2,
      categoryId: 6,
    ),
    Question(
      text: "أي من هذه الجزر هي جزء من اليونان؟",
      options: ["جزر الكناري", "جزر هاواي", "جزر كيب فيرجين", "جزر كريت"],
      answer: 3,
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
