
module UI 
using Bonito 
using Plots
using Alioune

app = App() do

    # --- Entrées utilisateur (équivalent Entry / Combobox) ---
    v0 = Slider(0:0.5:50, value=10, label="Vitesse initiale (m/s)")
    h0 = Slider(0:0.5:20, value=2, label="Hauteur initiale (m)")
    angle = Slider(0:1:90, value=45, label="Angle (degrés)")

    btn = Button("VIEW")

    output = Node()  # zone d’affichage du graphique

    # --- Action du bouton (équivalent view()) ---
    on(btn.clicks) do _
        θ = deg2rad(angle[])
        f = Alioune.Engine.get_equation(v0[], h0[], θ, 9.81)
        p = Alioune.Engine.plot_trajectory(f)
        output[] = p
    end

    # --- Mise en page ---
    Column(
        Row(
            Column(v0, h0, angle, btn),
            output
        )
    )
end


Bonito.run(app)

end 

