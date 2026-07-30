Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009693D34BB
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 10:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785405932; cv=none; b=GPIueLZuki9CbPT4D+hLceP3DqzqnJK8NQwehGaZ/IQ8Fahw7vvq4PQTZHlG6x7PDp2VN6zyuR2ckJPqnPlO3LsCoCfmAtbl1pq3A34cqym7GLhedlIjR4Kf2AhuPeZCUoRZyPegMhiJAqLBc9hno8eI6XST5h5npMm2SB4NBPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785405932; c=relaxed/simple;
	bh=22SC0Rb07x70r7ybtjWkAJccbQI9RFp2J4SI51e1Kbk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eIfATSoFvmUbeJfHx9zWjSl2JIk00ZPqYKEw1pHaBPaw9OKlGe4y5jbbkOpzs6XQh9ob0dcwyG3Mw/wBW4d4lDquzoKPhausbI2AInsjWSb67+K0MGE6KaKUezG6n9GBIcQEMmu59VOISh52gyG2c7zt8o5/4JQursOlJy4bGj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hjIk0TxA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hjIk0TxA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F78D1F000E9;
	Thu, 30 Jul 2026 10:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785405930;
	bh=ZRYS8ZEcJyK0OoJFIXlh+QrmqJP/WNIVeTkY/DL/u/4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hjIk0TxAb9Ki8jtcJT6pOgGevReFefHdXiWR+MY6OwAvLEEwYhWnySXk7mk1koxjM
	 KMpymLZcFclDpK1xfYs9EnAB4tIAi0ooaDNRnH+t3rysnsAGlkuCx+10YdmrJwc05c
	 XJBacntVWUlv9g2d29wXP2Py/FvDmNrbH/+7yCsoUX8V4pFi1QK17pHZimgRycGySu
	 fu74conjxF+mnsWWChVQUqG7TlGeajWKRV8KD469Iv5bDzbRDv3Qh1fKsWJJiIBk4e
	 OOmjBnbErIcf6FhhoxbZEMEJJUkpJPQEBTPPWBzJ6/5nlMU5rIhDWNxjvCxdtO4cdo
	 wapatxOwE+Azg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 10/24] clk: mediatek: pll: Add BAR reset register
 offsets
Reply-To: sashiko-reviews@lists.linux.dev
To: "Louis-Alexis Eyraud" <louisalexis.eyraud@collabora.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260729-mt8189-clocks-system-base-v4-10-e356b813a64c@collabora.com>
References: <20260729-mt8189-clocks-system-base-v4-0-e356b813a64c@collabora.com>
 <20260729-mt8189-clocks-system-base-v4-10-e356b813a64c@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 10:05:30 +0000
Message-Id: <20260730100530.8F78D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] The newly added set and clear registers for the BAR reset (`rst_=
bar_set_addr`, `rst_bar_clr_addr`) are computed but never used in the prepa=
re/unprepare callbacks.

Pre-existing issues:
- [High] The error handling rollback in `mtk_clk_register_plls()` blindly u=
nregisters and frees clocks it previously skipped, leading to Use-After-Fre=
e and heap corruption.
--

--- Patch [10]: [PATCH v4 10/24] clk: mediatek: pll: Add BAR reset register=
 offsets ---
commit 32dac933eac13088132963fe76e93c2f164b2862
Author: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

clk: mediatek: pll: Add BAR reset register offsets

Currently, the register offset to handle BAR reset, for PLLs that
support it, is hardcoded to CON0. On MT8189 SoC, there are separate
status, set and clr registers to handle this, so differents offsets
are needed.

> diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pl=
l.c
> index ee478bc640851..4b0f7e2bfc5a5 100644
> --- a/drivers/clk/mediatek/clk-pll.c
> +++ b/drivers/clk/mediatek/clk-pll.c
> @@ -249,9 +249,9 @@ int mtk_pll_prepare(struct clk_hw *hw)
>  	udelay(20);
> =20
>  	if (pll->data->flags & HAVE_RST_BAR) {
> -		r =3D readl(pll->base_addr + REG_CON0);
> +		r =3D readl(pll->rst_bar_addr);
>  		r |=3D pll->data->rst_bar_mask;
> -		writel(r, pll->base_addr + REG_CON0);
> +		writel(r, pll->rst_bar_addr);

[Severity: Medium]
Will this fail to correctly assert the hardware reset BAR on the MT8189 SoC?

The newly added rst_bar_set_addr is computed in mtk_clk_register_pll_ops(),
but it is never used here. Is it intended to write to the dedicated set
register when it exists, rather than performing a read-modify-write on
rst_bar_addr?

>  	}
> =20
>  	return 0;
> @@ -263,9 +263,9 @@ void mtk_pll_unprepare(struct clk_hw *hw)
>  	u32 r;
> =20
>  	if (pll->data->flags & HAVE_RST_BAR) {
> -		r =3D readl(pll->base_addr + REG_CON0);
> +		r =3D readl(pll->rst_bar_addr);
>  		r &=3D ~pll->data->rst_bar_mask;
> -		writel(r, pll->base_addr + REG_CON0);
> +		writel(r, pll->rst_bar_addr);

[Severity: Medium]
Similar to mtk_pll_prepare(), should this be writing to the newly added
rst_bar_clr_addr instead of read-modify-writing rst_bar_addr?

>  	}
> =20
>  	__mtk_pll_tuner_disable(pll);

[ ... ]

> int mtk_clk_register_plls(struct device *dev,
> 			  const struct mtk_pll_data *plls, int num_plls,
> 			  struct clk_hw_onecell_data *clk_data)
> {

[ ... ]

> 	for (i =3D 0; i < num_plls; i++) {
> 		const struct mtk_pll_data *pll =3D &plls[i];
>=20
> 		if (!IS_ERR_OR_NULL(clk_data->hws[pll->id])) {
> 			pr_warn("%pOF: Trying to register duplicate clock ID: %d\n",
> 				dev->of_node, pll->id);
> 			continue;
> 		}

[ ... ]

> 	return 0;
>=20
> err:
> 	while (--i >=3D 0) {
> 		const struct mtk_pll_data *pll =3D &plls[i];
>=20
> 		mtk_clk_unregister_pll(clk_data->hws[pll->id]);

[Severity: High]
This isn't a bug introduced by this patch, but does this error handling
rollback cause a use-after-free and memory corruption?

If the registration loop encounters a duplicate clock ID and skips it using
continue, a subsequent failure in the array will trigger this rollback loop.

The rollback loop unconditionally unregisters clocks for all indices less t=
han
the failing index i.  This will cause kfree() to be called on a clock
object that was skipped by this function and passed in from elsewhere,
destroying an actively used resource.

Should the rollback loop verify that the clock was actually registered by
this function before unregistering it?

> 		clk_data->hws[pll->id] =3D ERR_PTR(-ENOENT);
> 	}
>=20
> 	iounmap(base);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729-mt8189-clo=
cks-system-base-v4-0-e356b813a64c@collabora.com?part=3D10
