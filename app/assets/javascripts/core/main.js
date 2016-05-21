
var sum1 = function(a){
  var summ = a;
  var f = function(b){
    if (b){
      summ += b;
      return f;
    }else{
      return summ;
    }
  };
  return f;
};

var sum2 = function(a){
  var summ = a;
  var f = function(b){
    summ += b;
    return f;
  }
  f.toString = function(){
    return summ;
  };
  return f;
};

