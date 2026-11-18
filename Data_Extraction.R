pacman::p_load("data.table", "httr2", "jsonlite")

# Specify API url and key
url <- "https://api.transport.nsw.gov.au/v1/carpark"
api_key <- Sys.getenv("TFNSW_API_KEY")

# Add request headers
API_request <- req_headers(
  request(url),
  accept = "application/json",
  Authorization = paste("apikey", api_key)
)

# Perform API request
API_response <- req_perform(API_request)

# Import JSON response
API_data <- resp_body_json(
  API_response,
  simplifyVector = FALSE
)
