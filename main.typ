  #import "@preview/polylux:0.3.1": *
  #import themes.university: *

  #show: university-theme.with(
    short-author: "Carlos Craveiro",
    short-title: "Short title",
    short-date: "August 2024",
  )

  #title-slide(
    authors: ("Carlos Henrique Craveiro Aquino Veras"),
    title: "My Recent Experience Developing Open Hardware using KiCAD",
    subtitle: "Subtitle",
    date: "August 24, 2024",
    institution-name: "University of São Paulo",
    //logo: image("dummy-logo.png", width: 60mm)
  )

#slide(title: [#v(10pt)Open Source Sofware], new-section: [The section])[
  #align(center)[
    #stack(
    dir: ltr,
    spacing: 30pt,
    stack(
      dir: ttb,
      spacing: 2pt,
      figure(image("figs/inkscape_logo.png", width: 13%)),
      figure(image("figs/gcc_logo.png", width: 13%)),
      figure(image("figs/logo_sdcc.png", width: 13%)),
      figure(image("figs/logo_freeRTOSS.png", width: 15%)),
    ), stack(
      dir: ttb,
      spacing: 5pt,
      figure(image("figs/vim_logo.png", width: 13%)),
      figure(image("figs/osi_logo.png", width: 25%)),
    ), stack(
      dir: ttb,
      spacing: 20pt,
      figure(image("figs/tux.png", width: 13%)),
      figure(image("figs/logo_wayland.png", width: 13%)),
      figure(image("figs/logo_xorg.png", width: 13%)),
    ),
)]
]

#slide(title: [Slide title], new-section: [The section])[
  #align(center)[
  #text("Is there a reciprocal movement, but for Hardware?")
  #v(10pt)
  #pause
  #text("YES THERE IS!")
]
]

#slide(title: [#v(10pt)Open Source Hardware], new-section: [The section])[
  #align(center)[
    #stack(
    dir: ltr,
    spacing: 25pt,
    stack(
      dir: ttb,
      spacing: 10pt,
      figure(image("figs/logo_silwiz.png", width: 16%)),
      figure(image("figs/logo_kicad.png", width: 18%)),
      figure(image("figs/logo_yosys.png", width: 12%)),
    ), stack(
      dir: ttb,
      spacing: 5pt,
      figure(image("figs/ngspice_logo.jpg", width: 18%)),
      figure(image("figs/logo_openhardware.png", width: 32%)),
    ), stack(
      dir: ttb,
      spacing: 20pt,
      figure(image("figs/logo_freecad.png", width: 13%)),
      figure(image("figs/logo_riscv.png", width: 13%)),
      figure(image("figs/logo_arduino.png", width: 13%)),
    ),
)
  #text(size: 35pt, weight: "bold", "And many many more...")
]
]


#slide(title: [#v(10pt)Focus of the presentation], new-section: [The section])[
  #text("KiCAD")
]

#slide(title: [#v(10pt)Who am I?], new-section: [The section])[
  #stack(
    dir: ltr,
    spacing: 1fr,
    stack(
      dir: ttb,
      spacing: 50pt,
      text(""),
      text("•  Carlos Henrique Craveiro Aquino Veras"),
      text(/*size: 28pt, weight: "bold",*/ "•  Computer Engineering Undergrad Student"),
      text("•  FOSS Herald and Advocate"),
        text("•  Curious guy that loves to learn new things"),
    ),
    figure(image("figs/profile_photo.jpeg", width: 30%)),
)

]

#slide(title: [Slide title], new-section: [The section])[
  #figure(image("figs/original_board.png", width: 100%), caption: "The Original board¹")
]

//#focus-slide(background-img: image("figs/original_board.png"))[a]

#slide(title: [Slide title], new-section: [The section])[
  $S_n(omega) = 2 k T R$
  #v(5pt)
  #import "@preview/bob-draw:0.1.0": *
#render(```
      +----+-o
      |    |
      |    |
     .+.  _|_
     | |  --- 
     '+'   |
      |    |
      |    |
      +----+-o
```)
#import "@preview/bob-draw:0.1.0": *
#render(```
                       +------+-o
                       |      |
                       |      |
                      .+.     |
                    R | |     |
                      '+'    _|_ 
                       |     ---  C
                    + ,+.     |
                  Vg (   )    |
                    - `+'     |
                       |      |
                       |      |
                       |      |
                       +------+-o 
```)
/*
*     !   ()     '                                     _        __    :
    !        __   ,-.   .--.   .--.--.     .--.      .' '.    ,'  '.  :
    !   (_) (__) (   ) (    ) (  ( )  )   (    )    (     )  (      ) :
    !             `-'   `--'   `--'--'     `--'      `._.'    `.__.'  :
    !                                                                 !
*
* */

#import "@preview/bob-draw:0.1.0": *
#render(```
 o->  It can do complex stuff such as circuit diagrams


       +10-15V           ___0,047R
      *---------o-----o-|___|-o--o---------o----o-------.
    + |         |     |       |  |         |    |       |
    -===-      _|_    |       | .+.        |    |       |
    -===-      .-.    |       | | | 2k2    |    |       |
    -===-    470| +   |       | | |        |    |      _|_
    - |       uF|     '--.    | '+'       .+.   |      \ / LED
      +---------o        |6   |7 |8    1k | |   |      -+-
             ___|___   .-+----+--+--.     | |   |       |
              -═══-    |            |     '+'   |       |
                -      |            |1     |  |/  BC    |
               GND     |            +------o--+   547   |
                       |            |      |  |`>       |
                       |            |     ,+.   |       |
               .-------+            | 220R| |   o----||-+  IRF9Z34
               |       |            |     | |   |    |+->
               |       |  MC34063   |     `+'   |    ||-+
               |       |            |      |    |       |  BYV29     -12V6
               |       |            |      '----'       o--|<-o----o--X OUT
 6000 micro  - | +     |            |2                  |     |    |
 Farad, 40V ___|_____  |            |--o                C|    |    |
 Capacitor  ~ ~ ~ ~ ~  |            | GND         30uH  C|    |   --- 470
               |       |            |3      1nF         C|    |   ###  uF
               |       |            |-------||--.       |     |    | +
               |       '-----+----+-'           |      GND    |   GND
               |            5|   4|             |             |
               |             |    '-------------o-------------o
               |             |                           ___  |
               `-------------*------/\/\/------------o--|___|-'
                                     2k              |       1k0
                                                    .+.
                                                    | | 5k6 + 3k3
                                                    | | in Serie
                                                    '+'
                                                     |
                                                    GND
```)

]

#focus-slide(background-img: image("figs/figure.png"))[
  *Another variant with an image in background...*
]

#matrix-slide(columns: 2)[
#align(left)[
  #set par(justify: false)
  *Abstract* \
  #v(1pt)
  #lorem(10)
]
][
    #figure(image("figs/figure.png", width: 100%), caption: "Caption")
]

#slide(title: [References], new-section: [The section])[
  - TODO...
]
//#matrix-slide(columns: (1fr, 2fr, 1fr), ..(lorem(8),) * 9)
