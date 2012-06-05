:- dynamic tipoFlores/1.

tipoFlores([moradas, amarillas, blancas, rojas, rosadas, azules, celestes]).

:- dynamic planta/1.

planta(guaria_morada) :-
	tipo('orquídea'),
	orden(orchidales),
	hojas(espiraladas),
	habitat(bosques_humedos),
	flores(moradas),
	region(guanacaste).
planta(ada_chlorops) :-
	tipo('orquídea'),
	orden(orchidales),
	hojas(eliptica),
	habitat(bosques_humedos),
	flores(amarillas),
	region(cordilleras_Tilaran).
planta(aspasia_principissa) :-
	tipo('orquídea'),
	orden(orchidales),
	hojas(eliptica),
	habitat(bosques_muy_humedos),
	flores(amarillas),
	region(huetar_norte).
planta(calanthe_calanthoides) :-
	tipo('orquídea'),
	orden(orchidales),
	hojas(eliptica),
	habitat(bosques_muy_humedos),
	flores(blancas),
	region(cordilleras_Talamanca).
planta(dimerandra_emarginata) :-
	tipo('orquídea'),
	orden(orchidales),
	hojas(liguladas),
	habitat(bosques_muy_humedo),
	flores(moradas),
	region(tilaran).
planta(dichaea_trulla) :-
	tipo('orquídea'),
	orden(orchidales),
	hojas(liguladas),
	habitat(bosques_muy_humedos),
	flores(rojas),
	region(cordillera_guanacaste).
planta(acanthocereus_tetragonus) :-
	tipo(cactus),
	orden(caryophyllales),
	hojas(no_posee),
	habitat(zonas_costeras),
	flores(blancas),
	region(peninsula_nicoya).
planta(weberocereus_bradei) :-
	tipo(cactus),
	orden(caryophyllales),
	hojas(no_posee),
	habitat(bosques_humedos),
	flores(rosadas),
	region(pacifico_central).
planta(candelabro) :-
	tipo(cactus),
	orden(caryophyllales),
	hojas(no_posee),
	habitat(bosque_seco),
	flores(rojas),
	region(peninsula_osa).
planta(opuntia_cochenillifera) :-
	tipo(cactus),
	orden(caryophyllales),
	hojas(no_tiene),
	habitat(bosque_humedos),
	flores(rojas),
	region(valle_central).
planta(cactus_de_playa) :-
	tipo(cactus),
	orden(caryophyllales),
	hojas(no_tiene),
	habitat(zonas_costeras),
	flores(amarillas),
	region(guanacaste).
planta(echinodorus_paniculatus) :-
	tipo(acuatica),
	orden(alismatales),
	hojas(hojas_erectas),
	habitat(pantanos),
	flores(blancas),
	region(guanacaste).
planta(lirio_agua) :-
	tipo(acuatica_flotante),
	orden(liliales),
	hojas(extendidas),
	habitat(lagunas),
	flores(moradas),
	region(atlantico).
planta(heteranthera_limosa) :-
	tipo(acuatica),
	orden(liliales),
	hojas(extendidas),
	habitat(lagunas),
	flores(azules),
	region(llanura_san_carlos).
planta(echinodorus_bolivianus) :-
	tipo(acuatica),
	orden(alismatales),
	hojas(emergentes),
	habitat(humedales),
	flores(rojas),
	region(canno_negro).
planta(eichhornia_heterosperma) :-
	tipo(acuatica_flotante),
	orden(liliales),
	hojas(grandes),
	habitat(lagunas),
	flores(moradas),
	region(vertiente_atlentica).
planta(limnocharis_flava) :-
	tipo(acuatica),
	orden(alismatales),
	hojas(ovaladas),
	habitat(lagunas),
	flores(amarillas),
	region(limon).
planta(adiantopsis_chlorophylla) :-
	tipo(helecho_terretre),
	orden(filicales),
	hojas(largas),
	habitat(orillas_de_rios),
	flores(no_posee),
	region(arenal).
