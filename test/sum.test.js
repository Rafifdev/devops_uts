const sum = require("../src/sum");

test('sum must be 3', () => { 
    expect(sum(1, 2)).toBe(3);
}); 