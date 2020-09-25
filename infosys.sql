Select A.totalamt from plandata_QNXT_KS.dbo.claim A join Plandata_QNXT_KS.dbo.BenefitPlan B
ON A.planid=B.planid
Where A.status='PAID' OR A.status='DENIED' AND
A.createdate<'2020-02-01' AND A.createdate BETWEEN A.startdate AND A.enddate
AND B.programid='DVZHPQ000000057'
Order by A.totalamt desc;


update I
set I(clm.2310CP_N301_AddressLine1)=Substring(LTRIM(RTRIM(I(clm.[2310CP_N301_AddressLine1]))),1, 55) FROM AD.[20P_Record] clm I;
                                                                 
                                                                 

update I
set I.[2300I_HI11-05_ValueCodeAmount_1] = Replace([2300I_HI11-05_ValueCodeAmount_1], '.','')
Case When LEN(I.[2300I_HI11-05_ValueCodeAmount_1])=1 THEN Concat('000', I.[2300I_HI11-05_ValueCodeAmount_1], I.[2300I_HI11-05_ValueCodeAmount_1] )
END
From [AD].[20I_Record] I inner join AD.QNXTClaimvalue clm on I.claimId = clm.claimId
Where I.[2300I_HI11-01_ValueCodeQualifer_2] = 'BE' AND I.[2300I_HI01-02_ValueCode_1]='24'AND LEN(I.[2300I_HI11-05_ValueCodeAmount_1])<5;
                                                                 
