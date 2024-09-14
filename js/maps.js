// Configuración del localizador de la tienda
const CONFIGURATION = {
    "capabilities": {
        "actions": false,
        "autocomplete": false,
        "details": false,
        "directions": false,
        "distanceMatrix": false,
        "input": false
    },
    "locations": [
        {
            "address1": "ZEQUITEX S.R.L., Vicente Peñaloza 538, La Paz",
            "address2": "Vicente Peñaloza 538, La Paz",
            "coords": {
                "lat": -16.491839267845616,
                "lng": -68.15801589570083
            },
            "placeId": "ChIJa9d3Au3fXpERK61K8rOJE1c",
            "title": "Zequitex S.R.L.",
            "plusCode": "GR5R+7R La Paz"
        }
    ],
    "mapOptions": {
        "center": {
            "lat": 38.0,
            "lng": -100.0
        },
        "fullscreenControl": true,
        "mapId": "",
        "mapTypeControl": false,
        "maxZoom": 20,
        "streetViewControl": false,
        "zoom": 4,
        "zoomControl": true
    },
    "mapsApiKey": "AIzaSyDu4O1c4frlJfK9Kjo1yAXJAaBWqJd8ZMc"
};
// Configuración y inicialización del localizador de la tienda
document.addEventListener('DOMContentLoaded', async () => {
    await customElements.whenDefined('gmpx-store-locator');
    const locator = document.querySelector('gmpx-store-locator');
    locator.configureFromQuickBuilder(CONFIGURATION);
});