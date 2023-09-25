# Trabecular_Segmentation_Avizo

### How to automatically segment trabecular and cortical bone in CT scans, using Avizo. 
Developed by [Eva C. Herbst](https://github.com/evaherbst) and [Alessandro A. Felder](https://github.com/alessandrofelder). 


:pencil:  Please read our [paper](https://royalsocietypublishing.org/doi/10.1098/rsos.210408), which we wrote with Lucinda A. Evans, Sara Ajami, Behzad Javaheri, and Andrew A. Pitsillides. If you use this method, please cite our paper (Herbst et al. 2021) [![DOI:10.1098/rsos.210408](http://img.shields.io/badge/DOI-10.1098/rsos.210408-GREEN.svg)](https://royalsocietypublishing.org/doi/10.1098/rsos.210408) and the doi of the most recent Github release:
[![DOI](https://zenodo.org/badge/341621577.svg)](https://zenodo.org/badge/latestdoi/341621577)


:computer: CT scan data from our paper can be found on [Figshare](https://figshare.com/projects/Trabecular_and_Cortical_Bone_Segmentation_Method/99434)

The method is shared under [an MIT license](./LICENSE) (or alternatively, under a [CC BY SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/), for historical reasons). Both mean you can use and modify as you wish with proper attributing (*please cite both [our paper](https://doi.org/10.1098/rsos.210408) and [the version of the code you've used](https://doi.org/10.5281/zenodo.4761679)*)

A [Youtube tutorial](https://youtu.be/cQ9sBu6SpJw) is also available.

![alt-text](https://github.com/evaherbst/Trabecular_Segmentation_Avizo/blob/main/trabecular_segmentation_video_EH_CBA_No3_20W.gif)  

____

### Overview of the Method:
 Essentially our recipe “shrink wraps” the marrow space and then selects the bone inside this volume, which = your trabeculae.
 This is how it works:
- Erosion and dilation by 3px to remove isolated pores or sinuses in the bone that are not part of inter-trabecular space
- Closing algorithm (25pt) to “shrink wrap” trabecular space so that it includes trabeculae.
- Arithmetic (takes shrink wrapped trabecular space - marrow space after 3pt erosion (e.g. marrow space after small sinuses are removed) to get trabeculae)
- Erosion and dilation by 1px (setting: 3D ball) to clean up any noise at border.

____ 
### Implementing the Method:


1. Download our Avizo [recipe](https://github.com/evaherbst/Trabecular_Segmentation_Avizo/blob/main/recipe_trabecular_segmentation_Avizo_EH.hxrecipe) and move to your Avizo recipes folder. This enables you to access the recipe from inside Avizo.
    * On Windows, the directory of the recipe folder is usually: “C:\Users\[username here]\AppData\Roaming\Thermo Fisher Scientific\Recipes”. 


3. Filter your dataset (a non-local means 3D filter worked well for our CT data).

5. Isolate your region of interest (this includes the cortical and trabecular bone as well as the marrow space). 
   * See this [google doc](https://docs.google.com/document/d/1QbJB_ndeaJYawKlRPiMTbbQOFW05GAi_YtBxxeOHWfc/edit?usp=sharing) for a step-by-step guide of using the Avizo watershed method to isolate regions of interest during the pre-processing step. The guide was made specifically for mouse tibial epiphyses, in which the preprocessing is more intensive than in most other regions of interest because of the growth bridges connecting the epiphysis to the rest of the bone. The guide can be applied to other subjects - just omit steps that do not apply to your subject. **The guide also includes more details about all other steps of the method implementation.**


6. Threshold marrow space (choose appropriate threshold values for your dataset - do not just use the ones in our guide without checking)


8. Apply the recipe to automatically segment trabeculae. Go to the Recipes workspace. From the recipes on the left, select recipe titled “recipe_trabecular_segmentation_Avizo_EH”. For the input image, select your marrow space. Click the play button to run the automatic segmentation.

9. Subtract trabeculae bone from epiphyseal bone to get cortical bone using Arithmetic function.

**Your outputs are the following binary objects: marrow space, total epiphyseal bone, trabecular bone, cortical bone**
  - If you have any questions about the workflow, or if anything in the guide is unclear, please create an Issue in this github repository or contact me at: eva.herbst *at* pim.uzh.ch  

___
**Validation**
We also developed an imageJ macro to check "intersection over union" to compare inter-user differences and the effects of manual removal of small inlets.
The imageJ macro can be found [here](https://github.com/evaherbst/Trabecular_Segmentation_Avizo/tree/main/validation).
___
:speech_balloon: *We would be thrilled if other researchers implemented this method in other (especially freeware) programs. The steps can be found in the [Avizo recipe file](https://github.com/evaherbst/Trabecular_Segmentation_Avizo/blob/main/recipe_trabecular_segmentation_Avizo_EH.hxrecipe). If you do so, please get in touch so we can link to your method here!*

We thank [Kamel Madi](https://www.linkedin.com/in/kamelmadi/?locale=en_US) for sharing his Avizo expertise with us. We thank the [OATech Network+](https://www.oatechnetwork.org/) for funding our research. 
