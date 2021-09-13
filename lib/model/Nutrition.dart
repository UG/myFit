class Nutrition {
  int Food_id;
  // amino acid
  double Leucine; // BCAA
  double Valine; // BCAA
  double Isoleucine; // BCAA
  double Phenylalanine; // EAA
  double Histidine; // EAA
  double Lysine; // EAA
  double Tryptophan; // EAA
  double Methionine; // EAA
  double Threonine; //EAA
  double GlutamicAcid;
  double Arginine;
  double Glycine;
  double Tyrosine;
  double Alanine;
  double AsparticAcid;
  double Asparagine;
  double Pyrrolysine;
  double Proline;
  double Glutamine;
  double Serine;
  double Selenocysteine;
  double Cysteine;

  //Carbo
  double sugar;
  double monosaccharide; //単糖類
  double oligosaccharide; //オリゴ糖（少糖)
  double polysaccharide; //多糖類
  double resistantStarch;

  double glycemicIndex;

  // vitamin
  double vitaminA;

  double vitaminB1;
  double vitaminB2;
  double niacin;
  double pantothenAcid;
  double vitaminB6;
  double biotin;
  double folate;
  double vitaminB12;

  double vitaminC;

  double vitaminD;

  double vitaminE;

  double vitaminK;

  // macro mineral
  double potassium;
  double sodium;
  double phosphorus;
  double calcium;
  double magnesium;

  // micro mineral
  double iron;
  double zinc;
  double manganese; //マンガン
  double iodine; //ヨウ素
  double selen;
  double molybdenum;
  double chromium;

  //Fat
  double saturatedFatty; // 飽和脂肪酸
  double sct; //短鎖脂肪酸
  double mct; //中鎖脂肪酸

  double monounsaturatedFatty; //一価不飽和脂肪酸

  double polyunsaturatedFatty; //多価不飽和脂肪酸
  double omega3;
  double omega6;
  double omega7;
  double omega9;

  // Dietary fiber
  double waterSolubleDietaryFiber;
  double insolubleDietaryFiber;

  Nutrition({
    required this.Food_id,
    this.Leucine = 0.0,
    this.Valine = 0.0,
    this.Isoleucine = 0.0,
    this.Phenylalanine = 0.0,
    this.Histidine = 0.0,
    this.Lysine = 0.0,
    this.Tryptophan = 0.0,
    this.Methionine = 0.0,
    this.Threonine = 0.0,
    this.GlutamicAcid = 0.0,
    this.Arginine = 0.0,
    this.Glycine = 0.0,
    this.Tyrosine = 0.0,
    this.Alanine = 0.0,
    this.AsparticAcid = 0.0,
    this.Asparagine = 0.0,
    this.Pyrrolysine = 0.0,
    this.Proline = 0.0,
    this.Glutamine = 0.0,
    this.Serine = 0.0,
    this.Selenocysteine = 0.0,
    this.Cysteine = 0.0,
    this.sugar = 0.0,
    this.monosaccharide = 0.0,
    this.oligosaccharide = 0.0,
    this.polysaccharide = 0.0,
    this.resistantStarch = 0.0,
    this.glycemicIndex = 0.0,
    this.vitaminA = 0.0,
    this.vitaminB1 = 0.0,
    this.vitaminB2 = 0.0,
    this.niacin = 0.0,
    this.pantothenAcid = 0.0,
    this.vitaminB6 = 0.0,
    this.biotin = 0.0,
    this.folate = 0.0,
    this.vitaminB12 = 0.0,
    this.vitaminC = 0.0,
    this.vitaminD = 0.0,
    this.vitaminE = 0.0,
    this.vitaminK = 0.0,
    this.potassium = 0.0,
    this.sodium = 0.0,
    this.phosphorus = 0.0,
    this.calcium = 0.0,
    this.magnesium = 0.0,
    this.iron = 0.0,
    this.zinc = 0.0,
    this.manganese = 0.0,
    this.iodine = 0.0,
    this.selen = 0.0,
    this.molybdenum = 0.0,
    this.chromium = 0.0,
    this.saturatedFatty = 0.0,
    this.sct = 0.0,
    this.mct = 0.0,
    this.monounsaturatedFatty = 0.0,
    this.polyunsaturatedFatty = 0.0,
    this.omega3 = 0.0,
    this.omega6 = 0.0,
    this.omega7 = 0.0,
    this.omega9 = 0.0,
    this.waterSolubleDietaryFiber = 0.0,
    this.insolubleDietaryFiber = 0.0,
  });
  factory Nutrition.fromMap(Map<String, dynamic> json) => Nutrition(
      Food_id: json["Food_id"],
      Leucine: json["Leucine"],
      Valine: json["Valine"],
      Isoleucine: json["Isoleucine"],
      Phenylalanine: json["Phenylalanine"],
      Histidine: json["Histidine"],
      Lysine: json["Lysine"],
      Tryptophan: json["Tryptophan"],
      Methionine: json["Methionine"],
      Threonine: json["Threonine"],
      GlutamicAcid: json["GlutamicAcid"],
      Arginine: json["Arginine"],
      Glycine: json["Glycine"],
      Tyrosine: json["Tyrosine"],
      Alanine: json["Alanine"],
      AsparticAcid: json["AsparticAcid"],
      Asparagine: json["Asparagine"],
      Pyrrolysine: json["Pyrrolysine"],
      Proline: json["Proline"],
      Glutamine: json["Glutamine"],
      Serine: json["Serine"],
      Selenocysteine: json["Selenocysteine"],
      Cysteine: json["Cysteine"],
      sugar: json["sugar"],
      monosaccharide: json["monosaccharide"],
      oligosaccharide: json["oligosaccharide"],
      polysaccharide: json["polysaccharide"],
      resistantStarch: json["resistantStarch"],
      glycemicIndex: json["glycemicIndex"],
      vitaminA: json["vitaminA"],
      vitaminB1: json["vitaminB1"],
      vitaminB2: json["vitaminB2"],
      niacin: json["niacin"],
      pantothenAcid: json["pantothenAcid"],
      vitaminB6: json["vitaminB6"],
      biotin: json["biotin"],
      folate: json["folate"],
      vitaminB12: json["vitaminB12"],
      vitaminC: json["vitaminC"],
      vitaminD: json["vitaminD"],
      vitaminE: json["vitaminE"],
      vitaminK: json["vitaminK"],
      potassium: json["potassium"],
      sodium: json["sodium"],
      phosphorus: json["phosphorus"],
      calcium: json["calcium"],
      magnesium: json["magnesium"],
      iron: json["iron"],
      zinc: json["zinc"],
      manganese: json["manganese"],
      iodine: json["iodine"],
      selen: json["selen"],
      molybdenum: json["molybdenum"],
      chromium: json["chromium"],
      saturatedFatty: json["saturatedFatty"],
      sct: json["sct"],
      mct: json["mct"],
      monounsaturatedFatty: json["monounsaturatedFatty"],
      polyunsaturatedFatty: json["polyunsaturatedFatty"],
      omega3: json["omega3"],
      omega6: json["omega6"],
      omega7: json["omega7"],
      omega9: json["mega9"],
      waterSolubleDietaryFiber: json["waterSolubleDietaryFiber"],
      insolubleDietaryFiber: json["insolubleDietaryFiber"]);

  Map<String, dynamic> toMap() => {
        "Food_id": Food_id,
        "Leucine": Leucine,
        "Valine": Valine,
        "Isoleucine": Isoleucine,
        "Phenylalanine": Phenylalanine,
        "Histidine": Histidine,
        "Lysine": Lysine,
        "Tryptophan": Tryptophan,
        "Methionine": Methionine,
        "Threonine": Threonine,
        "GlutamicAcid": GlutamicAcid,
        "Arginine": Arginine,
        "Glycine": Glycine,
        "Tyrosine": Tyrosine,
        "Alanine": Alanine,
        "AsparticAcid": AsparticAcid,
        "Asparagine": Asparagine,
        "Pyrrolysine": Pyrrolysine,
        "Proline": Proline,
        "Glutamine": Glutamine,
        "Serine": Serine,
        "Selenocysteine": Selenocysteine,
        "Cysteine": Cysteine,
        "sugar": sugar,
        "monosaccharide": monosaccharide,
        "oligosaccharide": oligosaccharide,
        "polysaccharide": polysaccharide,
        "resistantStarch": resistantStarch,
        "glycemicIndex": glycemicIndex,
        "vitaminA": vitaminA,
        "vitaminB1": vitaminB1,
        "vitaminB2": vitaminB2,
        "niacin": niacin,
        "pantothenAcid": pantothenAcid,
        "vitaminB6": vitaminB6,
        "biotin": biotin,
        "folate": folate,
        "vitaminB12": vitaminB12,
        "vitaminC": vitaminC,
        "vitaminD": vitaminD,
        "vitaminE": vitaminE,
        "vitaminK": vitaminK,
        "potassium": potassium,
        "sodium": sodium,
        "phosphorus": phosphorus,
        "calcium": calcium,
        "magnesium": magnesium,
        "iron": iron,
        "zinc": zinc,
        "manganese": manganese,
        "iodine": iodine,
        "selen": selen,
        "molybdenum": molybdenum,
        "chromium": chromium,
        "saturatedFatty": saturatedFatty,
        "sct": sct,
        "mct": mct,
        "monounsaturatedFatty": monounsaturatedFatty,
        "polyunsaturatedFatty": polyunsaturatedFatty,
        "omega3": omega3,
        "omega6": omega6,
        "omega7": omega7,
        "omega9": omega9,
        "waterSolubleDietaryFiber": waterSolubleDietaryFiber,
        "insolubleDietaryFiber": insolubleDietaryFiber
      };
}
