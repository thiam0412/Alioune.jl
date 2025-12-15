
module Engine
using Plots 


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

function newton_zero(f::Function, start::Float64, precision::Float64)

    fp = prime(f)

    while abs(f(start)) > precision
        d = fp(start)
        if abs(d) < 1e-8
            return NaN
        end

        start = start - f(start) / d
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
    
    om
end 




"""
fonction plot_trajectory()

Permet d’obtenir une figure représentant la trajectoire d’un mouvement,
à partir de son équation donnée sous la forme d’une fonction f.

@param f : fonction f(x) à afficher
@param checkpoints : nombre de points de discrétisation de l’intervalle
    (plus il y a de points, plus la courbe est lisse,
    mais plus le temps d’exécution est long)
@param figure : figure sur laquelle tracer les données

conditions :
    f : continue sur l’intervploalle [a, b]
    b > a
    checkpoints >= 2
"""


function plot_trajectory(f::Function; checkpoints::Int=100)

    # distance maximale atteinte par l'objet (via Newton)
    max_x = ceil(newton_zero(f, 0.1, 1e-2))

    # données
    x = range(0.0, max_x; length=checkpoints)
    y = f.(x)

    # tracé principal 

    plot(x, y;
        seriestype = :scatter,
        color = :blue,
        label = "Trajectoire"
    )

    # axe vertical (x = 0)
    plot!([0.0 for _ in y], y;
        color = :black,
        label = false
    )

    # axe horizontal (y = 0)
    plot!(x, zeros(length(x));
        color = :black,
        label = false
    )

    xlabel!("Distance")
    ylabel!("Hauteur")
    title!("Trajectoire du projectile")
end

end



