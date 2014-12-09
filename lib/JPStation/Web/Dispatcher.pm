package JPStation::Web::Dispatcher;
use strict;
use warnings;
use utf8;
use Amon2::Web::Dispatcher::RouterBoom;

use Module::Find;

useall 'JPStation::Web::C';
base 'JPStation::Web::C';

get '/station' => "Line#station";
post '/station/line' => "Line#poststation";

#area
get '/area' => "Line#area";

post '/line/area' => "Line#postarea";

#pref
get '/pref' => "Line#pref";

post '/line/pref' => "Line#postpref";

#linesearch

get '/line' => "Line#search";

post '/post/line' => "Line#postsearch";


1;
