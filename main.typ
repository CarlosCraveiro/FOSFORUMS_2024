  #import "@preview/polylux:0.3.1": *
  #import themes.university: *
  #import "@preview/bob-draw:0.1.0": *
  
  #show: university-theme.with(
    short-author: "Carlos Craveiro",
    short-title: "Developing Open Hardware using KiCAD",
    short-date: "August 2024",
  )

  #title-slide(
    authors: ("Carlos Henrique Craveiro Aquino Veras"),
    title: "My Recent Experience Developing Open Hardware using KiCAD",
    subtitle: "A newcome's journey from an ideia to a layout",
    date: "August 24, 2024",
    institution-name: "University of São Paulo - São Carlos",
    //logo: image("dummy-logo.png", width: 60mm)
  )

#slide(title: [#v(10pt)Who am I?], new-section: [Introduction])[
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

#slide(title: [#v(10pt)Open Source Hardware], new-section: [Introduction])[
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


#slide(title: [#v(10pt)Focus of the presentation], new-section: [Introduction])[
  #figure(image("figs/kicad_cool_image.png", width: 60%))
  
  #align(center)[
    #text("How it can be used to create amazing things!")
  ]
]

#slide(title: [#v(10pt)The inspiration], new-section: [History])[
  #figure(image("figs/original_board.png", width: 100%), caption: "The Original board¹")
]

#slide(title: [#v(10pt)When it all started?], new-section: [History])[
  #align(center)[
    #stack(
    dir: ltr,
    spacing: 25pt,

    stack(
      dir: ttb,
      spacing: 10pt,
      figure(image("figs/edneys_lab01.jpg", width: 28%)),
      figure(image("figs/logo_ipho.png", width: 25%)),
    ),
    stack(
      dir: ttb,
      spacing: 10pt,
      figure(image("figs/edneys_lab03.jpg", width: 33%)),
      figure(image("figs/edneys_lab02.jpg", width: 33%)),
    ),
    figure(image("figs/picture_with_edney_crop.jpg", width: 30%)),
)
]
]

#slide(title: [#v(10pt)Original Work], new-section: [History])[
  #align(center)[
    #figure(image("figs/original_paper_header.png", width: 85%))
    #text(size: 30pt, weight: "bold", "And other authors...")
  ]
]

#slide(title: [#v(10pt)The Boltzmann Constant], new-section: [Physics Behind])[
    #align(center)[
    #stack(
    dir: ltr,
    spacing: 1fr,

    align(center + horizon)[
      #show math.equation: set text(35pt)
      $k_B = 1.380650 dot 10^(-23) J.K^(-1)$
    ], 
    
    figure(image("figs/ludwig_boltzmann.jpg", width: 40%)),
)
]
]

#slide(title: [#v(10pt)Einstein's Idea], new-section: [Physics Behind])[
    #align(center)[
    #stack(
    dir: rtl,
    spacing: 1fr,

    align(center + horizon)[
      #show math.equation: set text(30pt)
      #text(size: 30pt, "Find") $k_B$ #text(size: 30pt,"by examination of the mean ")

      #text(size: 30pt,"Thermal Energy¹!")
    ], 
    
    figure(image("figs/albert_einstein.jpg", width: 35%)),
)
]
]

#slide(title: [#v(10pt)The Noisy Element], new-section: [Physics Behind])[
  #figure(image("figs/resistor.jpg", width: 100%))
]

#slide(title: [#v(10pt)Thermal Noise], new-section: [Physics Behind])[
  #figure(image("figs/thermal_noise.png", width: 90%), caption:"https://www.nwengineeringllc.com/article/thermal-noise-in-communication-and-optical-systems.php")
]

#slide(title: [#v(10pt)Thermal Noise - PSD], new-section: [Physics Behind])[
  #align(center + horizon)[
  #show math.equation: set text(60pt)
  #v(60pt)
  #text(size: 70pt, "Power Spectral Density")
  #v(30pt)
  $S_n (omega)$
]
]

#slide(title: [#v(10pt)Thermal Noise Source], new-section: [Physics Behind])[
  #v(10pt)
  #figure(image("figs/Noise_PSD_resistor.png", width: 100%))
  #v(15pt)
  #h(25pt) $overline(V_n)^2 = 4k_B T R Delta f$
  #v(15pt)
  #h(25pt)#text("So") $V_n^2$ #text("depends of ") $Delta f$ #text("and") $R$ #text("?") #text("What a Drama!") 
]

