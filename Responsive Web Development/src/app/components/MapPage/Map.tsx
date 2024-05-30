'use client'


import { GoogleMap, useJsApiLoader, Marker } from '@react-google-maps/api';

export interface MapPageProps {}

const MapPage = () => {
  const { isLoaded } = useJsApiLoader({
    id: 'google-map-script',
    googleMapsApiKey: "AIzaSyA5QPzQ4v_P-OPeZm4qnlYLsMhiAhjQvEI",
  });

  
  const Location = {
    lat: -27.594247, 
    lng: -48.552000, 
  };

  return (
    <div>
      {isLoaded? (
        <GoogleMap
          mapContainerStyle={{ width: '60vw', height: '50vh' }}
          center={Location} 
          zoom={1} 
        >
          
          <Marker position={Location} title="Àrea poluida" 
          options={{
                label:{
                    text: "Área contaminada",
                    className: "map-marker"
                }
          }}/>
        </GoogleMap>
      ) : (
        <></>
      )}
    </div>
  );
}

export default MapPage;
