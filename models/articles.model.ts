import * as db from '../helpers/database';

export const getById = async(id: any) => {
    let query = "select * from articles where ID=?";
    let values = [id];
    let data = await db.run_query(query, values);
    return data;
}

export const getAll = async() => {
    let query = "select * from articles";
    let data = await db.run_query(query, null);
    return data;
}

export const add = async(article: any) => {
  //convert json to sql
  let keys = Object.keys(article);      // convert all json keys to an array
  let values = Object.values(article);  // convert all json values to an array, this will pass directly to the helper
  let key = keys.join(',');             // convert all keys in the array to a string splitted by ","
  let param = '';
  for(let i: number=0; i<values.length; i++){ param += '?,'}   
  param = param.slice(0,-1);
  let query = `INSERT INTO articles (${key}) VALUES (${param})`;
  // e.g. insert into articles (title, allText) values ?, ?
  //convert json to sql end
  try {
    await db.run_insert(query, values);
    return {status: 201}
  } catch (err: any) {
    return err
  }
}