
using Alioune
using Plots

v0 = 20.0
h0 = 2.0
θ  = deg2rad(45.0)
g  = 9.81

# Trajectoire
f = Alioune.Engine.get_equation(v0, h0, θ, g)

temps = 0:0.2:10
x_vals = v0 * cos(θ) .* temps
y_vals = [f(t) for t in temps]

# Création du graphique
p = plot(
    x_vals,
    y_vals,
    xlabel = "Distance (m)",
    ylabel = "Hauteur (m)",
    title  = "Trajectoire du projectile",
    legend = false
)

savefig(p, "projectile.png")

println(" Graphique sauvegardé dans projectile.png")
