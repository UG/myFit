const sqlite3 = require("sqlite3");
const { open } = require("sqlite");
const fs = require("fs");
const csv = require("csv");
const dbFile = "./Nutrition.db";
const srcFile = "./nutrition.csv";
const aminoFile = "./amino.csv";
const fatFile = "./fat.csv";
const carboFile = "./carbo.csv";
const fiberFile = "./fiber.csv";

const nutritionColumns = new Array(
  "food_id",
  "sodium",
  "potassium",
  "calcium",
  "magnesium",
  "phosphorus",
  "iron",
  "zinc",
  "copper",
  "manganese",
  "iodine",
  "selen",
  "chromium",
  "molybdenum",
  "vitamin_a",
  "alpha_carotene",
  "beta_carotene",
  "beta_cryptoxanthin",
  "vitamin_d",
  "alpha_tocopherol",
  "beta_tocopherol",
  "gamma_tocopherol",
  "delta_tocopherol",
  "vitamin_k",
  "vitamin_b1",
  "vitamin_b2",
  "niacin",
  "vitamin_b6",
  "vitamin_b12",
  "folate",
  "pantothen_acid",
  "biotin",
  "vitamin_c",
  "alcohol"
);

const aminoColumns = new Array(
  "isoleucine",
  "leucine",
  "lysine",
  "methionine",
  "cysteine",
  "phenylalanine",
  "tyrosine",
  "threonine",
  "tryptophan",
  "valine",
  "histidine",
  "arginine",
  "alanine",
  "aspartic_acid",
  "glutamic_acid",
  "glycine",
  "proline",
  "serine",
  "hydroxyproline",
  "ammonia"
);

const fatColumns = new Array(
  "saturated_fatty",
  "monounsaturated_fatty",
  "polyunsaturated_fatty",
  "omega3",
  "omega6",
  "omega9",
  "butyric",
  "hexanoic",
  "enanthic",
  "caprylic",
  "capric",
  "oleic",
  "linoleic",
  "cholesterol"
);

const carboColumns = new Array(
  "starch",
  "glucose",
  "fructose",
  "galactose",
  "sucrose",
  "maltose",
  "lactose",
  "trehalose",
  "sorbitol",
  "mannitol",
  "sugar"
);

const fiberColumns = new Array(
  "low_molecular",
  "water_soluble",
  "insoluble",
  "resistant_starch",
  "fiber_total real"
);

