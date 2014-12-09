package JPStation::Web::C::Line;
use Data::Dumper;
use utf8;
my $express = new WebService::Heartrails::Express();

sub area{
 my($class,$c) = @_;
 my $param = $c->req->parameters;
 my $area_name = $c->session->get('param');
 my $lines = $express->line({area => Encode::encode_utf8($area_name)});
 return $c->render('area.tx',{lines => $lines});
}

sub postarea{
 my($class,$c) = @_;
 my $param = $c->req->parameters;
 $c->session->set('param' => $param->{area_name});
 return $c->redirect('/area');
}

sub pref{
 my($class,$c) = @_;
 my $pref_name = $c->session->get('param');
 my $lines = $express->line({prefecture => Encode::encode_utf8($pref_name)});
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

sub search{
 my($class,$c) = @_;
 my $line_name = $c->session->get('param');
 my $lines = $express->station({line => Encode::encode_utf8($line_name)});
 return $c->redirect('line.tx',{lines => $lines});
}

sub postsearch{
 my($class,$c) = @_;
 my $param = $c->req->parameters;
 $c->session->set('param' => $param->{line});
 return $c->redirect('/line');
}

1;
