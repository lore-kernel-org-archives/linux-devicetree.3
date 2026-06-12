Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FF2371043
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 08:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781254497; cv=none; b=exHG5KYpgOzpyo0faSIBVGuUhhK0jL5GbwVYPiGvrom512LYeZmRrQp++iWRSaRYLrZFMbx9skameqYVCX0qu4MAcS/fcLMlyUuGco5jIdWc72Fns8o/rJjVnOw+C6mWuNFl90Zn6tKP+AOAs9F2tYURRYNMDZr2EUzSRlrawO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781254497; c=relaxed/simple;
	bh=v+MlorQ65CnMyNQGbEm8E6/aseSKQTea3ZVWDulCLHg=;
	h=From:Subject:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DflyWn+e+Bf6elsMdQGbBNp5FufighnNeX3rDxI3MYlyEB52KFy7jfyYmfgM+sukzD3j1249+8XOU6liHV9ZhYuIFbjw3VNpOGMt5qlq/sSWp/P0AWgDbDcSVYbMQh+LBwPLenAafFzUATe9bK0ErB1tgeFs5zyA7A/2pTLnfhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hZt8OZGI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hZt8OZGI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9216C1F000E9;
	Fri, 12 Jun 2026 08:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781254496;
	bh=UXTYMPXNwGoiMdMsK1pX9B55R95/xNJWujdo5wgqYa8=;
	h=From:Subject:Reply-To:Cc:In-Reply-To:References:Date;
	b=hZt8OZGIplHoyZbWijrmSVmJW5c3F0CGU7ZGChZQfmO1qOBjPwiAG+A3BpoKecgAT
	 LQ9p5TBb4qovNZw9QWN3nw6J98SKjq/GQx3T+reut1/mz1+w6ALDfCgfr74ByVaOy1
	 vIQ95sjtV8RkC7CAqsvPEQ3rxmXyscGhZ6YlLxYu27puzTmWbi/084cG+6hyk/GhSW
	 H3taJlkSjHSedUwesHny5GlTCUlL1Ub+L7DkLwgVcY9mnvcwAjhRfzwfncQ/qbXxDH
	 RvCTF1ZQVv4IeQTJjTLO+p9knW+pdSt7T3rP1bxtTeULGpGRoEOLzWlEOfcvNDKgAb
	 fpv9V1f27qjFQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 3/6] clk: conf: Support assigned-clock-sscs
Reply-To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260612-clk-v10-v10-3-eb92484eda38@nxp.com>
References: <20260612-clk-v10-v10-3-eb92484eda38@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 12 Jun 2026 08:54:55 +0000
Message-Id: <20260612085455.9216C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Spread Spectrum Configuration (SSC) is applied before clock parent=
s and rates are set, which can result in the SSC configuration being overwr=
itten or becoming mathematically invalid.
- [Medium] Parsing `assigned-clock-sscs` by casting an array of `struct clk=
_spread_spectrum` to a `u32 *` violates strict typing and is highly brittle.
--

commit dcd88e4f08b6ae89c38dd70d8a94011d30708d37
Author: Peng Fan <peng.fan@nxp.com>

clk: conf: Support assigned-clock-sscs

This commit adds support for parsing Spread Spectrum Configuration (SSC) fr=
om
the device tree and configuring clocks accordingly. It introduces a new
function to read the assigned-clock-sscs property and apply the settings.

> diff --git a/drivers/clk/clk-conf.c b/drivers/clk/clk-conf.c
> index 303a0bb26e54a..550b8ae375a2c 100644
> --- a/drivers/clk/clk-conf.c
> +++ b/drivers/clk/clk-conf.c
> @@ -155,6 +155,78 @@ static int __set_clk_rates(struct device_node *node,=
 bool clk_supplier)
[ ... ]
> +static int __set_clk_spread_spectrum(struct device_node *node, bool clk_=
supplier)
> +{
[ ... ]
> +	sscs =3D kcalloc(count, elem_size, GFP_KERNEL);
> +	if (!sscs)
> +		return -ENOMEM;
> +
> +	rc =3D of_property_read_u32_array(node, "assigned-clock-sscs", (u32 *)s=
scs,
> +					count * 3);

[Severity: Medium]
Is it safe to cast an array of struct clk_spread_spectrum to u32 * here?

If any fields are added to the struct or the compiler adds padding, the OF
helper will read data in 12-byte chunks, which will silently misalign with =
the
struct array boundaries for all elements after the first.=20

Would it be better to read into a dynamically allocated temporary u32 array
and explicitly populate each struct field?

> +	if (rc)
> +		goto free_sscs;
> +
[ ... ]
> @@ -174,6 +246,10 @@ int of_clk_set_defaults(struct device_node *node, bo=
ol clk_supplier)
>  	if (!node)
>  		return 0;
> =20
> +	rc =3D __set_clk_spread_spectrum(node, clk_supplier);
> +	if (rc < 0)
> +		return rc;
> +
>  	rc =3D __set_clk_parents(node, clk_supplier);

[Severity: High]
Does configuring spread spectrum before setting clock parents and rates cau=
se
issues?

Spread spectrum modulates the base frequency, so its hardware parameters
usually depend on the final base rate and parent clock.  By configuring SSC
first, the settings might be computed based on the old hardware state, or
subsequent rate and parent changes might wipe out the SSC settings.=20

Should SSC be configured after parents and rates are set?

>  	if (rc < 0)
>  		return rc;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260612-clk-v10-v1=
0-0-eb92484eda38@nxp.com?part=3D3
