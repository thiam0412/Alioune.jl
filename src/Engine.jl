
module Engine

"""
fonction prime(f) :
fonction permettant d'obtenir la dérivée d'une fonction
en utilisant le calcul de la limite.
input : f à dériver
output : fp = df/dx
"""
function prime(f)
    h = 0.00000001
    function fp(x)
        (f(x+h)-f(x))/h
    end  
return fp
end
end 

