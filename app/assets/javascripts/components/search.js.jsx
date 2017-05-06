var Search = React.createClass({
  search: function() {
    var searchValue = this.refs.search.value.trim();

    this.props.onFilter(searchValue);
  },

  render() {
    return (
      <div className="form-group row">
        <div className="col-xs-4"> 
          <input ref="search" placeholder="Filter by email" value={this.props.filterText} className="form-control" onChange={this.search} />
        </div>
      </div>
    )
  }
});