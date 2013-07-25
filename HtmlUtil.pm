package HtmlUtil;

#function defined........................

#$html: a html content
#$attr: attribute name
#$attr_regex: a pattern of attr value
sub get_elements_by_attr_regex{
	my ($html, $attr, $attr_regex) = @_;
	my $tree = new HTML::TreeBuilder;
	$tree->parse_content($html);
	my @list = $tree->look_down($attr, $attr_regex);
	return @list;
}



#$html: a html content
#$idvalue: id value
#
sub get_element_by_id{
	my ($html, $idvalue) =@_;
	my $tree = new HTML::TreeBuilder;
	$tree->parse_content($html);
	my @list = $tree->look_down('id',$idvalue);
	die "not unique element by id:$idvalue" if scalar(@list) != 1;
	return $list[0];
}

#$html: a html content
#$tagname: tag name
#
sub get_elements_by_tag_name{
	my ($html, $tagname) =@_;
	my $tree = new HTML::TreeBuilder;
	$tree->parse_content($html);
	return $tree->find_by_tag_name($tagname);
}

#$html: a html string
#$tag:  tag name
#$attr: attr name
#$attr_regex: attr value pattern
sub get_elements{
	my ($html, $tag, $attr, $attr_regex) = @_;
	my @list = get_elements_by_attr_regex($html, $attr, $attr_regex);
	$tag = lc $tag;
	@list = grep $_->tag() eq $tag, @list;
	return @list;
}

1;