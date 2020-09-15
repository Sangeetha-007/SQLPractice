Select A.totalamt from plandata_QNXT_KS.dbo.claim A join Plandata_QNXT_KS.dbo.BenefitPlan B
ON A.planid=B.planid
Where A.status='PAID' OR A.status='DENIED' AND
A.createdate<'2020-02-01' AND A.createdate BETWEEN A.startdate AND A.enddate
AND B.programid='DVZHPQ000000057'
Order by A.totalamt desc;
