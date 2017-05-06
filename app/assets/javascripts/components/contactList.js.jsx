var ContactList = React.createClass({
  displayContacts: function() {
    var filterText = this.props.filterText;
    return this.props.contacts.map(function(contact) {
      if (contact.email_address.indexOf(filterText) === -1) {
        return;
      }

      return (
        <Contact key={contact.id} data={contact} onDeleteHandler={this.props.onDeleteHandler} />
      )
    }.bind(this));
  },

  handleSort: function() {
    this.props.onSort();
  },

  render() {
    return (
      <div>
        <table className="table">
          <thead>
            <tr>
              <th>First Name</th>
              <th>Last Name</th>
              <th>Phone Number</th>
              <th onClick={this.handleSort} role="button" className="text-primary">Email</th>
              <th>Company</th>
              <th>Actions</th>
            </tr>
          </thead>
          <tbody>
            { this.displayContacts() }
          </tbody>
        </table>
      </div>
    )
  }
});