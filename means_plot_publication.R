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
        legend.justification = c(1,0)) +
  xlab("GEMS Factor") +
  theme(axis.text = element_text(size = 8)) +
  scale_y_continuous(name = "Mean", limits = c(1.8,3.2),
                     breaks = seq(from = 1.8, to = 3.2, by = 0.2)) +
  labs(linetype = "Format",
       color = "Format",
       shape = "Format")
ggsave(filename = "means_plot.svg",
       plot = means_plot,
       device = "svg",
       units = "mm",
       width = 171,
       height = 90) # edit this file in Inkscape to expose linetype in legend
