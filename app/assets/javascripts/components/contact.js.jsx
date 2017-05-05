var Contact = React.createClass({
  render() {
    return (
       <tr>
        <td>{this.props.data.first_name}</td>
        <td>{this.props.data.last_name}</td>
        <td>{this.props.data.phone_number}</td>
        <td>{this.props.data.email_address}</td>
        <td>{this.props.data.company_name}</td>
       </tr>
    );
   }
});