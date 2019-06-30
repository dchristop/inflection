findipiterplot <-
function(x,y,index,plots=TRUE,ci=FALSE,doparallel=FALSE){
BESE<-c();
BEDE<-c();
xpes<-c();ypes<-c();npes<-c();
xped<-c();yped<-c();nped<-c();
A<-ese(x,y,index,doparallel);
B<-ede(x,y,index);
x1<-x;y1<-y;
x2<-x;y2<-y;
BESE<-c(BESE,A[1,3])
BEDE<-c(BEDE,B[1,3])
#First run:
out1<-matrix(c(A,B),nrow=2,ncol=3,byrow=TRUE,dimnames=list(c("ESE","EDE"),c("i1","i2","chi_S,D")));
#ESE iterations:
#
i<-0
while (!(is.nan(A[1,3])))  
{
  if (A[1,2]>A[1,1]+3)
  {
i<-i+1
xpes<-c(xpes,x1);ypes<-c(ypes,y1);npes<-c(npes,length(x1));
x1<-x1[A[1,1]:A[1,2]]
y1<-y1[A[1,1]:A[1,2]]
A<-ese(x1,y1,index,doparallel)
if (A[1,2]>A[1,1]+3)
{
  BESE<-c(BESE,A[1,3]);
  
}  
  }
  else
break
}
#
#EDE iterations:
#
j<-0
while (!(is.nan(B[1,3])))
{
  if (B[1,2]>B[1,1]+3)
  {
j<-j+1
xped<-c(xped,x2);yped<-c(yped,y2);nped<-c(nped,length(x2));
x2<-x2[B[1,1]:B[1,2]]
y2<-y2[B[1,1]:B[1,2]]
B<-ede(x2,y2,index)
if (B[1,2]>B[1,1]+3)
{
  if(!(is.nan(B[1,3])))
  {
    BEDE<-c(BEDE,B[1,3]); 
  }
  else
break
}  
  }
  else
break
}
#
#Create output environment...
#
out=new.env()
out$first=out1
out$BESE=rbind(BESE);rownames(out$BESE)=c("ESE iterations");colnames(out$BESE)=1:length(BESE);
out$BEDE=rbind(BEDE);rownames(out$BEDE)=c("EDE iterations");colnames(out$BEDE)=1:length(BEDE);
#
#Iterative run of methods - 95% confidence intervals:
#
if(ci)
{
  #do ci if length(result)>1
  if(length(BESE)>1){
    amesm=mean(BESE,na.rm = TRUE);
    asesm=sd(BESE,na.rm = TRUE);
    aeresm=qt(0.975,df=length(BESE)-1)*asesm/sqrt(length(BESE));
    alciesm=amesm-aeresm;arciesm=amesm+aeresm;
    out$aesmout=cbind(amesm,asesm,alciesm,arciesm)
    colnames(out$aesmout)=c("mean","sdev","95%(l)","95%(r)")
    rownames(out$aesmout)=c("ESE method")
  }
  #do ci if length(result)>1
  if(length(BEDE)>1){
    amedm=mean(BEDE,na.rm = TRUE);
    asedm=sd(BEDE,na.rm = TRUE);
    aeredm=qt(0.975,df=length(BEDE)-1)*asedm/sqrt(length(BEDE))
    alciedm=amedm-aeredm;arciedm=amedm+aeredm;
    out$aedmout=cbind(amedm,asedm,alciedm,arciedm)
    colnames(out$aedmout)=c("mean","sdev","95%(l)","95%(r)")
    rownames(out$aedmout)=c("EDE method")
  }
}
#Create xy-subsets of each iteration...
ns=cbind(npes);nd=cbind(nped);nps<-length(npes);npd<-length(nped);
xsm<-cbind(xpes);ysm<-cbind(ypes);xdm<-cbind(xped);ydm<-cbind(yped);
#Plots if plots=TRUE
#
if(plots){
  #
  if(nps>0){
    dev.new()
    par(mfrow=c(2,ceiling(nps/2)))
    n0<-0;
    dfs<-c();
    # cols=colorRampPalette(c("blue", "red"))(nps); 
    cols=colorRampPalette(c("blue", "green"))(nps); 
    for (i in 1:nps)
    {
      x1<-xsm[(n0+1):(n0+ns[1])];y1<-ysm[(n0+1):(n0+ns[1])];
      x<-x1[!is.na(x1)];y<-y1[!is.na(y1)];dfs[[i]]=as.data.frame(cbind(x,y));
      plot(x,y,xlab=paste("x",i),ylab=paste("y",i),col=cols[i],pch=19)
      abline(v=BESE[i],lty=2,col='blue')
      title(paste("ESE iter",i),sub=paste("ip=",BESE[i]))
      n0<-n0+ns[i];
    }
    #store xy-subsets
    out$xysl=dfs;
  }
  # 
  #
  if(npd>0){
    dev.new()
    par(mfrow=c(2,ceiling(npd/2)))
    n0<-0;
    dfd<-c();
    cols=colorRampPalette(c("blue", "red"))(npd); 
    for (i in 1:npd)
    {
      x1<-xdm[(n0+1):(n0+nd[1])];y1<-ydm[(n0+1):(n0+nd[1])];
      x<-x1[!is.na(x1)];y<-y1[!is.na(y1)];dfd[[i]]=as.data.frame(cbind(x,y));
      plot(x,y,xlab=paste("x",i),ylab=paste("y",i),col=cols[i],pch=19)
      abline(v=BEDE[i],lty=2,col='red')
      title(paste("EDE iter",i),sub=paste("ip=",BEDE[i]))
      n0<-n0+nd[i];
    }
    #store xy-subsets
    out$xydl=dfd;
  }
  #
}else{
  if(nps>0)
   { 
    n0<-0;
    dfs<-c();
    for (i in 1:nps)
    {
      x1<-xsm[(n0+1):(n0+ns[1])];y1<-ysm[(n0+1):(n0+ns[1])];
      x<-x1[!is.na(x1)];y<-y1[!is.na(y1)];dfs[[i]]=as.data.frame(cbind(x,y));
      n0<-n0+ns[i];
    }
    #store xy-subsets
    out$xysl=dfs;
  }
  #
  if(npd>0)
  {  
    n0<-0;
    dfd<-list();
    for (i in 1:npd)
    {
      x1<-xdm[(n0+1):(n0+nd[1])];y1<-ydm[(n0+1):(n0+nd[1])];
      x<-x1[!is.na(x1)];y<-y1[!is.na(y1)];dfd[[i]]=as.data.frame(cbind(x,y));
      n0<-n0+nd[i];
    }
    #store xy-subsets
    out$xydl=dfd;
  }
}
#
#Return out
return(out)
}
