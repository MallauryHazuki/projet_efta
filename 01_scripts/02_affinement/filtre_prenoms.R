prenoms <- prenoms_brut %>%
  select(prenom) %>% 
  unique() %>% 
  mutate(id = 1:nrow(.)) %>% 
  rename(lib = prenom) %>% 
  select(id, lib)

prenoms_hors_hapax <- prenoms_brut %>%
  filter(valeur > 5) %>% 
  select(prenom) %>% 
  unique() %>% 
  mutate(id = 1:nrow(.)) %>% 
  rename(lib = prenom) %>% 
  select(id, lib)

q <- 0.01

prenoms_top_quantile_q <- prenoms_brut %>% 
  group_by(prenom) %>% 
  summarise(freqtot = sum(valeur), .groups = "drop") %>% 
  arrange(desc(freqtot)) %>% 
  head(round(nrow(.)*q)) %>% 
  mutate(id = 1:nrow(.)) %>% 
  rename(lib = prenom) %>% 
  select(id, lib)
  
