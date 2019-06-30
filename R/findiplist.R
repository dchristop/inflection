findiplist <-
function(x,y,index,doparallel=FALSE)
{
  #Output for ESE, EDE methods as defined theoretically in:
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
  n=length(x)
  #For convex/concave data (upward sigmoid) give index=0
  #For concave/convex data (downward sigmoid) give index=1
  if(index==1){y=-y}
  #
  ifelse(n>=4,{A=ese(x,y,index,doparallel);B=ede(x,y,index)},
         {A=matrix(NA,ncol=3,nrow=1);rownames(A)="ESE";colnames(A)=c("j1","j2","chi");B=A;rownames(B)="EDE";colnames(B)=c("j1","j2","chi");
         warning('Insufficient number of points, please provide at least 4 points!')});
  #
  out=rbind(A,B)
  #
  return(out)
}
