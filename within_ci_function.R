# This function calculates confidence intervals for within-subjects designs
# see Cosineau & O'Brien (2014) for details
within_ci <- function(data,
                      subject,
                      condition,
                      score,
                      alpha = 0.05) {
  n <- length(unique(data[[subject]]))
  overall_mean <- mean(data[[score]])
  subject_means <- data %>% dplyr::ungroup() %>%
    dplyr::group_by(!!dplyr::sym(subject)) %>%
    dplyr::summarise(subject_mean = mean(!!dplyr::sym(score)))
  data$normalized_scores <- 
    purrr::pmap_dbl(list(score = data[[score]],
                         subject = data[[subject]]),
                    function(score, subject) {
                      score -
                        subject_means$subject_mean[subject_means$participant == subject] +
                        overall_mean
                    })
  t_quantile <- qt(p = alpha / 2,
                   df = n - 1)
  correction_factor <- sqrt(
    length(unique(data[[condition]])) / (length(unique(data[[condition]])) - 1)
  )
  ci <- data %>%
    dplyr::ungroup() %>%
    dplyr::group_by(!!dplyr::sym(condition)) %>%
    dplyr::summarise(M = mean(!!sym(score)),
                     SE = sd(normalized_scores) / sqrt(n),
                     alpha = alpha,
                     CI_LL = M + SE * correction_factor * t_quantile,
                     CI_UL = M - SE * correction_factor * t_quantile,
                     variable = score) %>%
    dplyr::relocate(variable)
  ci
}
