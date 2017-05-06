var Main = React.createClass({
  getInitialState() {
    return { contacts: this.props.contacts, asc: true, filterText: '' };
  },

  onFilterHandler: function(value) {
    this.setState({filterText: value});
  },

  onDeleteHandler: function(id) {
    $.ajax({
        url: `/contacts/${id}`,
        type: 'DELETE',
        success: function() {
          this.removeContact(id);
        }.bind(this)
    });
  },

  removeContact(id) {
    var newContacts = this.state.contacts;
    newContacts = newContacts.filter(function(contact) {
      return contact.id != id;
    });

    this.setState({ contacts: newContacts });
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
        <Search onFilter={this.onFilterHandler} filterText={this.state.filterText}/>

        <div>
          <p>Total contacts: {this.state.contacts.length}</p>
        </div>

        <ContactList contacts={this.state.contacts} onSort={this.onSort} onDeleteHandler={this.onDeleteHandler} filterText={this.state.filterText} />
      </div>
    )
  }
});