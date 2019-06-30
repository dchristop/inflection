bese <-
function(x,y,index,doparallel=FALSE)
  {
    #Output for BESE method as defined theoretically in:
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
    ESE<-c();BESE<-c();a<-c(x[1]);b<-c(x[length(x)]);nped<-c(length(x));x2<-x;y2<-y;
    A=ese(x,y,index,doparallel);ESE<-c(ESE,A[1,3]);BESE<-c(BESE,A[1,3]);iplast=A[1,3];
    #
    #ESE iterations:
    #
    j<-0
    while (!(is.nan(A[1,3])))
    {
      ifelse (A[1,2]>=A[1,1]+3,
              {
                j<-j+1;
                x2<-x2[A[1,1]:A[1,2]];y2<-y2[A[1,1]:A[1,2]];A<-ese(x2,y2,index);
                ifelse(!(is.nan(A[1,3])),
                       {a=c(a,x2[A[1,1]]);b=c(b,x2[A[1,2]]);nped<-c(nped,length(x2));ESE<-c(ESE,A[1,3]);BESE<-c(BESE,A[1,3]);iplast=A[1,3];}
                       ,
                       {break})
              }
              ,
              {break}
      )
    }
    #
    #Set output...
    #
    iters=as.data.frame(cbind(nped,a,b,BESE));colnames(iters)=c("n","a","b","ESE");rownames(iters)=1:length(nped);
    out=list();out[["iplast"]]=iplast;out[["iters"]]=iters;
    return(out)
  }
