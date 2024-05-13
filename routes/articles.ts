import Router, { RouterContext } from "koa-router";
import bodyParser from "koa-bodyparser";
import * as model from '../models/articles.model';
import { basicAuth } from '../controllers/auth';

const router: Router = new Router({prefix: '/api/v1/articles'});

const articles = [
  { title: 'hello article', fullText: 'some text here to fill the body' },
  { title: 'another article', fullText: 'again, another text here' },
  { title: 'coventry university', fullText: 'CU News' },
  { title: 'smart campus', fullText: 'Smart Campus here' },
  { title: 'new institute', fullText: 'HKIIT' }
]

const getAll = async (ctx: RouterContext, next: any) => {
  let articles = await model.getAll();
  if (articles.length) {
    ctx.body = articles;
  } else {
    ctx.body = {}
  }
  //ctx.body = articles;
  await next();
}

const getById = async (ctx: RouterContext, next: any) => {
  let id = ctx.params.id;
  let articles = await model.getById(id);
  if(articles.length){
    ctx.body = articles[0];
  } else {
    ctx.status = 404;
  }
  // if((id<articles.length+1)&& (id>0)){
  //   ctx.body = articles[id-1];
  // } else {
  //   ctx.status = 404;
  // }
  await next();
}

const createArticle = async (ctx: RouterContext, next: any) => {
  const body = ctx.request.body;
  let result = await model.add(body);
  if(result.status == 201){
    ctx.status = 201;
    ctx.body = body;
  } else {
    ctx.status = 500;
    ctx.body = {err: "insert data failed"};
  }
    // let { title, fullText }  = ctx.request.body as any;
    // let newArticle = {title: title, fullText: fullText };
    // articles.push(newArticle);
    // ctx.status = 201;
    // ctx.body = newArticle;
    await next();
}

const updateArticle = async (ctx: RouterContext, next: any) => {

}

const deleteArticle = async (ctx: RouterContext, next: any) => {

}

router.get('/', getAll);
router.post('/',basicAuth, bodyParser(), createArticle);
router.get('/:id([0-9]{1,})', getById);
router.put('/:id([0-9]{1,})', updateArticle);
router.delete('/:id([0-9]{1,})', deleteArticle);

export { router };