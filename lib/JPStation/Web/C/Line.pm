package JPStation::Web::C::Line;
use Data::Dumper;
use utf8;
my $express = new WebService::Heartrails::Express();

sub area{
 my($class,$c) = @_;
 return $c->render('area.tx');
}

sub pref{
 my($class,$c) = @_;
 my $pref_name = $c->session->get('param');
 print Dumper $pref_name;
 my $lines = $express->line({prefecture => Encode::encode_utf8($pref_name)});
 print Dumper $lines;
 return $c->render('pref.tx',{lines => $lines});
}

sub postpref{
 my($class,$c) = @_;
 my $param = $c->req->parameters;
 $c->session->set('param' => $param->{pref_name});
 return $c->redirect('/pref');
}

sub station{
 my($class,$c) = @_;
 my $param = $c->session->get('station'); 
my $stations = $express->station({name => $param->{name}});
 return $c->render('station.tx',{stations => $stations});
}
 
sub poststation{
 my($class,$c) = @_;
 my $param = $c->req->parameters;
 $c->session->set('station' => $param);
 return $c->redirect('/station');
}


1;
