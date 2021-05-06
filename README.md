#eeb5300finalproject

<h1>Overview and Motivation:</h1>
Treehoppers are insects that have evolved intricate, three-dimensional helmets that are not seen in any other related insects. These helmets are produced from what is normally a flat, single layer of epithelium in the body wall called the pronotum. Fisher et al. (2020) found that these helmets are produced from the expression of wing genes in the pronotum in the fifth instar of the treehopper <i>Entylia carinata</i>, an expression pattern that was not seen in the fifth instar of the related leafhopper <i>Homalodisca vitripennis</i>. 

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
Files belong to Elizabeth Jockusch and Cera Fisher. To begin, we decided to focus on Pronotum, Wing2, Wing3 and Abdomen files for both the fourth and fifth instar of the treehopper. The Wing2 and Wing3 are understood to be involved in Pronotum development, meanwhile the Abdomen would serve as our outgroup for reference. We ran FastQC and MultiQC on all of the files associated with the two instars of the treehopper and all eight body regions to evaluate the quality of all the libraries. Overall, the quality was good. There was high sequence duplication as is to be expected in RNASeq data, but we had good sequence quality and length distributions. 

![image](https://user-images.githubusercontent.com/44265751/116929615-aca58800-ac2c-11eb-90c1-f5a4cb7080da.png)
![image](https://user-images.githubusercontent.com/44265751/116929627-b16a3c00-ac2c-11eb-9e9d-65bf41ffc4a8.png)

Importantly, the quality of one library, N11, was extremely low and had almost no unique reads, and seemed to be made up entirely of adapters. This led us to remove it from further analyses, reducing one replicate of a wing2 region of instar 5. 

<img width="786" alt="image" src="https://user-images.githubusercontent.com/44265751/117332488-e8776200-ae65-11eb-9c69-faa58d8f71e6.png">


<h2><b>#Step 2: Trimming Files with Trimmomatic </b></h2>
From this point onward, we decided to only use the files associated with Wing2, Wing3, Pronotum, and Abdomen instead of using all the files available. We ran Trimmomatic on the FastQC files for the aformentioned body regions. Trimmomatic would serve to remove the TruSeq paired end adapter sequences and dropped reads if they were lower than 45 base pairs. 

Our quality in terms of adapter content was definitely improved.
<img width="379" alt="image" src="https://user-images.githubusercontent.com/44265751/117332829-499f3580-ae66-11eb-938b-c477a963881d.png">

![image](https://user-images.githubusercontent.com/44265751/116928382-fbeab900-ac2a-11eb-8dd7-58ae36c96b23.png)
![image](https://user-images.githubusercontent.com/44265751/116928419-0b6a0200-ac2b-11eb-8d1a-e961253c2946.png)

<b><h2>#Step 3:<i> de novo</i> Assembly with Trinity </b></h2>
We used Trinity to assemble our trimmed libraries. When running, we split our files in half and ran separately. Based on our sequence length distribution, we set our minimum contig length to 90. 

<b><h2>#Step 4: Concatenate Asseblies for Reference Transcriptome </b></h2>

<b><h2>#Step 5: Identify Coding Regions using <i>Transdecoder</i> and <i>hmer</i></b></h2>

<b><h2>#Step 6: Use vsearch to cluster similar transcripts and assemble <i>de novo</i> Reference Transcriptome</b></h2>
After assembling our de novo transcriptome, we used RNAQuast to evaluate the quality of our reference. 
<img width="480" alt="image" src="https://user-images.githubusercontent.com/44265751/117333412-e8c42d00-ae66-11eb-9d98-992e5861bc5a.png">
<img width="470" alt="image" src="https://user-images.githubusercontent.com/44265751/117333540-05f8fb80-ae67-11eb-8fc8-da83fcd91d3f.png">

We found that the reference we assembled was of good quality, with our average length of our transcripts being 858.7 and our N50 being a high value at 969. 

<b><h2>#Step 7: Annotate Reference Transcriptome using <i>EnTAP</i></b></h2>


<b><h2>#Step 8: Index Reference using <i>Kallisto</i>, Generate Counts for each Library </b></h2>

<b><h2>#Step 9: <i>NOIseq</i> Analysis and Differential Experession in R</b></h2>

![image](https://user-images.githubusercontent.com/44265751/116934557-1e80d000-ac33-11eb-9855-64ce23920ca4.png)

<h1>Discussion</h1>
We observed overlap in expression of the wing 2, wing 3, and pronotum regions in the L4 and L5 instars. As seen on our PCA plot, the abdomen was indeed most distant from all other body regions. 

<h1>References</h1>
Adachi, H., Matsuda, K., Nishida, K., Hanson, P., Kondo, S., & Gotoh, H. (2020). Structure and development of the complex helmet of treehoppers (Insecta: Hemiptera: Membracidae). Zoological Letters, 6(1), 3. 
Fisher, C. R., Wegrzyn, J. L., & Jockusch, E. L. (2020). Co-option of wing-patterning genes underlies the evolution of the treehopper helmet. Nature Ecology & Evolution, 4(2), 250–260. 


