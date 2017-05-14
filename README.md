##### Requirements

- Built in Ruby on Rails.
- Allow a user to upload a comma-delimited file of contacts via a web form. The
  file will contain the following columns: `first_name`, `last_name`, `email_address`,
  `phone_number`, `company_name`. There's an example file included (data.csv).
- Parse the given file, normalize the data, and store the information in a
  relational database.
- Display the list of contacts and their data.
- Accompanying specs written in [Rspec](https://github.com/rspec/rspec-core)
- Allow deleting specific contacts via Ajax (ideally using React).
- Allow the list of contacts to be filtered via Javascript to show:
  - Only contacts with `.com` email addresses
  - Order the contacts alphabetically by email address
