CSV_DIR := csv
OUT_DIR := rdf

.PHONY: all

all:
	for file in data.csv-metadata.json ; \
	do \
		rdf serialize \
			--input-format tabular \
			--minimal \
			--prefixes dbpedia-owl:https://dbpedia.org/ontology/,ns1:http://example.org/vocabulary/,producer:https://T1G4.DOX.cz/Producer/#,bus:https://T1G4.DOX.cz/Bus/#,train:https://T1G4.DOX.cz/Train/#,conn:https://T1G4.DOX.cz/Connection/#,route:https://T1G4.DOX.cz/TransitRoute/# \
			--output-format turtle \
			$(CSV_DIR)/"$$file" \
			> \
			$(OUT_DIR)/out.txt ; \
	done
