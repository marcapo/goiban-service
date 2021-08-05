package main

import (
	"encoding/json"
	"net/http"

	"github.com/julienschmidt/httprouter"
	"github.com/marcapo/goiban"
)

func countryCodeHandler(w http.ResponseWriter, r *http.Request, _ httprouter.Params) {
	w.Header().Add("Content-Type", "application/json; charset=utf-8")
	// Allow CORS
	w.Header().Set("Access-Control-Allow-Origin", "*")

	data, err := json.Marshal(goiban.COUNTRY_TO_CC_MAP)
	if err != nil {
		w.WriteHeader(http.StatusInternalServerError)
		r.Body.Close()
		return
	}

	w.WriteHeader(http.StatusOK)
	w.Write(data)
}
