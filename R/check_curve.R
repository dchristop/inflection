check_curve=function(x,y){
  # Function to decide for the convexity type of the curve
  N=length(x)
  #
  j0=1
  j1=as.integer(quantile(1:N,0.25))
  j2=as.integer(quantile(1:N,0.50))
  j3=as.integer(quantile(1:N,0.75))
  jn=N
  # Check convexity by computing s_l and s_r surfaces
  LR0=findipl(x,y,j0);LR0;sl0=LR0[3];sr0=LR0[4];c(sl0,sr0)
  LR1=findipl(x,y,j1);LR1;sl1=LR1[3];sr1=LR1[4];c(sl1,sr1)
  LR2=findipl(x,y,j2);LR2;sl2=LR2[3];sr2=LR2[4];c(sl2,sr2)
  LR3=findipl(x,y,j3);LR3;sl3=LR3[3];sr3=LR3[4];c(sl3,sr3)
  LRn=findipl(x,y,jn);LRn;sln=LRn[3];srn=LRn[4];c(sln,srn)
  #
  sleft=c(sl1,sl2,sl3,sln);sleft
  sright=c(sr0,sr1,sr2,sr3);sright
  #
  leftsigns=sign(sleft);leftsigns;
  uleft=unique(leftsigns);uleft
  rightsigns=sign(sright);rightsigns;
  uright=unique(rightsigns);uright
  #
  if(length(uleft)==1){
    ifelse(uleft>0,{cleft="concave"},{cleft="convex"})
  }else{
    # ifelse(sum(leftsigns)>0,{cleft="concave"},{cleft="convex"})
    ifelse(leftsigns[1]>0,{cleft="concave"},{cleft="convex"})
  }
  #
  if(length(uright)==1){
    ifelse(uright>0,{cright="concave"},{cright="convex"})
  }else{
    # ifelse(sum(rightsigns)>0,{cright="concave"},{cright="convex"})
    ifelse(rightsigns[4]>0,{cright="concave"},{cright="convex"})
  }
  #
  #
  if(cleft=="convex" & cright=="concave"){
    ctype="convex_concave"
    index=0
  }else if(cleft=="concave" & cright=="convex"){
    ctype="concave_convex"
    index=1
  }else if(cleft=="convex" & cright=="convex"){
    ctype="convex"
    index=0
  }else if(cleft=="concave" & cright=="concave"){
    ctype="concave"
    index=1
  }
  #
  out=list("ctype"=ctype,"index"=index)
  out
  return(out)
}
