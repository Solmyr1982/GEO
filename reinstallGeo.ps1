uninstall-navapp -serverinstance vtm180 -name geo
unpublish-navapp -serverinstance vtm180 -name GEO
publish-navapp -serverinstance vtm180 -skipverification -path "C:\Projects\GEO\SOL_GEO_1.0.0.0.app"
install-navapp -serverinstance vtm180 -name GEO

