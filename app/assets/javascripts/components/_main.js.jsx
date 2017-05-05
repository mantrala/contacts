var Main = React.createClass({
  render() {
    return (
      <div>
        <Header />
        <Body contacts={this.props.contacts}/>
      </div>
    )
  }
});