async function allowForeignKey(db) {
  return new Promise(async (resolve) => {
    const sql = `PRAGMA foreign_keys=true`;
    await db.exec(sql);
    return resolve("foreign key now available");
  });
}
async function createNutritionTable(db) {
  return new Promise(async (resolve) => {
    const sql = `
    create table if not exists Nutrition(
      food_id Text unique not null primary key,
      ash real, /* 灰分 */
      sodium real,  /* ナトリウム */
      potassium real, /*カリウム */
      calcium real, /*カルシウム*/
      magnesium real, /*カルシウム*/
      phosphorus real, /*カルシウム*/
      iron real, /*鉄*/
      zinc real, /*亜 鉛*/
      copper real, /*銅*/
      manganese real, /*マンガン*/
      iodine real, /*ヨウ素*/
      selen real, /*セレン*/
      chromium real, /*クロム*/
      molybdenum real, /*モリブデン*/
      vitamin_a real, /*レチノール*/
      alpha_carotene real, /*α|カロテン*/
      beta_carotene real, /*β|カロテン*/
      beta_cryptoxanthin real, /*β|クリプトキサンチン*/
      vitamin_d real, /*β|カロテン当量*/
      alpha_tocopherol real, /*α|トコフェロール*/
      beta_tocopherol real, /*β|トコフェロール*/
      gamma_tocopherol real, /*γ|トコフェロール*/
      delta_tocopherol real, /*δ|トコフェロール*/
      vitamin_k real, /*ビタミンK*/
      vitamin_b1 real, /*ビタミンＢ１*/
      vitamin_b2 real, /*ビタミン B２*/
      niacin real, /*ナイアシン*/
      vitamin_b6 real, /*ビタミンＢ６*/
      vitamin_b12 real, /*ビタミンＢ１２*/
      folate real, /*葉酸*/
      pantothen_acid real, /*パントテン酸*/
      biotin real, /*ビオチン*/
      vitamin_c real, /*ビタミンC*/
      alcohol real, /*アルコール*/
      isoleucine real,  /*イソロイシン*/
      leucine real,  /*ロイシン*/
      lysine real,  /*リシン*/
      methionine real,  /*メチオニン*/
      cysteine real, /*シスチン*/
      phenylalanine real,  /*フェニルアラニン*/
      tyrosine real, /*チロシン*/
      threonine real,  /*スレオニン*/
      tryptophan real,  /*トリプトファン*/
      valine real,  /*バリン*/
      histidine real,  /*ヒスチジン*/
      arginine real, /*アルギニン*/
      alanine real, /*アラニン*/
      aspartic_acid real, /*アスパラギン酸*/
      glutamic_acid real, /*グルタミン酸*/
      glycine real, /*グリシン*/
      proline real, /*プロリン*/
      serine real, /*セリン*/
      hydroxyproline real, /*ヒドロキシプロリン*/
      ammonia real, /*アンモニア*/
      saturated_fatty real, /*飽和脂肪酸*/
      monounsaturated_fatty real,/*一価不飽和脂肪酸*/
      polyunsaturated_fatty real,/*多価不飽和脂肪酸*/ 
      omega3 real, /*オメガ３*/
      omega6 real, /*オメガ６*/
      omega9 real, /*オメガ９*/
      butyric real, /*4:0酪酸*/
      hexanoic real,/*6:0ヘキサン酸*/
      enanthic real, /*7:0ヘプタン酸, エナント酸*/
      caprylic real, /*カプリル酸 8:0オクタン酸*/
      capric real, /*カプリン酸 10:0デカン酸*/
      oleic real, /*18:1 n-9オレイン酸*/
      linoleic real, /*18:2 n-6リノール酸*/
      cholesterol real, /*コレステロール*/
      starch real, /*デンプン*/
      glucose real, /*ぶどう糖*/
      fructose real, /*果糖*/
      galactose real, /*ガラクトース*/
      sucrose real, /*しょ糖*/
      maltose real, /*麦芽糖*/
      lactose real,/*乳頭*/
      trehalose real, /*トレハロース*/
      sorbitol real, /*ソルビトール*/
      mannitol real,/*マンニトール*/
      sugar real, /*糖質総量*/
      low_molecular real, /*低分子量水溶性食物繊維 オリゴ糖など*/
      water_soluble real, /*水溶性食物繊維*/
      insoluble real, /*不溶性食物繊維*/
      resistant_starch real, /*難消化性デンプン*/
      fiber_total real /*食物繊維総量*/
    );
    `;
    await db.exec(sql);
    return resolve("complete creating table");
  });
}

async function insertNutrition(db) {
  return new Promise(async (resolve) => {
    const parser = csv.parse(async (error, data) => {
      if (error) throw error;
      for (let a = 0; a < data.length; a++) {
        const elem = data[a];
        if (a > 2) {
          const insertArray = new Array(
            `'${elem[0]}'`, //food_id
            td(elem[19]), //ナトリウム
            td(elem[20]), //カリウム
            td(elem[21]), //カルシウム
            td(elem[22]), //マグネシウム
            td(elem[23]), //リン
            td(elem[24]), //鉄
            td(elem[25]), //亜鉛
            td(elem[26]), //鋼
            td(elem[27]), //マンガン
            td(elem[28]), //ヨウ素
            td(elem[29]), //セレン
            td(elem[30]), //クロム
            td(elem[31]), //モリブデン
            td(elem[32]), //レチノール
            td(elem[33]), //α カロテン
            td(elem[34]), //β カロテン
            td(elem[35]), //クリプトキサンチン
            //36 β|カロテン当量
            //37 レチノール活性当量
            td(elem[38]), //ビタミンD
            td(elem[39]), //αトコフェロール
            td(elem[40]), //βトコフェロール
            td(elem[41]), //γトコフェロール
            td(elem[42]), //δトコフェロール
            td(elem[43]), //ビタミンK
            td(elem[44]), //ビタミンB1
            td(elem[45]), //ビタミンB2
            td(elem[46]), //ナイアシン
            //47 ナイアシン当量
            td(elem[48]), //ビタミンB6
            td(elem[49]), //ビタミンB12
            td(elem[50]), //葉酸
            td(elem[51]), //バントテン酸
            td(elem[52]), //ビオチン
            td(elem[53]), //ビタミンC
            td(elem[54]) //アルコール
          );
          const upsert = `insert into Nutrition(
            ${nutritionColumns.join(",")}
          ) values(${insertArray.join(",")}) on conflict(food_id) do nothing`;
          //console.log(upsert);
          const result = await db.run(upsert);
        }
      }
      return resolve("nutrition upsert complete");
    });
    fs.createReadStream(srcFile).pipe(parser);
  });
}

