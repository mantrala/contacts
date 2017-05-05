var ContactList = React.createClass({
  getInitialState() {
    return { contacts: this.props.contacts }
  },

  displayContacts: function() {
    return this.props.contacts.map(function(item) {
      return (
        <tr key={item.id}>
          <td>{item.first_name}</td>
          <td>{item.last_name}</td>
        </tr>
      )
    });
  },

  render() {
    return (
      <div>
        <table className="table">
          <thead>
            <tr>
              <th>First Name</th>
              <th>Last Name</th>
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