ese <-
function(x,y,index,doparallel=FALSE)
  {
    #Output for ESE method as defined theoretically in:
    #
    # [1]Demetris T. Christopoulos, Developing methods for identifying the inflection point of a convex/ concave curve. 
    # arXiv:1206.5478v2 [math.NA], https://arxiv.org/pdf/1206.5478v2.pdf , 2014 
    # [2]Demetris T. Christopoulos, On the efficient identification of an inflection point,
    # International Journal of Mathematics and Scientific Computing,(ISSN: 2231-5330), vol. 6(1),
    # https://www.researchgate.net/publication/304557351 , 2016
    #
    #Contact Emails: dchristop@econ.uoa.gr or dem.christop@gmail.com
    #
    #Use doparallel=TRUE only for large data sets (n>20000)
    #
    n=length(x);
    #For convex/concave data (upward sigmoid) give index=0
    #For concave/convex data (downward sigmoid) give index=1
    if(index==1){y=-y}
    #
    if(n>=4){
      if(doparallel){
        #
         ncores=parallel::detectCores();         
         cl <- parallel::makeCluster(ncores);   
         parallel::clusterExport(cl, c("findipl","lin2"))         
         slsr=matrix(parallel::parSapply(cl=cl,2:(n-1),function(i,x,y){c(findipl(x,y,i)[3:4])},x,y),ncol=2,byrow = T);
         parallel::stopCluster(cl);
         #
       }else{
         #
         slsr=matrix(sapply(2:(n-1),function(i,x,y){c(findipl(x,y,i)[3:4])},x,y),ncol=2,byrow = T);
         #
         }
      #
      jl=which.min(slsr[,1])+1;jr=which.max(slsr[,2])+1;xl=x[jl];xr=x[jr];
      ifelse((jl-jr>=2)==TRUE,{xs<-.5*(xl+xr)},{xs<-NaN})
    }else{
      jl<-NaN;jr<-NaN;xs<-NaN
      } 
    #
    out=matrix(c(jr,jl,xs),nrow=1,ncol=3,byrow=TRUE);rownames(out)="ESE";colnames(out)=c("j1","j2","chi");
    return(out)
  }
