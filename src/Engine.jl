
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

"""
fonction zero(f)
Fonction permettant de rechercher un zéro d’une fonction en utilisant l’algorithme de Newton.
@param f : fonction dont on cherche un zéro
@param precision : précision (à quel point le résultat doit être proche de 0)
@param a : point de départ de la recherche
"""

function newton_zero(f::Function,start::Float64, precision::Float64)
    while abs(f(start)) > precision
        start = start + f(start)/(prime(f))(start)
    end
    return start
end


"""
fonction get_equation(v0, h0, teta)
Fonction permettant d’obtenir l’équation du mouvement à partir des données initiales.

@param v0 : vitesse à l’instant t = 0
@param h0 : hauteur à l’instant t = 0
@param teta : angle à l’instant t = 0
@return fonction om(x) = y représentant la hauteur de l’objet en fonction de x
"""

function get_equation(v0::Float64, h0::Float64, theta::Float64, g::Float64)

    function om(x::Float64)
        # si la vitesse et la hauteur initiales sont nulles : pas de mouvement
        if v0 == 0 && h0 == 0
            return 0.0
        end

        t = x / (v0 * cos(theta))
        height = -0.5 * g * t^2 + v0 * sin(theta) * t + h0
        return height
    end

    return om
end
end 