package JPStation::Web::C::Root;

use WebService::Heartrails::Express;

my $express = new WebService::Heartrails::Express();
use Data::Dumper;

sub home{
 my($class,$c) = @_; 
 my $stations = $c->session->get('stations');
 my $param = $c->session->get('param');
 my $stations = $express->station({line => $param->{line}});
 print Dumper $stations;
 return $c->render('index.tx',{stations => $stations});
}

sub postline{
 my($class,$c) = @_;
 my $param   = $c->req->parameters;
 $c->session->set('param' => $param);
 return $c->redirect('/');
}

1;
