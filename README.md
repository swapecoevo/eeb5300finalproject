#eeb5300finalproject

<h1>Overview and Motivation:</h1>
Treehoppers are insects that have evolved intricate, three-dimensional helmets. During development, a portion of the body wall known as the pronotum begins an oragami-like folding process to create a helmet Fisher and colleagues (2020) found that these helmets are produced from co-opted wing genes, but the specifics of the chronological development are unknown. For our project, we decided to use treehopper RNAseq data from each body part at two different instars to investigate when wing genes are recruited for pronotum development.

<h1>Related Work</h1>
The background information comes from work by Fisher <i>et al.</i> 2020. In this <a href="https://pubmed.ncbi.nlm.nih.gov/31819237/">Paper</a>, the authors reveal that leafhoppers retain the ancestral condition of developing the pronotum from the mesonotum tissue, while treehoppers have co-opted wing patterning genes to develop helmets from the pronotum. 

<h1>Initial Questions </h1>

<h1>Data Information</h1>


<h1>Workflow and Analysis</h1>
<h2><b>#Step 1: File Organization, FastQC and MultiQC </b></h2>
Files belong to Elizabeth Jockusch and Cera Fisher. To begin, we decided to focus on Pronotum, Wing2, Wing3 and Abdomen files for both the fourth and fifth instar. The Wing2 and Wing3 are understood to be involved in Pronotum development, meanwhile the Abdomen would serve as our outgroup for reference. Next, we ran FastQC and MultiQC on all of the files, which produced a large output. Overall, the quality was good and we had low adapter content. Two files, N10 and N11, were poor in quality but ultimately kept in our analysis.

![image](https://user-images.githubusercontent.com/44265751/116929615-aca58800-ac2c-11eb-90c1-f5a4cb7080da.png)
![image](https://user-images.githubusercontent.com/44265751/116929627-b16a3c00-ac2c-11eb-9e9d-65bf41ffc4a8.png)


<h2><b>#Step 2: Trimming Files with Trimmomatic </b></h2>
From this point onward, we decided to only use the files associated with Wing2, Wing3, Pronotum, and Abdomen instead of using all the files available. Once quality control had finished, we ran Trimmomatic on the FastQC files for the aformentioned body regions. Trimmomatic would serve to remove the adapter sequences and other low-quality areas. 

![image](https://user-images.githubusercontent.com/44265751/116928382-fbeab900-ac2a-11eb-8dd7-58ae36c96b23.png)
![image](https://user-images.githubusercontent.com/44265751/116928419-0b6a0200-ac2b-11eb-8d1a-e961253c2946.png)

<b><h2>#Step 3:<i> de novo</i> Assembly with Trinity </b></h2>
We used Trinity to assemble our transcriptome. When running, we split our files in half and ran separately. 

<b><h2>#Step 4: Concatenate Asseblies for Refernce Transcriptome </b></h2>

<b><h2>#Step 5: Identify Coding Regions using <i>Transdecoder</i> and <i>hmer</i></b></h2>

<b><h2>#Step 6: Assembly of <i>de novo</i> Reference Transcriptome using RNAQuast</b></h2>

<b><h2>#Step 7: Annotate Reference Transcriptome using <i>EnTAP</i></b></h2>

<b><h2>#Step 8: Index Reference using <i>Kalisto</i>, Generate Counts for each Library </b></h2>

<b><h2>#Step 9: <i>NOIseq</i> Analysis and Differential Experession in R</b></h2>

![image](https://user-images.githubusercontent.com/44265751/116934557-1e80d000-ac33-11eb-9855-64ce23920ca4.png)

<h1>Discussion</h1>
