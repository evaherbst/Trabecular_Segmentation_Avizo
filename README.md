# Trabecular_Segmentation_Avizo
### How to automatically segment trabecular and cortical bone in CT scans, using Avizo. 
Developed by [Eva C. Herbst](https://github.com/evaherbst) and [Alessandro A. Felder](https://github.com/alessandrofelder). 

:pencil:  <!-- Please read our [preprint](link to preprint), which we have just submitted to Royal Society Open Science. -->

:computer: CT scan data from our paper can be found on [Figshare](link to figshare account)

The method is shared under a [?? license](link to license file), which means you can use and modify as you wish, but please cite our preprint if you do so.

____

### Instructions


1. Download our Avizo [recipe]() and move to your Avizo recipes folder. This enables you to access the recipe from inside Avizo: it will show up when you select Recipes and click on the folder icon to load the recipe.
    * On Windows, the directory of the recipe folder is usually: “C:\Users\[username here]\AppData\Roaming\Thermo Fisher Scientific\Recipes”. 


3. Filter your dataset (a non-local means 3D filter worked well for our CT data).

5. Isolate your region of interest (this includes the cortical and trabecular bone as well as the marrow space). 
   * See this [google doc](https://docs.google.com/document/d/1QbJB_ndeaJYawKlRPiMTbbQOFW05GAi_YtBxxeOHWfc/edit?usp=sharing) for a step-by-step guide of using the Avizo watershed method to isolate regions of interest during the pre-processing step. The guide was made specifically for mouse tibial epiphyses, in which the preprocessing is more intensive than in most other regions of interest because of the growth bridges connecting the epiphysis to the rest of the bone. The guide can be applied to other subjects - just omit steps that do not apply to your subject.  


6. Threshold marrow space (choose appropriate threshold values for your dataset - do not just use the ones in our guide without checking)


8. Apply (“trabecular_segmentation_April17_EH”) recipe to inter-trabecular space to segment trabeculae by going to the Recipes workspace and loading the recipe. Essentially our recipe “shrink wraps” the marrow space and then selects the bone inside this volume, which = your trabeculae.


10. Subtract trabeculae bone from epiphyseal bone to get cortical bone using Arithmetic function.

**Your outputs are the following binary objects: marrow space, total epiphyseal bone, trabecular bone, cortical bone**
  - If you have any questions about the workflow, or if anything in the guide is unclear, please create an Issue in this github repository or contact me at: eva.herbst *at* pim.uzh.ch  

___

:speech_balloon: *We would be thrilled if other researchers implemented this method in other (especially freeware) programs. The steps can be found in the [Avizo recipe file](). If you do so, please get in touch so we can link to your method here!*

We thank [Kamel Madi](https://www.linkedin.com/in/kamelmadi/?locale=en_US) for sharing his Avizo expertise with us.
