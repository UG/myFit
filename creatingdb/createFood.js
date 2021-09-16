const sqlite3 = require("sqlite3");
const { open } = require("sqlite");
const fs = require("fs");
const csv = require("csv");
const dbFile = "./Nutrition.db";
const srcFile = "./nutrition.csv";

async function createFoodTable(db) {
  return new Promise(async (resolve) => {
    const sql = `
    create table if not exists Food(
    id Text unique not null primary key,
    name Text,
    calories real,
    protein real,
    fat real,
    carbo real,
    fiber real
    );`;
    await db.exec(sql);
    return resolve("complete creating table");
  });
}

async function insertFood(db) {
  return new Promise(async (resolve) => {
    const parser = csv.parse(async (error, data) => {
      for (let a = 0; a < data.length; a++) {
        const elem = data[a];
        if (a > 2) {
          const insertArray = new Array(
            `'${elem[0]}'`,
            `'${elem[2]}'`,
            parseFloat(elem[4].toString().replace(/-|Tr/i, "0.0")),
            parseFloat(elem[7].toString().replace(/-|Tr/i, "0.0")),
            parseFloat(elem[10].toString().replace(/-|Tr/i, "0.0")),
            parseFloat(elem[11].toString().replace(/-|Tr/i, "0.0")),
            parseFloat(elem[14].toString().replace(/-|Tr/i, "0.0"))
          );
          const upsert = `insert into Food(id,name,calories,protein,fat,carbo,fiber) values(${insertArray.join(
            ","
          )}) on conflict(id) do nothing`;
          await db.run(upsert);
        }
      }
      return resolve("insert complete");
    });
    fs.createReadStream(srcFile).pipe(parser);
  });
}

async function countFoodRows(db) {
  return new Promise(async (resolve) => {
    const result = await db.get(`select count(id) from Food`);
    return resolve(result);
  });
}

const createFood = async () => {
  const db = await open({
    filename: dbFile,
    driver: sqlite3.Database,
  });
  console.log(await createFoodTable(db));
  console.log(await insertFood(db));
  console.log(await countFoodRows(db));
};

createFood();
