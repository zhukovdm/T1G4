# T1G4

datové formáty

## 01

- [x] Choose a domain/topic for your homework.
- [x] Create a conceptual model of that domain using UML Class Diagrams
- [x] Create a textual description of what is represented in the domain model.
- [x] Send the package for 1st review.
- [x] Implement corrections on comments after 1st review.

**Comments**

- [x] Align diagram style with the style from task description.

Solution: bold class names, attributes written with lowercase.

- [x] Replace Bus.Bus with Bus.LicensePlateNumber.

Solution: simple replace.

- [x] Align Connection.Beginning/.End with .departure/.arrival.

Solution: attributes are replaced by new "starts with", "ends with" relation.

- [x] Explain the relationship between Stop and Station. Why Stop has at least 2 stations?

Solution: Stop means úzel, which has its own id and times. Stop is mandatorily
associated with the station. Station may serve stops.

- [x] Structure textual description similar to [link](https://ofn.gov.cz/rozhraní-katalogů-otevřených-dat/2021-01-11/#třída-katalog).

Solution: restructure text into hierarchy.

## 02

- [x] Fix the conceptual model from the previous homework.
- [x] Cover conceptual model with classes and properties.
- [x] Represent the data using RDF Turtle.
- [x] Load RDF data into a triplestore to browse it.
- [ ] Develop a few meaningful executable queries using SPARQL.
- [x] Vizualize data sample in LPG with nodes, edges, properties and types.
- [x] Represent data in LPG using an executable Cypher script.
- [x] Load the LPG data into Neo4j.
- [ ] Develop a few meaningful executable queries using Cypher.
- [ ] Replace the `NPRG036-T1G4.zip` file with fixed one in SIS.
- [ ] Upload new `NPRG036-HW2-T1G4.zip` file in SIS.

**Comments**

TBA
