GetCount<-function(Tare,Current_Vly)
{
	
	M1=Tare
	prc_1=.25*M1
	rmax_1=M1+prc_1
	rmin_1=M1-prc_1
	sd_1=(rmax_1-rmin_1)/4
	
	M2=Tare-sd_1
	prc_2=.25*M2
	rmax_2=M2+prc_2
	rmin_2=M2-prc_2
	sd_2=(rmax_2-rmin_2)/4

	M3=Tare+sd_1
	prc_3=.25*M2
	rmax_3=M2+prc_3
	rmin_3=M2-prc_3
	sd_3=(rmax_3-rmin_3)/4
	
	D1=rnorm(1000,M1,sd_1)
	D2=rnorm(1000,M2,sd_2)
	D3=rnorm(1000,M3,sd_3)

	
	tst_1=c()
	tst_2=c()
	tst_3=c()
	Vpc=.05*Current_Vly

	for (i in 1:1000)
		{
			ins=Current_Vly
			tmp1=0
			tmp2=0
			tmp3=0
			flag1=FALSE
			flag2=FALSE
			flag3=FALSE
			while(flag1==FALSE)
				{
					tmp1=tmp1+sample(D1,1,replace=TRUE)
					if (tmp1 >= (ins - Vpc) & tmp1 <= (ins + Vpc)){flag1=TRUE}
					if (tmp1 > (ins + Vpc)){flag1=TRUE}
				}
			tst_1[i]=tmp1
			while(flag2==FALSE)
				{
					tmp2=tmp2+sample(D2,1,replace=TRUE)
					if (tmp2 >= (ins - Vpc) & tmp2 <= (ins + Vpc)){flag2=TRUE}
					if (tmp2 > (ins + Vpc)){flag2=TRUE}
				}
			tst_2[i]=tmp2
			while(flag3==FALSE)
				{
					tmp3=tmp3+sample(D3,1,replace=TRUE)
					if (tmp3 >= (ins - Vpc) & tmp3 <= (ins + Vpc)){flag3=TRUE}
					if (tmp3 > (ins + Vpc)){flag3=TRUE}
				}
			tst_3[i]=tmp3
		}

	R1=round(tst_1,0)
	R2=round(tst_2,0)
	R3=round(tst_3,0)
plot(density(tst_1),type='l')
lines(density(tst_2),col='red')
lines(density(tst_3),col='blue')
abline(v=round(ins,0),col='green')
	E1=sum(abs(round(ins,0)-R1))
	E2=sum(abs(round(ins,0)-R2))
	E3=sum(abs(round(ins,0)-R3))
	EE=c(E1,E2,E3)
print("Errors")
print(EE)
	WM=which(EE==min(EE))[1]
	COF=c(M1,M2,M3)[WM]
print("All Values")
print(c(M1,M2,M3))
print("Which Is Min")
print(WM)
print("COF:")
print(COF)
	return(round((ins/COF),0))
	
}

