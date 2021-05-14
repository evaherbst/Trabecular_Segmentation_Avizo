// Macro to calculate Intersection over Union

path1 = File.openDialog("Select first image for Intersection over Union");
open(path1)

path2 = File.openDialog("Select second image for Intersection over Union");
open(path2)

img1 = File.getName(path1);
img2 = File.getName(path2);

// NOTE: union and intersection will be overwritten every time.
// intersection
imageCalculator("AND create stack", img1, img2);
saveAs("Tiff", "C:/Users/Alessandro/Documents/AF-side-projects/OaTech project/review-seg-metrics/intersection.tif");

// union
imageCalculator("OR create stack", img1, img2);
saveAs("Tiff", "C:/Users/Alessandro/Documents/AF-side-projects/OaTech project/review-seg-metrics/union.tif");

// to sum over the pixels in the intersection and union, we sum them in z first
selectWindow("intersection.tif");
run("Z Project...", "projection=[Sum Slices]");
selectWindow("union.tif");
run("Z Project...", "projection=[Sum Slices]");

// then we measure the "integrated density" which will give us the sum of FG pixels in each of the images
Table.reset("Results") // clear table, so these measurements are on top!
selectWindow("SUM_intersection.tif");
run("Measure");
selectWindow("SUM_union.tif");
run("Measure");

// get measurements out of the table
integrated_density_column = Table.getColumn("IntDen")
intersection = integrated_density_column[0]
union = integrated_density_column[1]


print("intersection "+img1+" and "+ img2 + ": " + intersection)
print("union "+img1+" and "+ img2 + ": " + union)
print("intersection over union: "+ intersection/union)
run("Close All");