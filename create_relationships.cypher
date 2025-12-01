MATCH (a:Artist {name: "Coldplay"}), (m:Music {title: "Yellow"})
CREATE (m)-[:BY_ARTIST]->(a);

MATCH (a:Artist {name: "Coldplay"}), (m:Music {title: "Viva la Vida"})
CREATE (m)-[:BY_ARTIST]->(a);

MATCH (a:Artist {name: "Drake"}), (m:Music {title: "God's Plan"})
CREATE (m)-[:BY_ARTIST]->(a);

MATCH (g:Genre {name: "Pop"}), (m:Music {title: "Yellow"})
CREATE (m)-[:IN_GENRE]->(g);

MATCH (g:Genre {name: "Pop"}), (m:Music {title: "Viva la Vida"})
CREATE (m)-[:IN_GENRE]->(g);

MATCH (g:Genre {name: "Rap"}), (m:Music {title: "God's Plan"})
CREATE (m)-[:IN_GENRE]->(g);

MATCH (u:User {name: "Alice"}), (m:Music {title: "Yellow"})
CREATE (u)-[:OUVIDO {vezes: 5}]->(m);

MATCH (u:User {name: "Bob"}), (m:Music {title: "Yellow"})
CREATE (u)-[:OUVIDO {vezes: 4}]->(m);

MATCH (u:User {name: "Bob"}), (m:Music {title: "God's Plan"})
CREATE (u)-[:OUVIU {vezes: 3}]->(m);

MATCH (u:User {name: "Alice"}), (m:Music {title: "Viva la Vida"})
CREATE (u)-[:GOSTEI]->(m);

MATCH (u:User {name: "Alice"}), (a:Artist {name: "Drake"})
CREATE (u)-[:SEGUE]->(a);

MATCH (u:User {name: "Bob"}), (a:Artist {name: "Coldplay"})
CREATE (u)-[:SEGUE]->(a);