planta(adiantopsis_radia) :-
	tipo(helechos_terrestre),
	orden(filicales),
	hojas(largas),
	habitat(orillas_de_rios),
	flores(no_posee),
	region(huetar_norte).
planta(helecho_arborescente) :-
	tipo(helechos_terrestre),
	orden(filicales),
	hojas(largas),
	habitat(claros_del_bosque),
	flores(no_posee),
	region(vertiente_norte).
planta(anogramma_leptophylla) :-
	tipo(helechos_terrestre),
	orden(filicales),
	hojas(pequenas),
	habitat(orillas_de_caminos),
	flores(no_posee),
	region(cordillera_central).
planta(cheilanthes_skinneri) :-
	tipo(helechos_terrestre),
	orden(filicales),
	hojas(redondeadas),
	habitat(suelos_ferrosos),
	flores(no_posee),
	region(norte_europa).
planta(pycnoporus_anguineus) :-
	tipo(oreja_de_palo),
	orden(poriales),
	hojas(con_picos),
	habitat(troncos_secos),
	flores(no_posee),
	region(todo_el_pais).
planta(schizophyllum_commune) :-
	tipo(oreja_de_palo),
	orden(schizophyllales),
	hojas(sin_hojas),
	habitat(madera_descompuesta),
	flores(no_posee),
	region(todo_el_pais).
planta(hydrangea_macrophylla) :-
	tipo(hortensia),
	orden(cornales),
	hojas(elipticas),
	habitat(potreros),
	flores(celestes),
	region(arenal).
planta(guatteria_diospyroides) :-
	tipo(terrestre),
	orden(magnoliales),
	hojas(simples),
	habitat(bosque_humedo),
	flores(amarillas),
	region(huetar_norte).
planta(guatteria_amplifolia) :-
	tipo(anona),
	orden(magnoliales),
	hojas(simple),
	habitat(orilla_de_rios),
	flores(amarillas),
	region(osa).
planta(unonopsis_panamensis) :-
	tipo(anona),
	orden(magnoliales),
	hojas(simple),
	habitat(bosque_humedo),
	flores(blancas),
	region(osa).
planta(stenanona_costaricensis) :-
	tipo(anona),
	orden(magnoliales),
	hojas(simple),
	habitat(bosque_muy_humedo),
	flores(rojas),
	region(huetar_norte).
planta(cecropia_obtusifolia) :-
	tipo(guarumo),
	orden(urticales),
	hojas(haz_aspera),
	habitat(bosque_muy_humedo),
	flores(blancas),
	region(valle_central).
planta(cecropia_peltata) :-
	tipo(guarumo),
	orden(urticales),
	hojas(haz_aspera),
	habitat(bosque_seco),
	flores(rojas),
	region(valle_central).
planta(cecropia_insignis) :-
	tipo(guarumo),
	orden(urticales),
	hojas(haz_lisa),
	habitat(bosque_humedo),
	flores(no_posee),
	region(corcobado).
planta(alfaroa_costaricensis) :-
	tipo(gualin),
	orden(fagales),
	hojas(alargada),
	habitat(bosque_muy_humedo),
	flores(blancas),
	region(tilaran).
planta(anacardium_occidentale) :-
	tipo(marannon),
	orden(sapindales),
	hojas(obovada),
	habitat(bosque_humedo),
	flores(amarillas),
	region(huetar_norte).
planta(cavendishia_callista) :-
	tipo(colmillo),
	orden(ericales),
	hojas(elipticas),
	habitat(bosque_muy_humedo),
	flores(rosadas),
	region(guanacaste).
planta(cannabis_sativa) :-
	tipo(marihuana),
	orden(urticales),
	hojas(anchas),
	habitat(bosque_humedo),
	flores(amarillas),
	region(talamanca).

