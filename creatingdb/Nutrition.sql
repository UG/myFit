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