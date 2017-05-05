var Main = React.createClass({
  getInitialState() {
    return { contacts: this.props.contacts };
  },

  onFilterHandler: function(value) {
    var filterContacts = this.props.contacts.filter(function(contact) {
      return contact.email_address.includes(value);
    });

    this.setState({ contacts: filterContacts });
  },

  render() {
    return (
      <div className="container">
        <Search onFilter={this.onFilterHandler}/>

        <div>
          <p>Total contacts: {this.state.contacts.length}</p>
        </div>

        <ContactList contacts={this.state.contacts} />
      </div>
    )
  }
});