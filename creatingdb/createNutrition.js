const sqlite3 = require("sqlite3");
const { open } = require("sqlite");
const fs = require("fs");
const csv = require("csv");
const { resolve } = require("path");
const dbFile = "./Nutrition.db";
const srcFile = "./nutrition.csv";

const columns = new Array(
  "food_id",
  "sodium",
  "potassium",
  "calcium",
  "magnesium",
  "phosphorus",
  "iron",
  "zinc",
  "copper", //
  "manganese",
  "iodine",
  "selen",
  "chromium",
  "molybdenum",
  "vitamin_a", //レチノール
  "alpha_carotene",
  "beta_carotene", //ベータカロテン
  "beta_cryptoxanthin", //クリプトキサチン
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
      sodium real,
      potassium real,
      calcium real,
      magnesium real,
      phosphorus real,
      iron real,
      zinc real,
      copper real,
      manganese real, 
      iodine real, 
      selen real,
      chromium real,
      molybdenum real,
      vitamin_a real,
      alpha_carotene real,
      beta_carotene real,
      beta_cryptoxanthin real,
      vitamin_d real,
      alpha_tocopherol real,
      beta_tocopherol real,
      gamma_tocopherol real,
      delta_tocopherol real,
      vitamin_k real,
      vitamin_b1 real,
      vitamin_b2 real,
      niacin real,
      vitamin_b6 real,
      vitamin_b12 real,
      folate real,
      pantothen_acid real,
      biotin real,
      vitamin_c real,
      alcohol real,
      leucine real, 
      valine real, 
      isoleucine real, 
      phenylalanine real, 
      histidine real, 
      lysine real, 
      tryptophan real, 
      methionine real, 
      threonine real, 
      glutamic_acid real,
      arginine real,
      glycine real,
      tyrosine real,
      alanine real,
      aspartic_acid real,
      asparagine real,
      pyrrolysine real,
      proline real,
      glutamine real,
      serine real,
      selenocysteine real,
      cysteine real,
      sugar real,
      monosaccharide real, 
      oligosaccharide real, 
      polysaccharide real, 
      resistant_starch real,
      glycemic_index real,
      vitamin_e real,
      saturated_fatty real, 
      sct real, 
      mct real, 
      monounsaturated_fatty real, 
      polyunsaturated_fatty real, 
      omega3 real,
      omega6 real,
      omega7 real,
      omega9 real,
      water_soluble_dietary_fiber real,
      insoluble_dietary_fiber real
    );`;
    await db.exec(sql);
    return resolve("complete creating table");
  });
}

async function insertNutrition(db) {
  return new Promise(async (resolve) => {
    const parser = csv.parse(async (error, data) => {
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
            ${columns.join(",")}
          ) values(${insertArray.join(",")}) on conflict(food_id) do nothing`;
          //console.log(upsert);
          const result = await db.run(upsert);
        }
      }
      return resolve("insert complete");
    });
    fs.createReadStream(srcFile).pipe(parser);
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
  console.log(await countNutritionRows(db));
};

createNutrition();