#slide(title: [#v(10pt)Signal Source²], new-section: [Physics Behind])[
    #v(10pt)
    #align(center)[
    #stack(
    dir: ttb,
    spacing: 25pt,

    stack(
      dir: ltr,
      spacing: 150pt,
       $S_n (omega) = 4 k_B T R$,
       $S_n (omega) = |H(omega)|^2 4 k_B T R$
    ),
    stack(
      dir: ltr,
      spacing: 250pt,
      render(```
           +--o a  
           |        
           |       
          .+.      
        R | |      
          '+'      
           |       
        + ,+.      
      Vg (   )     
        - `+'      
           |        
           |       
           +--o b  
                 
      ```),
      render(```
           +------+-o a           
           |      |      ^    
           |      |      |    
          .+.     |           
        R | |     |      |    
          '+'    _|_           
           |     ---  C  |  Vo 
        + ,+.     |            
      Vg (   )    |      |    
        - `+'     |           
           |      |      |    
           |      |      v     
           +------+-o b              
                        
      ```),
    ),
    [
    #show math.equation: set text(35pt)
    $overline(V_o)^2 = (k_B T)/(C)$
    ]
)
]  
]

#slide(title: [#v(10pt)Original Layout], new-section: [Physics Behind])[
  #figure(image("figs/original_board_layout.png", width: 100%))
]

/*
*  KICAD - Part of the presentation
*
* */
#focus-slide(background-img: image("figs/kicad_website.png"))[
  #text("")
]

#focus-slide(background-img: image("figs/kicad_project_screen.png"))[
  #text("")
]

#slide(title: [#v(10pt)Original Schematics], new-section: [KiCAD - Schematics])[
  #figure(image("figs/original_schematics.png", width: 100%))
]

#focus-slide(background-img: image("figs/kicad_schematic_blank_canva.png"))[
  #text("")
]

#focus-slide(background-img: image("figs/kicad_symbol_placement.png"))[
  #text("")
]

#focus-slide(background-img: image("figs/main_board_schematics.png"))[
  #text("")
]

#slide(title: [#v(10pt)Electric Rule Checker], new-section: [KiCAD - Schematics])[
  #align(left)[
    #stack(
      dir: ttb,
      spacing: 60pt,
      text(""),
      text("• Correctness of power and ground connections"),
      text("• Problems with the SPICE simulation models"),
      text("• Unconnected inputs or shorted outputs"),
      text(/*size: 28pt, weight: "bold",*/ "•  Conflicting information on schematic"),
    )
  ]
]

#focus-slide(background-img: image("figs/erc_configs.png"))[
  #text("")
]

#focus-slide(background-img: image("figs/erc_pt1.png"))[
  #text("")
]

#focus-slide(background-img: image("figs/erc_pt2.png"))[
  #text("")
]

#slide(title: [#v(10pt)Simulation], new-section: [KiCAD - Schematics])[
   #align(left)[
    #stack(
      dir: ttb,
      spacing: 60pt,
      text(""),
      text("• Verify the theoretical behaviour of the board"),
      text("• KiCAD natively integrates simulation capabilitys"),
      text(/*size: 28pt, weight: "bold",*/ "•  Uses NGSpice as the simulation engine"),
      text("• Provides a variety of simulation types (DC Analysis, AC, Op, ...)"),
    )
  ] 
]

#focus-slide(background-img: image("figs/ac_simulation.png"))[
  #text("")
]

/*
* KiCAD Layout
* */

#focus-slide(background-img: image("figs/kicad_layout_blank_canva.png"))[
  #align(left)[#h(20pt)*Layout*]
]

#focus-slide(background-img: image("figs/kicad_layout_blank_canva.png"))[
  #text("")
]

#focus-slide(background-img: image("figs/footprints_from_schematic.png"))[
  #text("")
]

#focus-slide(background-img: image("figs/footprints_from_schematic_2.png"))[
  #text("")
]

#focus-slide(background-img: image("figs/kicad_layout_components_edges.png"))[
  #text("")
]

#focus-slide(background-img: image("figs/kicad_components_silkscreen.png"))[
  #text("")
]

#focus-slide(background-img: image("figs/net_classes.png"))[
  #text("")
]

#focus-slide(background-img: image("figs/main_board_layout_routed.png"))[
  #text("")
]

#focus-slide(background-img: image("figs/main_board_layout_w_gnd_planes.png"))[
  #text("")
]

#focus-slide(background-img: image("figs/main_board_without_via_stitching.png"))[
  #text("")
]

#slide(title: [#v(10pt)KiCAD Addons], new-section: [KiCAD - Layout])[
#align(left)[
    #stack(
      dir: ttb,
      spacing: 70pt,
      text(""),
      text("• Python plugins (Automate tasks and Add new capabilities)"),
      text("• Content libraries (Shared 3rd party footprints, 3D models and symbols)"),
      text("• Color themes (More customization options)"),
    )
  ]
]

#focus-slide(background-img: image("figs/plugin_manager.png"))[
  #text("")
]

#focus-slide(background-img: image("figs/via_stitching_tool.png"))[
  #text("")
]

