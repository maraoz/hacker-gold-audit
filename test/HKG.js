contract('HKG', function(accounts) {
  it("test price curve", function(done) {
    HKG.new().then(function(hkg) {
      var promise = Promise.resolve();
      for (var T=1476971000; T<1482416200; T += 5432) {
        (function() {
          var t = T;
          promise = promise.then(function() {
            return hkg.getPrice(t).then(function(p) {
              console.log(t, 1000/parseInt(p.toString()));
            });
          })
        })()
      }
      promise.then(done)
    })
  });
});
