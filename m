Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6BB3EA96A
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 10:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783332455; cv=none; b=SPj0QrkaNdTEHPIQvW/JTCQ/emYB1EXRYEDauEMBUGs4tvxjrA8qdushA6quxNfZUdUr8fCQNM+qtCaYTLU5iIGiYpTY6b2WYrQD7vllmbBmH/5JT65FPg9vnSwJ+CIESWh5LcvZFOzxxP7ibbGjV5a0TfjEiUZsX4wMdEiIbhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783332455; c=relaxed/simple;
	bh=gGQbDDlCgq0v97zvtGWQurkbSBx8T7gKSXw7C7V5a6o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PguQezqC74rrI3i2Ublwd8KwA2/7JexocnEX9U/rxY4kpS0kEvmBATr9kKw2kvkt3qWm/73BTXrdcoEG869L/P5KQT+ebcYLJPT0qespvevzW1YKu/F+qRQwJQ7sJ1s2Q2W4CEGv4VFpONlxVlDflTKIZI3Dy2EDonC4oUfe54U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oLkPpPjV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oLkPpPjV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CFA31F000E9;
	Mon,  6 Jul 2026 10:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783332454;
	bh=tF7KE1NzIjedzC/JfgAB4+1t2DeBFeLEYvL7gS9jeKc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oLkPpPjV+6TLkKOKxq8dx7A+m9dZxxw/eGBOjvhZOZdImmdVzRWVAGF7XzhqYaVbh
	 rsiWx+aEzVU4m9Zc9GpLOuRGNe18EXGeaSFY+50CBR8lfSkJ7Wvy6NmSt0GFtSDb5D
	 7DEVncvLjXi1P5HQlhz9QQ/3wKJtvb0IqmRFz2jzi1GMaZhBT+FdxuTzR/Z5OMfcRN
	 hUrKQAGAQYv2Y/CotKNdrEef7khc2NxxtyysQEgjGYetibkKo3N0uQXcGjmDZwFIg5
	 az8mhJguntctbimMcL+CZtD9uEWqL4/FmDnQsyCD97Gpx2mx/ovFiTMTBChrWx79CK
	 r9VY7QFH58REw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] of/address: Fix NULL bus dereference in
 of_pci_range_parser_one()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Carlo Caione" <ccaione@baylibre.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260706095651.48839-1-ccaione@baylibre.com>
References: <20260706095651.48839-1-ccaione@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 06 Jul 2026 10:07:33 +0000
Message-Id: <20260706100734.1CFA31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] A malformed device tree with zeroed address and size cells causes =
a division by zero in `of_range_count()`, leading to a kernel panic during =
boot.

Pre-existing issues:
- [High] Implicit casting of `u32` to `int` in cell count functions allows =
negative cell counts, resulting in out-of-bounds memory accesses.
--

commit 6df2fc2d90abec7428c67623972602133d111e3d
Author: Carlo Caione <ccaione@baylibre.com>

of/address: Fix NULL bus dereference in of_pci_range_parser_one()

This commit avoids a NULL pointer dereference by rejecting nodes without a
valid bus in parser_init(). It also explicitly guards the DMA limit walk
with a check to of_range_count().

> diff --git a/drivers/of/address.c b/drivers/of/address.c
> index cf4aab11e9b1f..b57b1adbad44a 100644
> --- a/drivers/of/address.c
> +++ b/drivers/of/address.c

[ ... ]

> @@ -792,7 +799,7 @@ struct of_pci_range *of_pci_range_parser_one(struct o=
f_pci_range_parser *parser,
>  	int na =3D parser->na;
>  	int ns =3D parser->ns;
>  	int np =3D parser->pna + na + ns;
> -	int busflag_na =3D parser->bus->flag_cells;
> +	int busflag_na;
> =20
>  	if (!range)
>  		return NULL;
> @@ -800,6 +807,8 @@ struct of_pci_range *of_pci_range_parser_one(struct o=
f_pci_range_parser *parser,
>  	if (!parser->range || parser->range + np > parser->end)
>  		return NULL;

[Severity: High]
This is a pre-existing issue, but could a malformed Device Tree with large
cell counts cause an out-of-bounds read here?

If a device tree provides a very large unsigned value like 0x80000000 for
address or size cells, the count becomes negative due to the implicit cast
in of_bus_n_addr_cells():

drivers/of/base.c:of_bus_n_addr_cells() {
    u32 cells;
    ...
    if (!of_property_read_u32(np, "#address-cells", &cells))
        return cells;
}

Because np (pna + na + ns) becomes negative, the bounds check
parser->range + np > parser->end is bypassed. This negative value is then
passed to of_read_number(), which uses a post-decrement loop:

include/linux/of.h:of_read_number() {
    ...
    for (; size--; cell++)
        ...
}

Will this cause the loop to execute excessively and read memory beyond the
allocated buffer?

[ ... ]

> @@ -976,8 +985,8 @@ phys_addr_t __init of_dma_get_max_cpu_address(struct =
device_node *np)
>  		np =3D of_root;
> =20
>  	ranges =3D of_get_property(np, "dma-ranges", &len);
> -	if (ranges && len) {
> -		of_dma_range_parser_init(&parser, np);
> +	if (ranges && len && !of_dma_range_parser_init(&parser, np) &&
> +	    of_range_count(&parser)) {

[Severity: High]
Does this new call to of_range_count() trigger a division by zero if the
device tree explicitly zeroes the address and size cells?

If a malformed device tree sets #address-cells and #size-cells to 0 on a
node and its parent, the parser fields na, pna, and ns will all be 0.
When of_range_count() is called, it performs an unchecked division:

include/linux/of_address.h:of_range_count() {
    ...
    return (parser->end - parser->range) / (parser->na + parser->pna + pars=
er->ns);
}

Since the sum of the cells is 0, will this result in a kernel panic during
boot or device hotplug?

>  		for_each_of_range(&parser, &range)
>  			if (range.cpu_addr + range.size > cpu_end)
>  				cpu_end =3D range.cpu_addr + range.size - 1;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706095651.4883=
9-1-ccaione@baylibre.com?part=3D1
