# Ce script prend en entrée 'naf_brut' produit par le circuit des imports et 
# écrème toutes les entrées non souhaitées.
# Le but est de garder toutes les entrées qui permettent d'imaginer une profession
# ou des compétences, même très absconses. On évite tout ce qui contient "Autre"
# ou "n.c.a" par exemple parce que ce n'est pas clair.

# Le fichier de sortie est 

# Les rebuts sont stockés dans naf_rebut pour envisager d'y repêcher des codes
# intéressants.

naf_brut

naf_brut %>% 
  mutate(filtrage = case_when(
    lib %in% grep(x = lib, pattern = "Autre", value = T) ~ "rebut",
    T ~ "selection"
  )) -> naf_temp_select

naf_select <- naf_temp_select %>% 
  filter(filtrage == "selection") %>% 
  mutate(id = 1:nrow(.)) %>% 
  select(id, lib)

cat(glue("
    Créé le fichier 'naf_select' avec {nrow(naf_select)} lignes. 
    "))
