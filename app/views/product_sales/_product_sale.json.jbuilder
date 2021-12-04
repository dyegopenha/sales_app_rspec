json.extract! product_sale, :id, :sale_id, :product_id, :value, :quantity, :created_at, :updated_at
json.url product_sale_url(product_sale, format: :json)
