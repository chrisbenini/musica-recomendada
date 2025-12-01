// Recomendação por gênero
MATCH (u:User {name: "Alice"})-[:OUVIU|:OUVIDO|:GOSTEI|:GOSTAVA]->(m:Music)
MATCH (m)-[:IN_GENRE]->(g:Genre)<-[:IN_GENRE]-(rec:Music)
WHERE rec <> m
RETURN DISTINCT rec.title AS recomendacao, g.name AS genero;

// Recomendação de artistas
MATCH (u:User {name: "Alice"})-[:OUVIU|:OUVIDO]->(m:Music)
MATCH (m)<-[:OUVIU|:OUVIDO]-(other:User)
MATCH (other)-[:SEGUE]->(a:Artist)
WHERE other <> u
RETURN DISTINCT a.name AS artista_recomendado;

// Recomendação de músicas
MATCH (u:User {name: "Alice"})-[:OUVIU|:OUVIDO]->(m:Music)
MATCH (m)<-[:OUVIU|:OUVIDO]-(other:User)
MATCH (other)-[:OUVIU|:OUVIDO]->(rec:Music)
WHERE rec <> m AND other <> u
RETURN DISTINCT rec.title AS musica_recomendada;
