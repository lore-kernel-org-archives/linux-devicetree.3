Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF0F941A91A
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 11:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784201832; cv=none; b=SIMSpSVigLa6RcVngYdlhmq7/8xKkQulkLPYY9VMDD6/IN1Hb7qY5SvytmoFQPnu89GrKa4wbD6TjGeZefi8By22aX+PCZwnFMV/B4t1aou0yiloWjQDUWqJZISjnBJOUzTfxp69SDrHpeUpfXtBfBsMKFPbW8hMPaULdHYFJO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784201832; c=relaxed/simple;
	bh=netrrtVNI8+Fzq8wi+PksoIeQ6lhDZLiezAncpbNB6E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QGgN+YfoLD3rHHLLDBrGI8ZuOYLg4OClZHTQoJwrNuBiHMblJlAi0NQ0OcE4f/WqUm7+NVnZQLEr7BwJFBQXjsMaT84PQ/YFtz5G7ag4tAM88Te4aTrET78bxv9PbYQfTPlGw5E4k2gidsNHCgPGk0m72Npc7YyoRtiBQPA4JMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fQRjlcm0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fQRjlcm0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CED11F000E9;
	Thu, 16 Jul 2026 11:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784201828;
	bh=nbJg7qRl+5cEMGLrpv86pWrSU7lKBXvZGShoT5t/Oho=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fQRjlcm0DQ+qqow4mJATjEhodm5kJVaFk8X2qV+8ph122Gs14ALjGkeBh9lsfikmv
	 s48l/kUDqy30ggE5RRADH+uVe2pwU2S2Dydfa5UspMjClvnd7wm4IL1UQZlIE85pUC
	 dce5XVUqJRdDVWi24tkl98t/O+khNVvlrLUAvFk4fbMvRTTiW4QWkSPXQbMib7yd1T
	 d2G6n9UYHcldQxFAunWCGrimC+pfpCN45yVcQBZxz6+FE4Fi/qSzCQJWHZxx7fhsgL
	 rvbNF1JaeZ1PbWdOGoZtyBWjiRDCKE8VqyEl5JFuoD962xO9Qdsd8is3GFah648tFV
	 eCS1Xlc7iJeDg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 6/7] clk: Add support for clock nexus dt bindings
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TWlxdWVsIFJheW5hbCAoU2NobmVpZGVyIEVsZWN0cmljKQ==?= <miquel.raynal@bootlin.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260716-schneider-v7-2-rc1-eip201-upstream-v3-6-98454e83845c@bootlin.com>
References: <20260716-schneider-v7-2-rc1-eip201-upstream-v3-0-98454e83845c@bootlin.com>
 <20260716-schneider-v7-2-rc1-eip201-upstream-v3-6-98454e83845c@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 11:37:08 +0000
Message-Id: <20260716113708.9CED11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Unconditional dereference of optional `out_args` pointer in `of_pa=
rse_phandle_with_args_map()`.
--

--- Patch [6]: [PATCH v3 6/7] clk: Add support for clock nexus dt bindings =
---
commit 6c00bcac0a2f79ec97235472147341c2654575cc
Author: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>

clk: Add support for clock nexus dt bindings

This commit introduces support for clock nexus device tree bindings, allowi=
ng
inner clocks to be mapped to inlet clocks via the clock-map property. It
accomplishes this by transitioning the clock subsystem to use
of_parse_phandle_with_args_map() instead of of_parse_phandle_with_args().

> diff --git a/drivers/clk/clk-conf.c b/drivers/clk/clk-conf.c
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
This is a pre-existing issue, but since this patch transitions the subsystem
to use of_parse_phandle_with_args_map(), it seems worth noting a flaw in the
underlying API.

Looking at of_parse_phandle_with_args_map() in drivers/of/base.c, there is =
an
unconditional dereference of the out_args pointer:

drivers/of/base.c:of_parse_phandle_with_args_map() {
	...
	ret =3D __of_parse_phandle_with_args(np, list_name, cells_name, -1, index,
					   out_args);
	if (ret)
		return ret;

	/* Get the #<list>-cells property */
	cur =3D out_args->np;
	...
}

Since out_args is documented as an optional pointer for this exported symbo=
l,
would a caller passing null immediately trigger a kernel panic here due to a
null pointer dereference?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716-schneider-=
v7-2-rc1-eip201-upstream-v3-0-98454e83845c@bootlin.com?part=3D6
