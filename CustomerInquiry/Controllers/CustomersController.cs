using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using CustomerInquiry.Models;

namespace CustomerInquiry.Controllers
{
    public class CustomersController : ApiController
    {
        private CustomerDatabaseEntities1 db = new CustomerDatabaseEntities1();

        // GET: api/Customers
        public IQueryable<Customer> GetCustomers()
        {
            return db.Customers;
        }

        // GET: api/Customers/5
        [ResponseType(typeof(Customer))]
        public IHttpActionResult GetCustomer(long id)
        {
            Customer customer = db.Customers.Find(id);
            if (customer == null)
            {
                return NotFound();
            }

            return Ok(customer);
        }

        // GET: api/Customers/5
        [ResponseType(typeof(Customer))]
        [Route("api/Customers/{email}")]
        public IHttpActionResult GetCustomerData(string email)
        {
            var customer = db.Customers.Local.Where(p => p.Email.Equals(email)).SingleOrDefault();

            if (customer == null)
            {
                customer = db.Customers.Where(p => p.Email.Equals(email)).SingleOrDefault();
            }
            
            if (customer == null)
            {
                return NotFound();
            }

            return Ok(customer);
        }

        // GET: api/Customers/5
        [ResponseType(typeof(Customer))]
        [Route("api/Customers/{id?}/{email?}")]
        public IHttpActionResult GetCustomerData(long id = 0, string email = null)
        {
            var customer = db.Customers.Local.Where(p => p.Email.Equals(email)).SingleOrDefault();

            if (customer == null)
            {
                customer = db.Customers.Where(p => (p.Email.Equals(email) && p.ID == id)).SingleOrDefault();
            }

            if (customer == null)
            {
                return NotFound();
            }

            return Ok(customer);
        }

        //// PUT: api/Customers/5
        //[ResponseType(typeof(void))]
        //public IHttpActionResult PutCustomer(long id, Customer customer)
        //{
        //    if (!ModelState.IsValid)
        //    {
        //        return BadRequest(ModelState);
        //    }

        //    if (id != customer.ID)
        //    {
        //        return BadRequest();
        //    }

        //    db.Entry(customer).State = EntityState.Modified;

        //    try
        //    {
        //        db.SaveChanges();
        //    }
        //    catch (DbUpdateConcurrencyException)
        //    {
        //        if (!CustomerExists(id))
        //        {
        //            return NotFound();
        //        }
        //        else
        //        {
        //            throw;
        //        }
        //    }

        //    return StatusCode(HttpStatusCode.NoContent);
        //}

        //// POST: api/Customers
        //[ResponseType(typeof(Customer))]
        //public IHttpActionResult PostCustomer(Customer customer)
        //{
        //    if (!ModelState.IsValid)
        //    {
        //        return BadRequest(ModelState);
        //    }

        //    db.Customers.Add(customer);
        //    db.SaveChanges();

        //    return CreatedAtRoute("DefaultApi", new { id = customer.ID }, customer);
        //}

        //// DELETE: api/Customers/5
        //[ResponseType(typeof(Customer))]
        //public IHttpActionResult DeleteCustomer(long id)
        //{
        //    Customer customer = db.Customers.Find(id);
        //    if (customer == null)
        //    {
        //        return NotFound();
        //    }

        //    db.Customers.Remove(customer);
        //    db.SaveChanges();

        //    return Ok(customer);
        //}

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool CustomerExists(long id)
        {
            return db.Customers.Count(e => e.ID == id) > 0;
        }
    }
}