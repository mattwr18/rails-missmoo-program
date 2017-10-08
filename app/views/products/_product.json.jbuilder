json.extract! product, :id, :name, :amount, :price, :cost, :created_at, :updated_at
json.url product_url(product, format: :json)
