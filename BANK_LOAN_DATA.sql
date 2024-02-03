---- A. BANK LOAN ANALYSIS----
use portpolio
select * from bank_loan

---Total Loan Applications
select count(id) total_loan_application  from bank_loan

----MTD Loan Applications
select count(id) MTD_LOAN_APPLICATION from bank_loan
where month(issue_date) = 12 and year(issue_date) = 2021

----PMTD Loan Applications
select count(*) PMTD_LOAN_APPLICATION from bank_loan
where month(issue_date) = 11 and year(issue_date) = 2021

----Total Funded Amount
select sum(loan_amount) total_funded_amount from bank_loan

-----MTD Total Funded Amount
select sum(loan_amount) MTD_Funded_AMount from bank_loan
where month(issue_date) = 12 and year(issue_date) = 2021

----PMTD Total Funded Amount
select sum(loan_amount) MTD_Funded_AMount from bank_loan
where month(issue_date) = 11 and year(issue_date) = 2021

---Total Amount Received
select sum(total_payment) Total_Amount_Received
from bank_loan

----MTD Total Amount Received
select sum(total_payment) total_amount_collect
from bank_loan where month(issue_date) = 12

----PMTD Total Amount Received
select sum(total_payment) total_amount_collect
from bank_loan where month(issue_date) = 11

----Average Interest Rate
select round(avg(int_rate),4) * 100 avg_int from bank_loan

----AVG DTI 
select round(avg(dti),4)*100 avg_dti from bank_loan

----MTD_DTI
select  round(avg(dti),4)*100 avg_dti from bank_loan
where month(issue_date) = 12 

-----GOOD LOAN ISSUED

select
(count(case when loan_status = 'Fully Paid' or loan_status = 'Current' then id end ) * 100)
/count(id) Good_loan_Percentage from bank_loan

---Good_Loan_application 
select count(id) Good_loan from bank_loan where loan_status = 'Fully Paid' or loan_status = 'current'

---Good_loan Funded amount
select sum(loan_amount) Good_loan from bank_loan where loan_status = 'Fully Paid' or loan_status = 'current'

---Bad loan Application 
select count(id) bad_loan_application  from bank_loan where loan_status = 'Charged off'

---bad loan amount
select sum(total_payment) Good_loan from bank_loan where loan_status = 'Charged off'


---loan status 

SELECT
        loan_status,
        COUNT(id) AS LoanCount,
        SUM(total_payment) AS Total_Amount_Received,
        SUM(loan_amount) AS Total_Funded_Amount,
        AVG(int_rate * 100) AS Interest_Rate,
        AVG(dti * 100) AS DTI
    FROM
        bank_loan
    GROUP BY
        loan_status


 ---MTD Loan Status
SELECT 
	loan_status, 
	SUM(total_payment) AS MTD_Total_Amount_Received, 
	SUM(loan_amount) AS MTD_Total_Funded_Amount 
FROM bank_loan
WHERE MONTH(issue_date) = 12 
GROUP BY loan_status

---B. BANK LOAN REPORT | OVERVIEW

select month(issue_date),datename(month,issue_date),count(id) total_loan_application,
sum(loan_amount) total_amount,
sum(total_payment) total_payment
from bank_loan
group by month(issue_date) , datename(month,issue_date)
order by 1 

---STATE
select address_state,count(id) total_loan_application,
sum(loan_amount) total_amount,
sum(total_payment) total_payment
from bank_loan
group by address_state
order by 1 

---term
select term,count(id) total_loan_application,
sum(loan_amount) total_amount,
sum(total_payment) total_payment
from bank_loanselect purpose,count(id) total_loan_application,
sum(loan_amount) total_amount,
from bank_loan
group by purpose
group by term

----employee_leanth
select emp_length,count(id) total_loan_application,
sum(loan_amount) total_amount,
sum(total_payment) total_payment
from bank_loan
group by emp_length

---purpose
select purpose,count(id) total_loan_application,
sum(loan_amount) total_amount,
sum(total_payment) total_payment
from bank_loan
group by purpose

---Home Ownership
select home_ownership,count(id) total_loan_application,
sum(loan_amount) total_amount,
sum(total_payment) total_payment
from bank_loan
group by home_ownership