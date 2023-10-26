import test from 'ava';

import { kinit } from '../index.js';

test('kinit is a function', (t) => {
  t.is(typeof kinit, 'function');
})
