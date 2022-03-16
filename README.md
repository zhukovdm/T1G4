# T1G4

datové formáty

## 01

- [x] Choose a domain/topic for your homework.
- [x] Create a conceptual model of that domain using UML Class Diagrams
- [x] Create a textual description of what is represented in the domain model.
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
