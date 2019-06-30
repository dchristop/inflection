uik=function(x,y){
    #Output for UIK method as defined theoretically in:   
    # Christopoulos, Demetris T., Introducing Unit Invariant Knee (UIK) As an Objective Choice 
    # for Elbow Point in Multivariate Data Analysis Techniques (March 1, 2016).
    # Available at SSRN: https://ssrn.com/abstract=3043076 or http://dx.doi.org/10.2139/ssrn.3043076
    #Contact Emails: dchristop@econ.uoa.gr or dem.christop@gmail.com           
    if(length(x)<=3){stop('Method is not applicable for such a small vector. Please give at least a 5 numbers vector')}
    # Check convexity or at least leading convexity:
    cxv=check_curve(x,y)
    knee=x[ede(x,y,cxv$index)[1]]
    return(knee)
}