#focus-slide(background-img: image("figs/main_board_layout_zoomed.png"))[
  #text("")
]

#slide(title: [#v(10pt)Design Rule Checking], new-section: [KiCAD - Layout])[
#align(left)[
    #stack(
      dir: ttb,
      spacing: 60pt,
      text(""),
      text("• Geometric constraint imposed on circuit board"),
      text("• Reflects the capability of the manufacture fabrication processes"),
      text("• Major step during physical verification signoff on the design"),
      text(/*size: 28pt, weight: "bold",*/ "•  Also involves LVS (layout versus schematic) and  ERC"),
    )
  ]
]

#slide(title: [#v(10pt)Design Rules Constraints UI], new-section: [KiCAD - Layout])[
  #figure(image("figs/drc_constrins_gui.png", width: 100%))
]

#focus-slide(background-img: image("figs/drc_custom_rules.png"))[
  #text("")
]

#focus-slide(background-img: image("figs/drc_unconnected_warning.png"))[
  #text("")
]

#slide(title: [#v(10pt)Constraint Violation], new-section: [KiCAD - Layout])[
  #figure(image("figs/drc_violated_constrains.png", width: 100%))
]

#slide(title: [#v(10pt)3D Visualization], new-section: [KiCAD - Layout])[
#align(left)[
    #stack(
      dir: ttb,
      spacing: 60pt,
      text(""),
      text("• OpenGL (GPU accelerated), and ray tracing"),
      text("• Helps to verify the Design by visual inspection"),
      text("• Get an idea about how the project may look like when it is finished"),
    )
  ]
]

#focus-slide(background-img: image("figs/main_board_3d_raytraced.png"))[
  #text(""); 
]

  #focus-slide(background-img: image("figs/main-board_3d_raytraced_no_components.png"))[
  #text(""); 
]

#focus-slide(background-img: image("figs/main_board_3d_front_raytraced.png"))[
  #text(""); 
]

#focus-slide(background-img: image("figs/main_board_3d_back_raytraced.png"))[
  #text(""); 
]

#slide(title: [#v(10pt)Issues I faced], new-section: [Issues faced])[
#align(left)[
    #stack(
      dir: ttb,
      spacing: 60pt,
      text(""),
      text("• Multi-project with KiCAD is terrible"),
      text("• The simulation tool was poor documentaded (KiCAD 7)"),
      text("• I couldn't simulate my circuit as I wanted"),
      text("• Customization a bit too laborious (issues with shortcuts)"),
    )
  ]
  #align(right)[
    
  ]
]

#slide(title: [#v(10pt)Future Work], new-section: [Future Work])[
#align(left)[
    #stack(
      dir: ttb,
      spacing: 60pt,
      text(""),
      text("• Check if the board actually works"),
      text("• Determine the Boltzmann Constant (Have fun with the project!)"),
      text("• Reduce costs: find cheaper OPAmps, decrease PCB size, ..."),
      text("• Check for design flaws and possible improvements"),
    )
  ]
  #align(right)[
    
  ]
]

#slide(title: [#v(10pt)Future Work], new-section: [Future Work])[
    #align(center)[
    #stack(
    dir: ltr,
    spacing: 1fr,

    align(left)[
      #text(" ")

      #text("• Setup a KicadStepUp Workbench")
      
      #text("at FreeCAD")
      #v(20pt)
      #text("• Make the simulation work")
      #v(40pt)
      #text("• Improve project's documentation")
    ], 
    
    figure(image("figs/ecad-mcad-collaboration.png", width: 40%)),
)
]
]

#slide(title: [#v(10pt)References], new-section: [References])[
  #v(20pt)
  - 1 - Mishonov, T. M., Petkov, E. G., Stefanov, A. A., & Petkov, A. P. (2018). *Measurement of the Boltzmann constant by Einstein: Problem of the 5th Experimental Physics Olympiad* (Sofia, 9 December 2017). Retrieved from https://arxiv.org/pdf/1801.00022v3
  #v(30pt)
- 2 - Lathi, B. P., Ding, Z. (2009). Modern Digital and Analog Communication Systems. United Kingdom: Oxford University Press.
]

#slide(title: [#v(10pt)Contact Information], new-section: [The End])[
  #align(center)[
      #stack(
      dir: ltr,
      spacing: 1fr,
  
      align(left)[
        #text(" ")
        #v(5pt) 
        #text("• LinkedIn:    carloscraveiro")
        #v(30pt)
        #text("• GitHub:      @CarlosCraveiro")
        #v(30pt)
        #text("• E-mail:      carlos.craveiro@usp.br")
        #v(30pt)
        #text("• Personal Blog:")
        
        #text("    carloscraveiro.github.io/personal_blog/")
  
      ], 
      
      figure(image("figs/linkedIn_qrcode.png", width: 45%)),
  )
  ]
]
