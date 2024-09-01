// Configuración del localizador de la tienda
const CONFIGURATION = {
    "locations": [
        {
            "title": "Vicente Peñaloza 538",
            "address1": "Vicente Peñaloza 538",
            "address2": "La Paz, Bolivia",
            "coords": { "lat": -16.49177857192233, "lng": -68.15801589570083 },
            "placeId": "ChIJa9d3Au3fXpERK61K8rOJE1c"
        }
    ],
    "mapOptions": {
        "center": { "lat": 38.0, "lng": -100.0 },
        "fullscreenControl": true,
        "mapTypeControl": true,
        "streetViewControl": false,
        "zoom": 4,
        "zoomControl": true,
        "maxZoom": 19,
        "mapId": ""
    },
    "mapsApiKey": "AIzaSyBfwz8T0rSXEZE6OizpAKouJrQQX_egIPI",
    "capabilities": {
        "input": false,
        "autocomplete": false,
        "directions": false,
        "distanceMatrix": false,
        "details": false,
        "actions": false
    }
};
// Configuración y inicialización del localizador de la tienda
document.addEventListener('DOMContentLoaded', async () => {
    await customElements.whenDefined('gmpx-store-locator');
    const locator = document.querySelector('gmpx-store-locator');
    locator.configureFromQuickBuilder(CONFIGURATION);
});