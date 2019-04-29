<html>
  <body>
    <h2>GEOIPv1</h2>
    <?php
    echo 'country_code: '.getenv(GEOIP_COUNTRY_CODE).'<br>';
    echo 'country_code3: '.getenv(GEOIP_COUNTRY_CODE3).'<br>';
    echo 'country_name: '.getenv(GEOIP_COUNTRY_NAME).'<br>';
    echo 'city_country_code: '.getenv(GEOIP_CITY_COUNTRY_CODE).'<br>';
    echo 'city_country_code3: '.getenv(GEOIP_CITY_COUNTRY_CODE3).'<br>';
    echo 'city_country_name: '.getenv(GEOIP_CITY_COUNTRY_NAME).'<br>';
    echo 'region: '.getenv(GEOIP_REGION).'<br>';
    echo 'city: '.getenv(GEOIP_CITY).'<br>';
    echo 'postal_code: '.getenv(GEOIP_POSTAL_CODE).'<br>';
    echo 'city_continent_code: '.getenv(GEOIP_CITY_CONTINENT_CODE).'<br>';
    echo 'latitude: '.getenv(GEOIP_LATITUDE).'<br>';
    echo 'longitude: '.getenv(GEOIP_LONGITUDE).'<br>';
    ?>
    <hr />
    <h2>GEOIPv2</h2>
    <?php
    echo 'country_code: '.getenv(GEOIP2_COUNTRY_ISO_CODE).'<br>';
    echo 'country_name: '.getenv(GEOIP2_COUNTRY).'<br>';
    echo 'region: '.getenv(GEOIP2_REGION_NAME).'<br>';
    echo 'city: '.getenv(GEOIP2_CITY).'<br>';
    echo 'postal_code: '.getenv(GEOIP2_POSTAL_CODE).'<br>';
    echo 'city_continent_code: '.getenv(GEOIP2_CONTINENT_CODE).'<br>';
    echo 'latitude: '.getenv(GEOIP2_LATITUDE).'<br>';
    echo 'longitude: '.getenv(GEOIP2_LONGITUDE).'<br>';
    echo 'country in eu: '.getenv(GEOIP2_COUNTRY_IN_EU).'<br>';
    echo 'location accuracy radius: '.getenv(GEOIP2_LOCATION_ACCURACY_RADIUS).'<br>';
    echo 'registered country code for IP: '.getenv(GEOIP2_REGISTERED_COUNTRY_ISO).'<br>';
    ?>
  </body>
</html>
