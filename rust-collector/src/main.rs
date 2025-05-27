use reqwest;
use serde::Deserialize;

#[derive(Debug, Deserialize)]
struct PriceResponse {
    bitcoin: Currency,
    ethereum: Currency,
}

#[derive(Debug, Deserialize)]
struct Currency {
    usd: f64,
}

#[tokio::main]
async fn main() -> Result<(), Box<dyn std::error::Error>> {
    let url = "https://api.coingecko.com/api/v3/simple/price?ids=bitcoin,ethereum&vs_currencies=usd";

    let response = reqwest::get(url)
        .await?
        .json::<PriceResponse>()
        .await?;

    println!("Preço do Bitcoin: ${}", response.bitcoin.usd);
    println!("Preço do Ethereum: ${}", response.ethereum.usd);

    Ok(())
}
