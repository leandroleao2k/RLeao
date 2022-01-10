function () 
{
  data.frame(data_set_name = "coronavirus_jhu", package_name = "coronavirus", 
    function_to_get_data = "refresh_coronavirus_jhu*", data_details = "The 2019 Novel Coronavirus COVID-19 (2019-nCoV) Dataset from the Johns Hopkins University Center for Systems Science and Engineering", 
    data_url = "https://systems.jhu.edu/research/public-health/ncov/", 
    license_url = "https://github.com/CSSEGISandData/COVID-19/", 
    data_types = "cases_new, recovered_new, deaths_new", 
    location_types = "country, state", spatial_extent = "global", 
    has_geospatial_info = TRUE)
}
