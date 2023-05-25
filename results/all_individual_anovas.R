# ANOVAs for all GEMS Factors --------------------------------------------------
# Run `reanalysis_on_emotional_effects_of_music_in_various_audio_formats.qmd` to
# code chunk `long formats` to obtain the data frame `data_long_mult`.
all_individual_anovas <-
  map(gems_factors,
      function(gems_factor) {
        #
        anova_data <- data_long_mult %>%
          group_by(format) %>%
          select(participant, format, all_of(gems_factor))
        # outliers
        outliers <- anova_data %>%
          identify_outliers(!!dplyr::sym(gems_factor)) %>%
          filter(is.outlier)
        boxplot <-
          ggboxplot(data_long_mult, x = "format",
                    y = gems_factor, add = "point")
        # normality
        normality_test <- anova_data %>%
          shapiro_test(!!dplyr::sym(gems_factor))
        normality_qqplots <-
          ggqqplot(data_long_mult, gems_factor, facet.by = "format")
        # sphericity & ANOVA
        anova <-
          anova_test(data = data_long_mult,
                     dv = !!dplyr::sym(gems_factor),
                     wid = participant,
                     within = format,
                     type = 3,
                     effect.size = "pes",
                     detailed = TRUE)
        results <-
          list(gems_factor = gems_factor,
               outliers = outliers,
               boxplots = boxplot,
               normality_test = normality_test,
               normality_qqplots = normality_qqplots,
               sphericity = anova$`Mauchly's Test for Sphericity`,
               results = get_anova_table(anova))
        results
})
names(all_individual_anovas) <- gems_factors
save(all_individual_anovas,
     file = "results/all_individual_anovas.Rda")

# render Rmarkdown files for each individual ANOVA
for (gf in gems_factors) {
  rmarkdown::render("results/all_individual_anovas_report_template.Rmd",
                    params = list(gems_factor = gf),
                    output_format = "all",
                    output_file = str_c("ANOVA_", gf))
}
