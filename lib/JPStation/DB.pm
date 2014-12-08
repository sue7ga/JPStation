package JPStation::DB;
use strict;
use warnings;
use utf8;
use parent qw(Teng);

__PACKAGE__->load_plugin('Count');
__PACKAGE__->load_plugin('Replace');
__PACKAGE__->load_plugin('Pager');

sub insert_stations{
  my($self,$stations) = @_;
 $self->insert('stations',{stations => $stations});
}

sub latest_stations{
 my($self) = @_;
 my ($row) = $self->search(
   'stations',
    {},
    {order_by => {'id' => 'DESC'},limit => 1}
 );
 return $row->get_column('stations') if ($row);
}

1;
