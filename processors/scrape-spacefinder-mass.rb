#!/usr/bin/env ruby
require 'faraday'
require 'nokogiri'
require 'csv'
require 'Indirizzo'

def print_csv(array_of_hashes)
  CSV do |csv|
    csv << array_of_hashes.first.keys
    array_of_hashes.each do |row|
      csv << row.values
    end
  end
end

titles = []
addresses = []
sqft = []
permitted_uses = []

def get_page(page_number)
  response = Faraday.get('https://mass.spacefinder.org/spaces',
                         { order_attribute: 'sortable_name',
                           order_direction: 'ASC',
                           page: page_number })
  Nokogiri::HTML(response.body)
end

(0..31).to_a.each do |page_number|
  parsed_body = get_page(page_number)
  titles.push(*parsed_body.css('.available .detail h3 a').map(&:content))
  addresses.push(*parsed_body.css('.available .detail p:first-of-type').map(&:content))
  sqft.push(*parsed_body.css('.available .detail p:nth-of-type(2)').map(&:content))
  permitted_uses.push(*parsed_body.css('.available .detail p:nth-of-type(3)').map(&:content))
end

spaces = titles.map { |title| { title: title } }

spaces.each_with_index do |space, index|
  space.merge!({ address: addresses[index],
                 municipality: Indirizzo::Address.new(addresses[index]).city.first,
                 sqft: sqft[index],
                 permitted_uses: permitted_uses[index] })
end

print_csv(spaces)
