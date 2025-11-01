# Write your MySQL query statement below
select w.id from weather as w where w.temperature > (select w2.temperature from weather as w2 where datediff(date(w.recorddate), date(w2.recorddate))=1);
