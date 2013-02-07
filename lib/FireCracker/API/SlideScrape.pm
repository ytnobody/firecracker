package FireCracker::API::SlideScrape;
use strict;

sub new {
    my ( $class ) = @_;
    bless sub {
        my ( $content ) = @_;
        my $data = {};
        ( $data->{doc} ) = $content =~ /<meta name="og_image" property="og:image" .* content="http:\/\/image.slidesharecdn.com\/(.+?)\/.*" \/>/;
        ( $data->{title} ) = $content =~ /<meta name="og_title" property="og:title" .* content="(.+)" \/>/;
        ( $data->{description} ) = $content =~ /<meta name="og_description" property="og:description" .* content="(.+)" \/>/;
        ( $data->{author} ) = $content =~ /<a href=".+" class="j-tooltip h-author-name notranslate" title=".+">(.+)<\/a>/;
        return $data;
    }, $class;
}

1;