async function updateAmino(db) {
  return new Promise(async (resolve) => {
    const parser = csv.parse(async (error, data) => {
      if (error) throw error;
      for (let a = 0; a < data.length; a++) {
        const elem = data[a];
        if (a > 2) {
          const insertArray = new Array(
            td(elem[6]), //イソロイシン
            td(elem[7]), //ロイシン
            td(elem[8]), //リシン
            td(elem[9]), //メチオニン
            td(elem[10]), //シスチン
            // 11 含硫アミノ酸合計
            td(elem[12]), //フェニルアラニン
            td(elem[13]), //チロシン
            //芳香族アミノ酸合計
            td(elem[15]), //スレオニン
            td(elem[16]), //トリプトファン
            td(elem[17]), //バリン
            td(elem[18]), //ヒスチジン
            td(elem[19]), //アルギニン
            td(elem[20]), //アルギニン
            td(elem[21]), //アスパラギン酸
            td(elem[22]), //グルタミン酸
            td(elem[23]), //グリシン
            td(elem[24]), //プロリン
            td(elem[25]), //セリン
            td(elem[26]), //ヒドロキシプロリン
            //27 アミノ酸組成計
            td(elem[28]) //アンモニア
            //29 剰余アンモニア
          );
          let valueSet = "";
          for (let b = 0; b < aminoColumns.length; b++) {
            valueSet += `${aminoColumns[b]}=${insertArray[b]},`;
          }
          valueSet = valueSet.slice(0, -1);
          const update = `update nutrition set ${valueSet} where food_id='${elem[0]}';`;
          //console.log(update);
          const result = await db.run(update);
          //console.log(result);
        }
      }
    });
    fs.createReadStream(aminoFile).pipe(parser);
    resolve("amino update complete");
  });
}

async function updateFat(db) {
  return new Promise(async (resolve) => {
    const parser = csv.parse(async (error, data) => {
      if (error) throw error;
      for (let a = 0; a < data.length; a++) {
        const elem = data[a];
        if (a > 2) {
          const insertArray = new Array();
        }
      }
    });
    fs.createReadStream(fatFile).pipe(parser);
  });
}

async function updateCarbo(db) {
  return new Promise(async (resolve) => {
    const parser = csv.parse(async (error, data) => {
      if (error) throw error;
      for (let a = 0; a < data.length; a++) {
        const elem = data[a];
        if (a > 2) {
          const insertArray = new Array();
        }
      }
    });
    fs.createReadStream(carboFile).pipe(parser);
  });
}

async function updateFiber(db) {
  return new Promise(async (resolve) => {
    const parser = csv.parse(async (error, data) => {
      if (error) throw error;
      for (let a = 0; a < data.length; a++) {
        const elem = data[a];
        if (a > 2) {
          const insertArray = new Array();
        }
      }
    });
    fs.createReadStream(fiberFile).pipe(parser);
  });
}

async function countNutritionRows(db) {
  return new Promise(async (resolve) => {
    const result = await db.get(`select count(food_id) from Nutrition`);
    return resolve(result);
  });
}

function td(src) {
  const str = src.toString().replace(/-|Tr/i, "0.0");
  const r = parseFloat(str);
  return r.toString();
}

const createNutrition = async () => {
  const db = await open({
    filename: dbFile,
    driver: sqlite3.Database,
  });
  console.log(await allowForeignKey(db));
  console.log(await createNutritionTable(db));
  console.log(await insertNutrition(db));
  console.log(await updateAmino(db));
  //console.log(await updateFat(db));
  //console.log(await updateCarbo(db));
  //console.log(await updateFiber(db));
  console.log(await countNutritionRows(db));
};

createNutrition();
