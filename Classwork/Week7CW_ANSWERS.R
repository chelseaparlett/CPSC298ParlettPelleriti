ggplot(UScereal, aes(calories,fibre)) +
  geom_point(aes(shape = shelf, color = vitamins)) +
  facet_wrap(~mfr) +
  geom_smooth(method = lm) +
  theme_dark() +
  ggtitle("THE BEST GRAPH EVER") +
  theme(legend.position = "bottom")