#eeb5300finalproject

<h1><b>#Step 1: File Organization, FastQC and MultiQC </b></h1>
Files belong to Elizabeth Jockusch and Cera Fisher. To begin, we decided to focus on Pronotum, Wing2, Wing3 and Abdomen files for both the fourth and fifth instar. The Wing2 and Wing3 are understood to be involved in Pronotum development, meanwhile the Abdomen would serve as our outgroup for reference. Next, we ran FastQC and MultiQC on all of the files, which produced a large output. Overall, the quality was good and we had low adapter content. Two files, N10 and N11, were poor in quality but ultimately kept in our analysis.

![image](https://user-images.githubusercontent.com/44265751/116929615-aca58800-ac2c-11eb-90c1-f5a4cb7080da.png)
![image](https://user-images.githubusercontent.com/44265751/116929627-b16a3c00-ac2c-11eb-9e9d-65bf41ffc4a8.png)


<h1><b>#Step 2: Trimming Files with Trimmomatic </b></h1>
From this point onward, we decided to only use the files associated with Wing2, Wing3, Pronotum, and Abdomen instead of using all the files available. Once quality control had finished, we ran Trimmomatic on the FastQC files for the aformentioned body regions. Trimmomatic would serve to remove the adapter sequences and other low-quality areas. 

![image](https://user-images.githubusercontent.com/44265751/116928382-fbeab900-ac2a-11eb-8dd7-58ae36c96b23.png)
![image](https://user-images.githubusercontent.com/44265751/116928419-0b6a0200-ac2b-11eb-8d1a-e961253c2946.png)

<b><h1>#Step 3:<i> de novo</i> Assembly with Trinity </b></h1>
We used Trinity to assemble our transcriptome. When running, we split our files in half and ran separately. 

<b><h1>#Step 4: Concatenate Asseblies for Refernce Transcriptome </b></h1>

<b><h1>#Step 5: Identify Coding Regions using <i>Transdecoder</i> and <i>hmer</i></b></h1>

<b><h1>#Step 6: Concatenate Asseblies for Refernce Transcriptome </b></h1>

