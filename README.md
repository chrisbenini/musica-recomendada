# Sistema de Recomendação de Música com Neo4j

Este projeto implementa um sistema de recomendação de músicas utilizando grafos no Neo4j para identificar padrões de escuta e sugerir novas faixas aos usuários.

## 🎧 Modelagem do Grafo

### Nós criados:
- Usuário
- Música
- Artista
- Gênero

### Relacionamentos utilizados:
- OUVIDO
- OUVIU
- GOSTEI
- GOSTAVA
- SEGUE
- BY_ARTIST
- IN_GENRE

## 🔍 Consultas de Recomendação

### 1️⃣ Recomendar músicas por gênero
```cypher
MATCH (u:User {name: "Alice"})-[:OUVIU|:OUVIDO|:GOSTEI|:GOSTAVA]->(m:Music)
MATCH (m)-[:IN_GENRE]->(g:Genre)<-[:IN_GENRE]-(rec:Music)
WHERE rec <> m
RETURN DISTINCT rec.title AS recomendacao, g.name AS genero;
```

### 2️⃣ Recomendar artistas seguidos por usuários semelhantes
```cypher
MATCH (u:User {name: "Alice"})-[:OUVIU|:OUVIDO]->(m:Music)
MATCH (m)<-[:OUVIU|:OUVIDO]-(other:User)
MATCH (other)-[:SEGUE]->(a:Artist)
WHERE other <> u
RETURN DISTINCT a.name AS artista_recomendado;
```

3️⃣ Recomendar músicas escutadas por usuários parecidos
```cypher
MATCH (u:User {name: "Alice"})-[:OUVIU|:OUVIDO]->(m:Music)
MATCH (m)<-[:OUVIU|:OUVIDO]-(other:User)
MATCH (other)-[:OUVIU|:OUVIDO]->(rec:Music)
WHERE rec <> m AND other <> u
RETURN DISTINCT rec.title AS musica_recomendada;
```
