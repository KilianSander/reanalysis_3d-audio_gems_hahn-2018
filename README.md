# Supplementary Materials: Added Emotional Value by Immersive 3D Audio? Reanalysis of Data from a Study by Hahn (2018) on the Emotional Effects of Music Presented in Various Audio Formats
This repository supplements the paper <q>Added Emotional Value by Immersive 3D Audio? Reanalysis of Data from a Study by Hahn (2018) on the Emotional Effects of Music Presented in Various Audio Formats</q> by Kilian Sander, Yves Wycisk, and Reinhard Kopiez.

## Files
All analyses are conducted within the Quarto document
`reanalysis_on_emotional_effects_of_music_in_various_audio_formats.qmd`.
In the rendered HTML version
`reanalysis_on_emotional_effects_of_music_in_various_audio_formats.html`
some code chunks are hidden
(predominantly those concerning the appearance of outcomes).
To correctly view the rendered HTML version, the folder
`reanalysis_on_emotional_effects_of_music_in_various_audio_formats_files`
must be present in the same directory.

`data/` contains all data sets used in the analyses:

* original data set from Hahn (2018) in wide format (`data_raw.Rda` and `data_raw.csv`).
* sociodemographics of Hahn's (2018) sample (`sociodemographics.Rda` and `sociodemographics.csv`)
* filtered data set with calculated scores in wide format (`data_filtered.Rda` and `data_filtered.csv`)
* outlier-adjusted data set from Wycisk et al. (2022) in long format (`imei_data_outlier_adjusted.Rda` and `imei_data_outlier_adjusted.csv`)

`inst/` contains the `apa.csl` citation style language file and the bibliography file `reanalysis_3d-audio_gems_hahn.bib` which is formatted according to biblatex-apa. They are used for citations in the Quarto document.

`results/` contains some intermediate results and plots, e.g., the output of the multivariate analysis of variance (`rm_manova.Rda`).

## License
<a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-sa/4.0/80x15.png" /></a><br />The original data set, the sociodemographics, and the filtered data set are licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/">Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License</a>.

## References
Hahn, E. (2018, July 6&#8211;9). *Musical emotions evoked by 3D audio* [Conference paper]. AES Conference on Spatial Reproduction, Tokyo, Japan. http://www.aes.org/e-lib/browse.cfm?elib=19640

Wycisk, Y., Sander, K., Kopiez, R., Platz, F., Preihs, S., & Peissig, J. (2022). Wrapped into sound: Development of the Immersive Music Experience Inventory (IMEI). *Frontiers in Psychology*, *13*, Article 951161. https://doi.org/10.3389/fpsyg.2022.951161

