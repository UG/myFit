const sqlite3 = require("sqlite3");
const fs = require("fs");
const csv = require("csv");
const db = new sqlite3.Database("./Nutrition.db");
const file = "./nutrition.csv";

const createDB = async () => {
  const createTable = `
create table if not exists Food(
  id Text unique not null primary key,
  name Text,
  calories real,
  protein real,
  fat real,
  carbo real,
  fiber real
)
`;
  db.run(createTable);

  const parser = csv.parse((error, data) => {
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
        //console.log(upsert);
        db.run(upsert);
      }
    }
    db.get(`select count(id) from Food`, (err, row) => {
      console.log(row);
    });
  });
  fs.createReadStream(file).pipe(parser);
  console.log("complete");
};

createDB();
