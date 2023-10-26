# `node-rs-krb5`

![CI](https://github.com/tamascsaba/node-rs-krb5/workflows/CI/badge.svg)
[![install size](https://packagephobia.com/badge?p=node-rs-krb5)](https://packagephobia.com/result?p=node-rs-krb5)
[![Downloads](https://img.shields.io/npm/dm/node-rs-krb5/canvas.svg?sanitize=true)](https://npmcharts.com/compare/node-rs-krb5/?minimal=true)

Prebuilt node kerberus native binding written by pure rust.
It is based on node-krb5 (huge thx for @gboutry 🙏), but you don't need to compile the library.
`node-rs-krb5` uses NAPI-RS, which is a Rust based framework for building pre-compiled Node.js addons.
We are supporting all the main platforms (mac, linux, windows) and CPU architectures (arm64, x64).

# Features
- 👷‍♂️ Prebuilt for all the main platforms (Mac, Linux, Windows)
- 🤘 You don't need to intstall python, xcode or visual studio compile chain
- 📝 TypeScript type defininition support
- 🚀 Bring native performance for Node.js
- 🦺 Memory safe, guaranteed by Rust compiler
- 🍳 Similar API than [krb5](https://www.npmjs.com/package/krb5) node package

# Install

```bash
yarn add node-rs-krb5
npm install -S node-rs-krb5
```

# Support matrix

|                       | node18 | node20 | node21 |
| --------------------- | ------ | ------ | ------ |
| Windows x64           | ✓      | ✓      | ✓      |
| macOS x64             | ✓      | ✓      | ✓      |
| macOS arm64 (m chips) | ✓      | ✓      | ✓      |
| Linux x64 gnu         | ✓      | ✓      | ✓      |
| Linux arm64 gnu       | ✓      | ✓      | ✓      |

## Requirements of the usage

You need to install the MIT Kerberos library.

* Mac
  ```
  brew install krb5
  ```

* Linux
  ```
  pacman -S krb5
  yum install -y krb5-libs
  apt-get install libkrb5-3
  ```

* Windows
  ```
  choco install mitkerberos --install-arguments="ADDLOCAL=all"
  ```

# Usage

```js
import { kinit, spnego } from 'node-rs-krb5';

kinit({
  principal: 'admin',
  password: 'adm1n_p4ssw0rd',
  realm: 'KRB.LOCAL',
  ccname: '/tmp/customcc'
}).then(ccname => {
  console.log('Credentials saved in', ccname);
  return spnego({
    hostbased_service: 'HTTP@m01.krb.local'
  });
}).then(token => {
  console.log('SPNEGO token :', token);
}).catch(err => {
  console.log(err);
});

```