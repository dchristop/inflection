ede <-
function(x,y,index)
  {
    #Output for EDE method as defined theoretically in:
    #
    # [1]Demetris T. Christopoulos, Developing methods for identifying the inflection point of a convex/ concave curve. 
    # arXiv:1206.5478v2 [math.NA], https://arxiv.org/pdf/1206.5478v2.pdf , 2014 
    # [2]Demetris T. Christopoulos, On the efficient identification of an inflection point,
    # International Journal of Mathematics and Scientific Computing,(ISSN: 2231-5330), vol. 6(1),
    # https://www.researchgate.net/publication/304557351 , 2016
    #
    #Contact Emails: dchristop@econ.uoa.gr or dem.christop@gmail.com
    #
    n=length(x);
    #For convex/concave data (upward sigmoid) give index=0
    #For concave/convex data (downward sigmoid) give index=1
    if(index==1){y=-y}
    #
    ifelse(n>=4,
           {
             LF=y-lin2(x[1],y[1],x[n],y[n],x);jf1=which.min(LF);xf1=x[jf1];jf2=which.max(LF);xf2=x[jf2];
             ifelse(jf2<jf1,{xfx<-NaN},{xfx<-.5*(xf1+xf2)});
           }  ,
           {jf1=NaN;jf2=NaN;xfx=NaN}
    )
    #
    out=matrix(c(jf1,jf2,xfx),nrow=1,ncol=3,byrow=TRUE);rownames(out)="EDE";colnames(out)=c("j1","j2","chi");
    return(out)
  }