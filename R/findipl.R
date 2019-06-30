findipl <-
function(x,y,j)
{ 
  n=length(x);
  #sl...
  dxl=diff(x[1:j],1,1);
  fl=y[1:j]-lin2(x[1],y[1],x[j],y[j],x[1:j]);
  sb2l=0.5*(fl[1:(j-1)]+fl[2:j]);
  sl=sum(dxl*sb2l)
  #sr...
  dxr=diff(x[j:n],1,1);
  fr=y[j:n]-lin2(x[j],y[j],x[n],y[n],x[j:n]);
  sb2r=0.5*(fr[1:(length(fr)-1)]+fr[2:length(fr)]);
  sr=sum(dxr*sb2r)
  #
  c(j,x[j],sl,sr)
}
