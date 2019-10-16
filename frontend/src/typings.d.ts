// Declare some globals
// to work around previously magical global constants
// provided by typings@global

/// <reference path="../node_modules/@types/jquery/index.d.ts" />
/// <reference path="../node_modules/@types/jqueryui/index.d.ts" />

declare global {
  interface JQuery {
  }
}

export {};
