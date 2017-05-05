var Body = React.createClass({
  render() {
    return (
      <div className="container">
        <ContactList contacts={this.props.contacts} />
      </div>
    )
  }
});