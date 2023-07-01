/* Accounts Payable Database */
/*  A query to display the total balance due using window functions */
select vendor_id, balance_due,
sum(balance_due) over (partition by vendor_id order by balance_due) as total_balance_due_vendor,
sum(balance_due) over () as grand_total
from
(select vendor_id, invoice_total-payment_total-credit_total as balance_due from invoices)s
where balance_due>0;


/* Calculating 3-day moving average of the invoice totals */
select invoice_date, invoice_total, 
  avg(invoice_total) OVER(ORDER BY invoice_Date
     ROWS BETWEEN 2 PRECEDING AND CURRENT ROW )
     as moving_average
from invoices;




