Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76CCF3DCDA7
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 08:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785141975; cv=none; b=XDNyOfvXauKgnlzCOT221UgGGQc46AZSSn4yFrWhcGbqimFxnZOffiFJeVCAppfcLrZk+KPR6WQLK1kdH+8l0Lgm1GBhv04UDmQuap+KvlSN2BSnAZra/XpHxLzYKsjeTHU5wH2wYiSvBT69BTw6Nn0Ag/LSUk8NRtskwcZ3IIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785141975; c=relaxed/simple;
	bh=6DkGZD2pl8h6e5vRNV5xx4GCohM7Jza6AiuCHXxTRF8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AI21dJok5rrQikOBaOG+ABc4PxlUr3L57LAT0oaHNWV3llAwbZo8TDyUfBf9thOSc8EnNVvXkUFkR94YSzyFVhAHdN/ceor3i5Z+k37WKvOuVRr9UtATR2Uw8OJY9Sfbr1rh4vOGtrfKpMV0u0jfC9UziDd27V7tNJrIlFlw5k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fdzCw2HQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fdzCw2HQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6905B1F000E9;
	Mon, 27 Jul 2026 08:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785141974;
	bh=6DQ+WSUQEtQb3zFDSLX1hdfHXL3ux+RzuiynD2ptRR4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fdzCw2HQn3ijeP8ddt192/R64zpPtN1Zq96X2/zASnILrdookoHbqJb1qGoZtwJey
	 uoF9u8hBXVghvMwnbHbcehZhU7W1HPYv+GnQk1fQe9SiFO21t48jIKsssaLKUECrH7
	 338XwXPndFfwHrsDIPLKweZ/TmIbMBthjEhxILNZi/zQI8j44OI5MEh0l64qsNAEGQ
	 SRE56fwWC77gv23hXP8N/Tay8R2ugFWXRYbjpQLkrZI6ncA5ugOi+4xAI7aTvggNx9
	 6sTr86wgyXH9wef1ER2IbPuEoWqcjojHxEacPexyjmm+4oM6z7546474OcguNx4RaB
	 jN5g47t19wfKA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] of/address: Fix NULL bus dereference in
 of_pci_range_parser_one()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Carlo Caione" <ccaione@baylibre.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260727-of-range-parser-null-bus-v3-1-be01b708a4ce@baylibre.com>
References: <20260727-of-range-parser-null-bus-v3-1-be01b708a4ce@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 08:46:12 +0000
Message-Id: <20260727084613.6905B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] An integer overflow in the calculation of `np` (`np =3D parser->pn=
a + na + ns`) can be triggered by a maliciously crafted Device Tree with a =
large positive `#size-cells` value (e.g., `0x7FFFFFFE`). This results in a =
negative `np` which bypasses the bounds check `parser->range + np > parser-=
>end`.
--

--- Patch [1]: [PATCH v3] of/address: Fix NULL bus dereference in of_pci_ra=
nge_parser_one() ---
commit 958bc6596a6b1a98e35e89a326c87639d08d1a2b
Author: Carlo Caione <ccaione@baylibre.com>

of/address: Fix NULL bus dereference in of_pci_range_parser_one()

The bus matching rework made of_match_bus() return NULL for nodes with
ranges/dma-ranges but no local #address-cells. parser_init() stored that
NULL bus, and the range iterator later dereferenced it.

> diff --git a/drivers/of/address.c b/drivers/of/address.c
> index cf4aab11e9b1f..499d37ceae210 100644
> --- a/drivers/of/address.c
> +++ b/drivers/of/address.c

[ ... ]

> @@ -792,7 +801,7 @@ struct of_pci_range *of_pci_range_parser_one(struct o=
f_pci_range_parser *parser,
>  	int na =3D parser->na;
>  	int ns =3D parser->ns;
>  	int np =3D parser->pna + na + ns;
> -	int busflag_na =3D parser->bus->flag_cells;
> +	int busflag_na;
> =20
>  	if (!range)
>  		return NULL;
> @@ -800,6 +809,8 @@ struct of_pci_range *of_pci_range_parser_one(struct o=
f_pci_range_parser *parser,
>  	if (!parser->range || parser->range + np > parser->end)
>  		return NULL;

[Severity: High]
This isn't a bug introduced by this patch, but can this integer calculation
overflow?

If a maliciously crafted Device Tree with an extremely large positive
#size-cells property (e.g., 0x7FFFFFFE) is parsed, the calculation
np =3D parser->pna + na + ns could overflow a 32-bit signed integer.

This would result in a negative np value, bypassing the bounds check
parser->range + np > parser->end.

Because np is negative, parser->range + np performs negative pointer
arithmetic. Does this then cause an out-of-bounds memory read when calling
of_read_number(..., ns), running a loop repeatedly reading memory until it
causes a page fault?

> +	busflag_na =3D parser->bus->flag_cells;
> +
>  	range->flags =3D parser->bus->get_flags(parser->range);
> =20
>  	range->bus_addr =3D of_read_number(parser->range + busflag_na, na - bus=
flag_na);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727-of-range-p=
arser-null-bus-v3-1-be01b708a4ce@baylibre.com?part=3D1
