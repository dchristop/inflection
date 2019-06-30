bede <-
function(x,y,index)
  {
    #Output for BEDE method as defined theoretically in:
    #
    # [1]Demetris T. Christopoulos, Developing methods for identifying the inflection point of a convex/ concave curve. 
    # arXiv:1206.5478v2 [math.NA], https://arxiv.org/pdf/1206.5478v2.pdf , 2014 
    # [2]Demetris T. Christopoulos, On the efficient identification of an inflection point,
    # International Journal of Mathematics and Scientific Computing,(ISSN: 2231-5330), vol. 6(1),
    # https://www.researchgate.net/publication/304557351 , 2016
    #
    #Contact Emails: dchristop@econ.uoa.gr or dem.christop@gmail.com
    #
    EDE<-c();BEDE<-c();a<-c(x[1]);b<-c(x[length(x)]);nped<-c(length(x));x2<-x;y2<-y;
    B=ede(x,y,index);EDE<-c(EDE,B[1,3]);BEDE<-c(BEDE,B[1,3]);iplast=B[1,3];
    #
    #EDE iterations:
    #
    j<-0
    while (!(is.nan(B[1,3])))
    {
      ifelse (B[1,2]>=B[1,1]+3,
      {
        j<-j+1;
        x2<-x2[B[1,1]:B[1,2]];y2<-y2[B[1,1]:B[1,2]];B<-ede(x2,y2,index);#print(B);
        ifelse(!(is.nan(B[1,3])),
               {a=c(a,x2[B[1,1]]);b=c(b,x2[B[1,2]]);nped<-c(nped,length(x2));EDE<-c(EDE,B[1,3]);BEDE<-c(BEDE,B[1,3]);iplast=B[1,3];}
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
    iters=as.data.frame(cbind(nped,a,b,BEDE));colnames(iters)=c("n","a","b","EDE");rownames(iters)=1:length(nped);
    out=list();
    out[["iplast"]]=iplast;
    out[["iters"]]=iters;
    return(out)
  }
