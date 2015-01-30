class Eurovision
	include HTTParty

	def self.getAll()
		url="https://free-ec2.scraperwiki.com/elp5xgy/af9e0331c67846e/sql/?q=select%0A%20%20%20%20country%2C%0A%20%20%20%20singer%2C%0A%20%20%20%20song%2C%0A%09youtube%20url%0Afrom%20swdata%0Aorder%20by%20semi%0Alimit%2032"
		response = HTTParty.get(url)
		body = JSON.parse(response.body)
	end
end