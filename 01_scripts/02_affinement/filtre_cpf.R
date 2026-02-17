cpf_brut %>% 
  mutate(filtrage = case_when(
    lib %in% grep(x = lib, 
                  pattern = "Autre|Opération|Services|Acheminement|
                  Collecte|Commerce|Contrôle|Développement|Enseignement|Entretien|
                  Espaces publicitaires|Installation|Lavage|Location|n.c.a|Parties|Production|
                  Programmation|Réassurance|Recherche|Réparation|Révision|Services|
                  Vente|Tutelle|Travaux|Transport|Impression
                  ",
                  value = T) ~ "rebut",
    T ~ "selection"
  )) -> cpf_temp_select

cpf_select <- cpf_temp_select %>% 
  filter(filtrage == "selection") %>% 
  mutate(id = 1:nrow(.)) %>% 
  select(id, lib)



cat(glue("
    Construit 'cpf_select' avec {nrow(cpf_select)} lignes.
    "))