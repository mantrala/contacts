var Main = React.createClass({
  getInitialState() {
    return { contacts: this.props.contacts, asc: true };
  },

  onFilterHandler: function(value) {
    var filterContacts = this.props.contacts.filter(function(contact) {
      return contact.email_address.includes(value);
    });

    this.setState({ contacts: filterContacts });
  },

  onSort: function() {
    var sortedContacts = this.props.contacts.sort(function(a, b) {
      var comp = 0;
      if (a.email_address > b.email_address) {
        comp = 1;
      } else if (a.email_address < b.email_address) {
        comp = -1;
      }

      return !this.state.asc ? comp : (comp * -1);
    }.bind(this));

    this.setState({ 
      contacts: sortedContacts,
      asc: !this.state.asc
    });
  },

  render() {
    return (
      <div className="container">
        <Search onFilter={this.onFilterHandler}/>

        <div>
          <p>Total contacts: {this.state.contacts.length}</p>
        </div>

        <ContactList contacts={this.state.contacts} onSort={this.onSort} />
      </div>
    )
  }
});