# Means Plot for Publication ---------------------------------------------------
if(!require(jtools)) {
  install.packages("jtools")
}
# run `reanalysis_on_emotional_effects_of_music_in_various_audio_formats.qmd` to
# code chunk `descriptives` to obtain data.frame `descriptives`.
means_plot <- ggplot(data = descriptives %>% group_by(format),
       mapping = aes(x = factor, y = M, group = format, color = format)) +
  geom_errorbar(aes(ymin = CI_LL, ymax = CI_UL),
                width = .3,
                position = "dodge") +
  geom_path(aes(group = format, linetype = format),
            position = position_dodge(width = .3)) +
  geom_point(aes(shape = format),
             position = position_dodge(width = .3)) +
  jtools::theme_apa() +
  #theme_pubr() +
  theme(legend.position = c(.99,.01),
        panel.grid.major.y = element_line(colour = "lightgray", linetype = 3),
        legend.justification = c(1,0)) +
  xlab("GEMS Factor") +
  theme(axis.text = element_text(size = 8)) +
  scale_y_continuous(name = "Mean", limits = c(1.8,3.2),
                     breaks = seq(from = 1.8, to = 3.2, by = 0.2)) +
  labs(linetype = "Format",
       color = "Format",
       shape = "Format")
ggsave(filename = "results/means_plot.svg",
       plot = means_plot,
       device = "svg",
       units = "mm",
       width = 171,
       height = 90) # edit this file in Inkscape to expose linetype in legend

# run `reanalysis_on_emotional_effects_of_music_in_various_audio_formats.qmd` to
# code chunk `error plot` to obtain the object `transcendence_anova_afex`
transcendence_error_plot <-
  afex_plot(transcendence_anova_afex,
            x = "format",
            data_plot = FALSE,
            error = "within",
            error_ci = TRUE,
            error_level = .95,
            error_arg = list(width = .1),
            emmeans_arg = list(model = "univariate")) +
  jtools::theme_apa() +
  theme(panel.grid.major.y = element_line(colour = "lightgray", linetype = 3)) +
  ylim(2.4, 3.2) +
  ylab("Transcendence") +
  scale_x_discrete(name = "Format",
                   labels = c("stereo" = "Stereo",
                              "surround" = "Surround",
                              "auro" = "Auro-3D"))
ggsave(filename = "results/transcendence_error_plot.svg",
       device = "svg",
       units = "mm",
       width = 84,
       height = 84) # edit this file in Inkscape to replace "Auro.3D" by "Auro-3D"
