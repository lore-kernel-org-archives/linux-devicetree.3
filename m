Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C054B4746CA
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 15:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786116942; cv=none; b=dl0dDoNAoA636YP93rcz7VNhQU1uYiuEJwU5qDjhgVEgYItuBDwPO1hhAbtdK8JKD29J0VepYm6dHRzCJVEK/ERCTN5NNhx3QSi7wX7z1BhFje65QCvNKz/ebS4/GqcZ/om/PhDk+n7f1P2vG04Omz307c3F7OdwxNAd25PhZYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786116942; c=relaxed/simple;
	bh=3PiLiWNk8ma6j23X9NeuMJL3ZxEOwXiJO0QHlI6/AJo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JzY74Q9enQmA+EL6D3skxpfcew18qrexwwMkjhWKc86ceYZ4EmubegIocdNS6LFfaOvPbntc6yy0P0Opc1v3Hnv96t5yNRlcSQkg32VyyF1meUJsr4FZEPvl5w0Ff8q9LnNRfHgSo/8wXxHqR7BVbSjBpQA1p2MF4BQ5YbyJOLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JhaU+edR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JhaU+edR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64CD21F00A3D;
	Fri,  7 Aug 2026 15:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786116941;
	bh=yoO01zat+Li4HxN9Ani/VWiQ23tLnrgF2LZ/y+WfEjk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JhaU+edRmfSEq8RbZCIMVcuxn2vUQghC7GwJX8fm2oTf0arK8l6zDw+Fy0y4lcs4O
	 eKn9kq1J1CtYi94sLZUZw638/pYsMdmex3CW3gTlDmKCD5VbA8BKy11M5L4j9Kewm6
	 yaBYo+UQyb3WRMiWMz8mTY+J8BYEHySnMAn5wT2a9/gFSSfRh4Q2ezBxt3X+z7HUiS
	 fkW3rQHcQ4FF+u353qh+mXPxxDIRB/TyqiZfngkgmah6Gwd9SufgziZCFm25sMFs1w
	 b+rsBJqUmKo88NX7yOhglBlhBU6p9EX8N25agPeQVxwyE324YXHGbXdFuhbUftCziH
	 MQ15nbBrhq7OQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 6/7] clk: Add support for clock nexus dt bindings
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TWlxdWVsIFJheW5hbCAoU2NobmVpZGVyIEVsZWN0cmljKQ==?= <miquel.raynal@bootlin.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260807-schneider-v7-2-rc1-eip201-upstream-v5-6-8785f9531cf0@bootlin.com>
References: <20260807-schneider-v7-2-rc1-eip201-upstream-v5-0-8785f9531cf0@bootlin.com>
 <20260807-schneider-v7-2-rc1-eip201-upstream-v5-6-8785f9531cf0@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 15:35:40 +0000
Message-Id: <20260807153541.64CD21F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing length validation on `*-map-mask` and `*-map-pass-thru` ar=
rays in `of_parse_phandle_with_args_map()` allows out-of-bounds memory read=
s.
- [High] Lack of cycle detection in `of_parse_phandle_with_args_map()` allo=
ws a malicious device tree to cause an infinite loop in the kernel.
--

--- Patch [6]: [PATCH v5 6/7] clk: Add support for clock nexus dt bindings =
---
commit a3b2f5d6812aa21284326e875a1ad049deda57c7
Author: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>

clk: Add support for clock nexus dt bindings

This patch introduces support for nexus nodes in the clock subsystem. It
transitions the parsing logic from of_parse_phandle_with_args() to
of_parse_phandle_with_args_map() to support clock-map properties.

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

[Severity: High]
This isn't a bug introduced by this patch, but changing to
of_parse_phandle_with_args_map() exposes the clock subsystem to a
pre-existing issue. Does of_parse_phandle_with_args_map() properly
validate the lengths of the map-mask and map-pass-thru arrays?

Looking at of_parse_phandle_with_args_map() in drivers/of/base.c, it seems
there are loops that unconditionally access mask[i] and pass[i] up to
list_size:

			for (i =3D 0; i < list_size; i++, map_len--)
				match &=3D !((match_array[i] ^ *map++) & mask[i]);

and later:

			if (i < list_size) {
				val &=3D ~pass[i];
				val |=3D cpu_to_be32(out_args->args[i]) & pass[i];
			}

If a device tree node provides clock-map-mask or clock-map-pass-thru proper=
ties
that are smaller than the expected size dictated by #clock-cells (list_size=
),
can this cause an out-of-bounds memory read?

[Severity: High]
This is a pre-existing issue, but does of_parse_phandle_with_args_map()
prevent infinite loops when parsing maliciously or accidentally crafted
device tree overlays?

In drivers/of/base.c:of_parse_phandle_with_args_map(), the main loop replac=
es
the current node with the new mapped node without tracking visited nodes or
limiting the mapping depth:

	while (cur) {
		/* Get the <list>-map property */

If a cyclic nexus mapping exists (e.g. node A maps to node B, and node B ma=
ps
back to node A), could this loop run indefinitely and hang the kernel?

>  		if (rc < 0) {
>  			/* skip empty (null) phandles */
>  			if (rc =3D=3D -ENOENT)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807-schneider-=
v7-2-rc1-eip201-upstream-v5-0-8785f9531cf0@bootlin.com?part=3D6
