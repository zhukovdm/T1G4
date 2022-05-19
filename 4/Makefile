CSV_DIR := csv
OUT_DIR := rdf

.PHONY: all

all:
	for file in data.csv-metadata.json ; \
	do \
		rdf serialize \
			--input-format tabular \
			--minimal \
			--decode-uri \
			--prefixes dbpedia-owl:https://dbpedia.org/ontology/,gtfs:http://vocab.gtfs.org/terms#,ns1:http://example.org/vocabulary/,agency:https://T1G4.DOX.cz/TransitAgency/#,producer:https://T1G4.DOX.cz/Producer/#,bus:https://T1G4.DOX.cz/Bus/#,train:https://T1G4.DOX.cz/Train/#,conn:https://T1G4.DOX.cz/Connection/#,route:https://T1G4.DOX.cz/TransitRoute/#,station:https://T1G4.DOX.cz/Station/#,stop:https://T1G4.DOX.cz/Stop/# \
			--output-format turtle \
			$(CSV_DIR)/"$$file" \
			> \
			$(OUT_DIR)/data.ttl ; \
	done
