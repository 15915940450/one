var eleContainer=document.getElementById('container');
class Test extends React.Component{
  constructor(props) {
    super(props);
    console.log(props);
  }
  render(){
    return (
      <p>hello react.</p>
    );
  }
}
ReactDOM.render(<Test />,eleContainer);
