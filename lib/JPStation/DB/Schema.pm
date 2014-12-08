package JPStation::DB::Schema;
use strict;
use warnings;
use utf8;

use Teng::Schema::Declare;

base_row_class 'JPStation::DB::Row';

table {
    name 'stations';
    pk 'id';
    columns qw(id line stations);
};

1;
