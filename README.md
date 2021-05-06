#eeb5300finalproject

<h1>Overview and Motivation:</h1>
Treehoppers are insects that have evolved intricate, three-dimensional helmets that are not seen in any other related insects. These helmets are produced from what is normally a flat, single layer of epithelium in the body wall called the pronotum. Fisher et al. (2020) found that these helmets are produced from the expression of wing genes in the pronotum in the fifth instar of the treehopper <i>Entylia carinata<i>, an expression pattern that was not seen in the fifth instar of the related leafhopper <i>Homalodisca vitripennis<i>. 

<img width="894" alt="image" src="https://user-images.githubusercontent.com/44265751/117326216-73089300-ae5f-11eb-941e-df9a2bbe4cad.png">

This implied that at some point during development, treehoppers begin to express genes in the pronotum that are normally not expressed in the pronotum but only in the wing, and this is likely the mechanism that creates these three dimensional helmets from what is usually two dimensional flat body wall tissue. This mechanism is likely related to the intricate folding that occurs in wings, and co-option of this folding mechanism could cause these normally two dimensional regions to become three dimensional. However it is still an open question as to when this co-option occurs in development. Adachi et al. (2020) observed that the oragami-like folding process that creates this helmet seems to occur from the fourth to fifth instar.

<img width="894" alt="image" src="https://user-images.githubusercontent.com/44265751/117328115-540b0080-ae61-11eb-8ceb-87c5658b6c22.png">

This result leads us to believe that wing genes begin to be expressed in the pronotum between the fourth and fifth instar, implying that the fourth instar of treehoppers should have different expression patterns than the fifth instar in these body regions. For our project, we decided to use treehopper RNAseq data from four body regions at the fourth and fifth instars to investigate when wing genes are recruited for pronotum development. 

<h1>Related Work</h1>
The background information comes from work by Fisher <i>et al.</i> 2020. In this <a href="https://www-nature-com.ezproxy.lib.uconn.edu/articles/s41559-019-1054-4">Paper</a>, the authors reveal that leafhoppers (<i>Homalodisca vitripennis</i>) retain the ancestral condition of developing the pronotum from the mesonotum tissue, while treehoppers (<i>Entylia carinata</i>) have co-opted wing patterning genes to develop helmets from the pronotum. Although the data we used comes from this lab, the data was not used in this study and was collected separately. Therefore, the paper serves as background information to guide us. The RNAseq data we use in this project were collected in an effort to parse the expression between fourth and fifth instar of both <i>E. carinata</i> and <i>H. vitripennis</i>, and new data was collected on the fifth instar in an effort to resolve an index swapping issue with the data in Fisher et al. (2020). The sequences are paired end data, and there are three replicate individuals of each species at fourth and fifth instar, with eight body regions sent for TruSeq. This generated 90 libraries of data. We narrowed this down to three replicate individuals of <i>E.carinata</i> at fourth and fifth instar and four body regions for our analysis, or 24 libraries.

<h1>Initial Questions </h1>
After reading the work by Fisher <i>et al.</i> (2020) and Adachi et al. (2020) we wondered at which stage of <i>E. carinata</i> development begins the recruitment of wing patterning genes and in what order. To address this, we formulated two questions: 1) How are the wing patterning genes and the pronotum related? 2) How do the relationships between the pronotum and wing genes change between the 4th and 5th instar?

<h1>Data Information</h1>
The data used in this project was collected by Cera Fisher and shared with us by Elizabeth Jockusch. The data were paired-end and therefore have an associated R1 and R2 for each sample, giving us 48 files to work with based on our previous filtering of the data. The subset of data that we used is located on the server in home/FCAM/ssubramanian/files/ecar and home/FCAM/apastore/files/ecar and was copied to these locations from the ejockusch lab folder. 

<h1>Workflow and Analysis</h1>
We used the <a href="https://github.com/CBC-UCONN/RNAseq_nonmodel">Nonmodel RNAseq Tutorial</a> to analyze our data. The scripts used for each step are located in the folders above, and our workflow described below: 
<img width="894" alt="image" src="https://user-images.githubusercontent.com/44265751/117325399-adbdfb80-ae5e-11eb-9c91-f575293f6f18.png">

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

<b><h2>#Step 4: Concatenate Asseblies for Reference Transcriptome </b></h2>

<b><h2>#Step 5: Identify Coding Regions using <i>Transdecoder</i> and <i>hmer</i></b></h2>

<b><h2>#Step 6: Assembly of <i>de novo</i> Reference Transcriptome using RNAQuast</b></h2>

<b><h2>#Step 7: Annotate Reference Transcriptome using <i>EnTAP</i></b></h2>

<b><h2>#Step 8: Index Reference using <i>Kalisto</i>, Generate Counts for each Library </b></h2>

<b><h2>#Step 9: <i>NOIseq</i> Analysis and Differential Experession in R</b></h2>

![image](https://user-images.githubusercontent.com/44265751/116934557-1e80d000-ac33-11eb-9855-64ce23920ca4.png)

<h1>Discussion</h1>
We observed overlap in expression of the wing 2, wing 3, and pronotum regions in the L4 and L5 instars. As seen on our PCA plot, the abdomen was indeed most distant from all other body regions. 

<h1>References</h1>
Adachi, H., Matsuda, K., Nishida, K., Hanson, P., Kondo, S., & Gotoh, H. (2020). Structure and development of the complex helmet of treehoppers (Insecta: Hemiptera: Membracidae). Zoological Letters, 6(1), 3. 
Fisher, C. R., Wegrzyn, J. L., & Jockusch, E. L. (2020). Co-option of wing-patterning genes underlies the evolution of the treehopper helmet. Nature Ecology & Evolution, 4(2), 250–260. 


