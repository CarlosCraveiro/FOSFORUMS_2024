# My presentation for FOSFORUMS - 2024

|**Date**  |**Title**                                                   |
|----------|------------------------------------------------------------|
|08/24/2024| My Recent Experiencing Developing Open Hardware using KiCAD|
-------------------------------------------------------------------------

**Local**:  Institute of Computing at the State University of Campinas (Unicamp), in Campinas, São Paulo, Brazil

## Link for the recording
You can access the recording at [FOSFORUMS YouTube channel](https://youtu.be/-7DMOClo9MM?t=1692). It starts at `28:12`

## The slides
You can acces the slides at the file [`main.pdf`](https://github.com/CarlosCraveiro/FOSFORUMS_2024/blob/main/main.pdf).

## Project's Repository

You can acess the project repository mentioned in the presentation [here](https://github.com/CarlosCraveiro/einstein-boltzmann).

-----------------------------------------------------------------------------------------------------------------------
![divulgation_image](https://github.com/CarlosCraveiro/FOSFORUMS_2024/blob/main/divulgation/FOSFORUMS_LinkedIn.png)

## To compile the presentation
Download the dependencies yourself, basically `typst` and some pdf visualizer.

Or use `nix` to download the dependencies to you: 
```bash
nix --experimental-features 'nix-command flakes'
nix develop -c $SHELL
```

Then, just compile it
```bash
typst compile main.typ
```

Now you should have a `main.pdf` to look at!
