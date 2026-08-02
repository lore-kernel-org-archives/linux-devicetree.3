Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6233932EF
	for <devicetree@vger.kernel.org>; Sun,  2 Aug 2026 11:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785669758; cv=none; b=qVo11Jzc+aTxYUzOBBT5kdKqxFTosxAHy0/XAZiexcCFxbCyqqLIlbDfYUONUqBIRKH+0rvRZ1veg4XDgTZRU0fGrl8BbEXkzvggMtKgzxviBW7ypJ6zOOBMeT1siHKne+tHdAqraXGQaX7Xx/Bn1D3Gdtx2zBrtD5XvAXEikJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785669758; c=relaxed/simple;
	bh=+ZEmATiy4hlcF0KtTWwm9qX44EpvnQKyoawBOfPAzOI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pp/ZyngOUkG1/8JQkk76naC8xSCvThl3IE1m4pWnkVqM91s611NiAgrA5kfJ3GnCeoPJSB0ZB6NgvR6HdAxO8BLiomNRWit8c/SKU8FgIJTeCoogrLxPL8McZbhaIKmPjm78Byut91fRFYsXjCx8eS/79qDrNIwTCOng8vRxvY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XUS+w5O7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XUS+w5O7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D7111F00A3D;
	Sun,  2 Aug 2026 11:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785669756;
	bh=dSfgVGkh+kce5AiPkPkNfZrc3hC8ORomZA+muVdsxV4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XUS+w5O7TElWh7gY82pUiy+PePTiv9jmLCsswE0AZzBnWTbe7lByUNF43HiL7PQW0
	 p262sxN5Q83GpPqUIXVrTSGBBjk4d0rmflHy5S5nRsnQApYVb8HvaBCKIVjfjeZ84e
	 MnKGrcYD+pLY/xxXMmoRFaS+hv7X8BnvX9FbUVBsDf9skjU6o+bsbIP1XKJN/OT3CG
	 W7O4KhGNqEDtOWfs22sCqwBevRKw26eDZOI48uGEXjub1I6ffYUHWt1Na+yVNi1Eyj
	 4ircUt19m6N2F2aBERrgQZQ1vrebBHgDdIDw8mN4N6MZ9wKbaGoCunFAVYC0EIXySP
	 ye4G/I9QfJOpA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 16/25] clk: mediatek: Add MT8189 apmixedsys clock
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Louis-Alexis Eyraud" <louisalexis.eyraud@collabora.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260801-mt8189-clocks-system-base-v5-16-ac4410697cc2@collabora.com>
References: <20260801-mt8189-clocks-system-base-v5-0-ac4410697cc2@collabora.com>
 <20260801-mt8189-clocks-system-base-v5-16-ac4410697cc2@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 Aug 2026 11:22:36 +0000
Message-Id: <20260802112236.6D7111F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] The global static pllfhs array retains stale state across unbind/r=
ebind cycles, leading to a Use-After-Free.
- [Medium] The FHCTL I/O memory mapping is leaked if mtk_clk_register_pllfh=
s() fails during probe.

Pre-existing issues:
- [High] The ssc_rate variable in fhctl_parse_dt() is used uninitialized if=
 of_property_read_u32_index() fails.
--

--- Patch [16]: [PATCH v5 16/25] clk: mediatek: Add MT8189 apmixedsys clock=
 support ---
commit c8fa878972c7f66453b67a7a8d8a6009e6ea57c9
Author: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

clk: mediatek: Add MT8189 apmixedsys clock support

Add support for the MT8189 apmixedsys clock controller, which provides
PLLs generated from SoC 26m.

> diff --git a/drivers/clk/mediatek/clk-mt8189-apmixedsys.c b/drivers/clk/m=
ediatek/clk-mt8189-apmixedsys.c
> index 0000000000000..a50a8979b8495
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt8189-apmixedsys.c
[ ... ]
> +static struct mtk_pllfh_data pllfhs[] =3D {
> +	FH(CLK_APMIXED_ARMPLL_LL, 0, 0x003C),
> +	FH(CLK_APMIXED_ARMPLL_BL, 1, 0x0050),

[Severity: High]
Does this global static array retain stale state across driver unbind and r=
ebind
cycles?

fhctl_parse_dt() maps the FHCTL device node into memory and stores the poin=
ter
in this static array, setting state.fh_enable =3D 1.

On driver unbind, mtk_clk_unregister_pllfhs() calls iounmap() on this point=
er
but does not clear state.fh_enable or state.base.

If the driver is later re-bound and fhctl_parse_dt() fails (for example, if
of_iomap() fails), the array retains the old values.

When mtk_clk_register_pllfhs() executes, it will see fh_enable =3D=3D 1 and=
 attempt
to access the previously unmapped memory via pllfh_data->state.base, causin=
g an
I/O use-after-free.

[ ... ]
> +static int clk_mt8189_apmixed_probe(struct platform_device *pdev)
> +{
> +	const u8 *fhctl_node =3D "mediatek,mt8189-fhctl";
> +	struct device_node *node =3D pdev->dev.of_node;
> +	struct clk_hw_onecell_data *clk_data;
> +	int r;
> +
> +	clk_data =3D mtk_alloc_clk_data(ARRAY_SIZE(apmixed_plls));
> +	if (!clk_data)
> +		return -ENOMEM;
> +
> +	fhctl_parse_dt(fhctl_node, pllfhs, ARRAY_SIZE(pllfhs));

[Severity: High]
This is a pre-existing issue, but I noticed that fhctl_parse_dt() can use an
uninitialized variable.

In drivers/clk/mediatek/clk-pllfh.c:fhctl_parse_dt():

	u32 num_clocks, pll_id, ssc_rate;
	...
		of_property_read_u32_index(node,
					   "mediatek,hopping-ssc-percent",
					   i, &ssc_rate);

		pllfh =3D get_pllfh_by_id(pllfhs, num_fhs, pll_id);
		if (!pllfh)
			continue;

		pllfh->state.fh_enable =3D 1;
		pllfh->state.ssc_rate =3D ssc_rate;

If the "mediatek,hopping-ssc-percent" property is missing from the device t=
ree,
of_property_read_u32_index() returns an error and leaves ssc_rate untouched.
The uninitialized stack garbage is then unconditionally stored in
pllfh->state.ssc_rate.

Since this value is later used to program hardware registers, could it cause
erratic clock frequencies or system instability?

> +
> +	r =3D mtk_clk_register_pllfhs(&pdev->dev, apmixed_plls, ARRAY_SIZE(apmi=
xed_plls),
> +				    pllfhs, ARRAY_SIZE(pllfhs), clk_data);
> +	if (r)
> +		goto free_apmixed_data;

[Severity: Medium]
Does this error path leak the FHCTL I/O memory mapping?

fhctl_parse_dt() maps the FHCTL device node into memory. If
mtk_clk_register_pllfhs() fails, the driver jumps directly to
free_apmixed_data and exits without unmapping the FHCTL memory.

Because this can happen on probe deferral, repeated failures could leak
virtual memory space.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260801-mt8189-clo=
cks-system-base-v5-0-ac4410697cc2@collabora.com?part=3D16
