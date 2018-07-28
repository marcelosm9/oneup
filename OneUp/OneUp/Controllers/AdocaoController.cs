using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using OneUp.DAL;
using OneUp.Models;

namespace OneUp.Controllers
{
    public class AdocaoController : Controller
    {
        private OneUpContext db = new OneUpContext();

        // GET: Adocao
        public ActionResult Index()
        {
            var adocoes = db.Adocoes.Include(a => a.Animal).Include(a => a.Cliente);
            return View(adocoes.ToList());
        }

        // GET: Adocao/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Adocao adocao = db.Adocoes.Find(id);
            if (adocao == null)
            {
                return HttpNotFound();
            }
            return View(adocao);
        }

        // GET: Adocao/Create
        public ActionResult Create()
        {
            ViewBag.AnimalID = new SelectList(db.Animais, "AnimalID", "Nome");
            ViewBag.ClienteID = new SelectList(db.Clientes, "ClienteID", "Nome");
            return View();
        }

        // POST: Adocao/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "AdocaoID,ClienteID,AnimalID,DataAdocao")] Adocao adocao)
        {
            if (ModelState.IsValid)
            {
                db.Adocoes.Add(adocao);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.AnimalID = new SelectList(db.Animais, "AnimalID", "Nome", adocao.AnimalID);
            ViewBag.ClienteID = new SelectList(db.Clientes, "ClienteID", "Nome", adocao.ClienteID);
            return View(adocao);
        }

        // GET: Adocao/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Adocao adocao = db.Adocoes.Find(id);
            if (adocao == null)
            {
                return HttpNotFound();
            }
            ViewBag.AnimalID = new SelectList(db.Animais, "AnimalID", "Nome", adocao.AnimalID);
            ViewBag.ClienteID = new SelectList(db.Clientes, "ClienteID", "Nome", adocao.ClienteID);
            return View(adocao);
        }

        // POST: Adocao/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "AdocaoID,ClienteID,AnimalID,DataAdocao")] Adocao adocao)
        {
            if (ModelState.IsValid)
            {
                db.Entry(adocao).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.AnimalID = new SelectList(db.Animais, "AnimalID", "Nome", adocao.AnimalID);
            ViewBag.ClienteID = new SelectList(db.Clientes, "ClienteID", "Nome", adocao.ClienteID);
            return View(adocao);
        }

        // GET: Adocao/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Adocao adocao = db.Adocoes.Find(id);
            if (adocao == null)
            {
                return HttpNotFound();
            }
            return View(adocao);
        }

        // POST: Adocao/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Adocao adocao = db.Adocoes.Find(id);
            db.Adocoes.Remove(adocao);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
