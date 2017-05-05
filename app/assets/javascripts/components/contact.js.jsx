var Contact = React.createClass({
  onDelete: function(id) {
    this.props.onDeleteHandler(id);
  },

  render() {
    return (
       <tr>
        <td>{this.props.data.first_name}</td>
        <td>{this.props.data.last_name}</td>
        <td>{this.props.data.phone_number}</td>
        <td>{this.props.data.email_address}</td>
        <td>{this.props.data.company_name}</td>
        <td onClick={this.onDelete.bind(this, this.props.data.id)}>
          <button type="button" className="btn btn-danger" >Delete</button>
        </td>
       </tr>
    );
   }
});