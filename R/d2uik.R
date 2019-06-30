d2uik=function(x,y){
  if(length(x)<=3){stop('Method is not applicable for such a small vector. Please give at least a 6 numbers vector')}
  # Check data for equal x-abscissae and redefine x,y if necessary:
  xdifs=diff(x)
  if(0%in%xdifs){
    xy=data.frame("x"=x,"y"=y)
    dag=aggregate(y~x,xy,function(x){mean(x,na.rm=TRUE)})
    x=dag$x
    y=dag$y
  }
  # Compute absolute values for divided differences of second order:
  dd2=function(i,x,y){((y[i+2]-y[i+1])/(x[i+2]-x[i+1])-(y[i+1]-y[i])/(x[i+1]-x[i]))/((1/2)*x[i+2]-(1/2)*x[i])}
  dd2y=sapply(1:(length(x)-2), function(i,x,y){dd2(i,x,y)},x,y)
  d2abs=abs(c(dd2y,NA,NA))
  # Find UIK for them:
  yi=d2abs[!is.na(d2abs)]
  xi=x[1:(length(y)-2)]
  return(uik(xi,yi))
}