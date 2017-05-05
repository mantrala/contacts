var Search = React.createClass({
  search: function(e) {
    var searchValue = this.refs.search.value.trim();
    if (searchValue.length === 0) return;

    this.props.onFilter(searchValue);
  },

  render() {
    return (
      <div className="form-group row">
        <div className="col-xs-4"> 
          <input ref="search" placeholder="Filter by email" className="form-control" onChange={this.search} />
        </div>
      </div>
    )
  }
});