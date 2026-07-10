Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10BB628373
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 18:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783708441; cv=none; b=BSHbLVhLJBiONu3sikl4fBpPpaVCECr+HspzHpeULg6oz14cw2bd8HUHzN5vWdFTWl2lQbnpSVO6EEQnB3nqtK/Zf8cQhbG3mk84FFk6WI3rbtd4wRM+eXrqN6T7SM6GFX1DydYgRmCO1koXFFz/h+LKDGf37iECsli8Mn79DA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783708441; c=relaxed/simple;
	bh=8Qm2z2zOZ4iZdNBZonmXdzc08987kiPYqATEcUGfAl8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=P429Nb6G3Q8AQcH0AgqhpEvCbt7SydKmsFa/a0My1iNcSPiWC0LBEd4BjNXscEgjcnt53n0u3mN1xops1a3LsApnrkA80P/RaXSB5Z6VvR7YKJJIwgxHEDYKIiDStbcD1sic2ma3jgmw97Vcy/P46HUpIqseJSPIXi5KQVnpcVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XswOF/va; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XswOF/va"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61D3A1F000E9;
	Fri, 10 Jul 2026 18:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783708439;
	bh=6uCm9FFEOGfVuk2KIwPY7eou4Z1wATawvCFzhyodQCQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XswOF/vaGiOV5BoFxZbRGopqSQ7J7bMZQYq0x5e84JCBoxS/xUrq5PMWrEJ1fIMeX
	 tVoGoQacOpvWkjuHp0A4u/3vWmpePJW+lHXZziNOuWjKQCa5Qgx3dLZNcFkpLlD+Pl
	 Ld+L4HDOV5LCP33nHDfWALP+tJZ8wOSjaPkVLikPAd72pCv5q6Dw+Z6iD/tzurbGT7
	 XIZNbnPqTAhmhZGP5pMtY0IEO2i/JzwMwCpiyzGQgsVLSdI3Y2wWh/RuBlQ0mIkRgF
	 Mu33sdfrzyjaHOR2CZBXMdIKFrTu2Lu7UNCXnW5c59MbvO0h7m2r4QuP240Sm5k/EX
	 c2nFkziOlOOHg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 6/7] clk: Add support for clock nexus dt bindings
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TWlxdWVsIFJheW5hbCAoU2NobmVpZGVyIEVsZWN0cmljKQ==?= <miquel.raynal@bootlin.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260710-schneider-v7-2-rc1-eip201-upstream-v2-6-b4680787377e@bootlin.com>
References: <20260710-schneider-v7-2-rc1-eip201-upstream-v2-0-b4680787377e@bootlin.com>
 <20260710-schneider-v7-2-rc1-eip201-upstream-v2-6-b4680787377e@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2026 18:33:58 +0000
Message-Id: <20260710183359.61D3A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Stack buffer overflow in `of_parse_phandle_with_args_map` when=
 `#<list>-cells` exceeds `MAX_PHANDLE_ARGS`.
- [High] Infinite loop in `of_parse_phandle_with_args_map` due to lack of c=
ycle detection.
- [High] Unconditional dereference of optional `out_args` pointer in `of_pa=
rse_phandle_with_args_map`.
--

--- Patch [6]: [PATCH v2 6/7] clk: Add support for clock nexus dt bindings =
---
commit 2eb2cbfe08397c2ed1b0b80363cc91255e359912
Author: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>

clk: Add support for clock nexus dt bindings

This commit introduces support for nexus nodes in the clock subsystem. It
maps inner clocks to inlet clocks by transitioning from
of_parse_phandle_with_args() to of_parse_phandle_with_args_map().

> diff --git a/drivers/clk/clk-conf.c b/drivers/clk/clk-conf.c
> index 303a0bb26e54a..5380d43b56a42 100644
> --- a/drivers/clk/clk-conf.c
> +++ b/drivers/clk/clk-conf.c
> @@ -25,8 +25,8 @@ static int __set_clk_parents(struct device_node *node, =
bool clk_supplier)
>  		       node);
> =20
>  	for (index =3D 0; index < num_parents; index++) {
> -		rc =3D of_parse_phandle_with_args(node, "assigned-clock-parents",
> -					"#clock-cells",	index, &clkspec);
> +		rc =3D of_parse_phandle_with_args_map(node, "assigned-clock-parents",
> +						    "clock", index, &clkspec);

[Severity: Critical]
This is a pre-existing issue, but by adopting of_parse_phandle_with_args_ma=
p(),
does this expose the clock subsystem to a stack buffer overflow?

When a device tree node specifies a cell count greater than MAX_PHANDLE_ARG=
S,
__of_parse_phandle_with_args() correctly clamps the count.

However, of_parse_phandle_with_args_map() in drivers/of/base.c re-reads the
unclamped cell count into list_size:

drivers/of/base.c:of_parse_phandle_with_args_map() {
    ...
    ret =3D of_property_read_u32(cur, cells_name, &list_size);
    if (ret < 0)
        goto put;

    /* Precalculate the match array - this simplifies match loop */
    for (i =3D 0; i < list_size; i++)
        initial_match_array[i] =3D cpu_to_be32(out_args->args[i]);
    ...
}

Could this overflow initial_match_array[] if list_size exceeds
MAX_PHANDLE_ARGS?

[Severity: High]
This is a pre-existing issue, but does switching to this API also expose the
subsystem to an infinite loop if a device tree overlay introduces a cycle?

In drivers/of/base.c:of_parse_phandle_with_args_map(), the map resolution l=
oop
continuously transitions to the next node:

drivers/of/base.c:of_parse_phandle_with_args_map() {
    ...
    while (cur) {
        /* Get the <list>-map property */
        map =3D of_get_property(cur, map_name, &map_len);
    ...
}

Does this while loop lack cycle detection or a maximum depth bound, potenti=
ally
allowing malformed input to hang the CPU?

[Severity: High]
This is a pre-existing issue, but does of_parse_phandle_with_args_map()
unconditionally dereference out_args?

While this patch passes a valid pointer, the API is documented as accepting
an optional out_args pointer. If a future caller passes NULL to validate a
mapping, it appears a NULL pointer dereference will occur:

drivers/of/base.c:of_parse_phandle_with_args_map() {
    ...
    /* Get the #<list>-cells property */
    cur =3D out_args->np;
    ...
}

Can this cause a panic if out_args is NULL?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260710-schneider-=
v7-2-rc1-eip201-upstream-v2-0-b4680787377e@bootlin.com?part=3D6
