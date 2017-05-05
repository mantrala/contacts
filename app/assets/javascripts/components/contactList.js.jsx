var ContactList = React.createClass({
  displayContacts: function() {
    return this.props.contacts.map(function(item) {
      return (
        <Contact key={item.id} data={item} />
      )
    });
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