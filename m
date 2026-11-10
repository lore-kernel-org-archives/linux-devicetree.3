Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794300048;
	b=GGRwf1rRb/uPB2VLkeN5HzeKBt/bEAVJ6Cc8nSKbaDmKvi6VfuYHa9cftl+jTV1C0Lyv
	 hnDLOHUBAmTjfD3ISi99IjpkhiIY4sSYiNdTwTrTVqJ6t92J34xWW7Qc3Ewq7uuVwym5a
	 VQsfmUkARjNX9EKlnV8k5wn3ZNTKnqNenia9dDQbGwDCqiBMiAKCLYgfj69Acp+XwOOlV
	 3MimezK8vSvNzIaZrvwgNYj3k5EAU30oqlOuKJf5aoubxuce0sRQcs668NbsLF3IFdE5Q
	 yK7QT5wnnuEQ2i+YqLX+DqGjISTosh5iUws2FLmZOutgk8T6SiPon59psXLPC9t+94w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794300048;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=5cpYZBRJZ/IrLL+nNgM7nCdju8ZzXvVptDb+Rb5Dx9E=;
	b=JF694q+MpA0wczobtTU+wSClnUU/xxDhDcQglrPTN7oifu18tJzTXt7b7KzO63POBcDm
	 h4+SYdoLr6xtgqs1XD4Ul0IYXrJ0FLYmNn1e5jWnXoBKx9gDH8MXvFrRZynrbGpYAJ4jf
	 eAvL94TuRpn6N8tcaoDyUDk7qdKvROSEViz0+xUJ4GUrz8ykUhOYSOXFJfanXrN8gZMQW
	 Aoc2hTnSBANuctwoqL44qi8mKPkltgX1DQ31Mtkcdz6bGpk/Ipud3QQO28Ul28nkk5p6B
	 mxCs731knfd8A5Nm6DaxQHF+j+vtNTMRAvqs3ooadXQiMgci11EG4Vl82XVE6qQeTIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kj069CrJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28B5606A321
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 08:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kj069CrJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C5C61F0089F;
	Tue, 10 Nov 2026 08:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794300047;
	bh=5cpYZBRJZ/IrLL+nNgM7nCdju8ZzXvVptDb+Rb5Dx9E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kj069CrJ4VnS46ro46ieJqf7g+yfhR3HbcEpwgKiPAQ6+1O2wFQSjPWuzOipJzE7Q
	 clM+vfqeYiVDdV86P7+pg0uVXyH3m3L6m8M6PJS3pGjDYn7eyK+dvO77LYuGtQrEBL
	 RPvLm5fs0P3bPmwp+AvzlE0PdbvjJ+frvT3kHrFvPWk30J3NQu/vVveVeoBVx3k7NK
	 X86CfvlopZPQ1DLREDNNzVjJvY+yovj0UzdTjXcKX/IqPKw2F8qlVpAfyNY0+Rv45G
	 iGpxc8p/mw7nn6LofQrAmAXY4mdv+r5h9yvjgGyidxfLt+NAjMb0+HECbYlawgHHdg
	 jr71suZC9VYoQ==
Message-ID: <sashiko-outbox-206648@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 5/9] phy: rockchip-samsung-dcphy: Move block-level
 setup to runtime resume
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jason Yang" <jason98166@gmail.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261110-dcphy-rx-v1-v6-5-d681ba20b36a@gmail.com>
References: <20261110-dcphy-rx-v1-v6-0-d681ba20b36a@gmail.com>
 <20261110-dcphy-rx-v1-v6-5-d681ba20b36a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 08:40:46 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] phy: rockchip-samsung-dcphy: stale SSC state in
  samsung_mipi_dcphy_pll_configure()
--

commit fa85aa14323095163211849e2a7f194d32765398
Author: Jason Yang <jason98166@gmail.com>

phy: rockchip-samsung-dcphy: Move block-level setup to runtime resume

This commit moves the APB reset pulse and BIAS block initialization from
the PHY power-on path to the runtime resume callback so that a second PHY
consumer does not reset an already running block.

> diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c b/drivers/=
phy/rockchip/phy-rockchip-samsung-dcphy.c
> index 7a009d87a6656..d6acc3e2d4486 100644
> --- a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
> +++ b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c

[ ... ]

> @@ -1373,10 +1372,6 @@ static int samsung_mipi_dcphy_power_on(struct phy =
*phy)
>  {
>  	struct samsung_mipi_dcphy *samsung =3D phy_get_drvdata(phy);
> =20
> -	reset_control_assert(samsung->apb_rst);
> -	udelay(1);
> -	reset_control_deassert(samsung->apb_rst);

[Severity: Medium]
Does removing the samsung->apb_rst pulse from samsung_mipi_dcphy_power_on()
leave SSCG_EN enabled in PLL_CON4 when the transmitter is reconfigured from
a rate above 2.5 Gbps to 2.5 Gbps or below while the device stays
runtime-resumed?

Without the APB reset on each power_on, PLL_CON3 and PLL_CON4 keep their
previous values, and samsung_mipi_dcphy_pll_configure() only touches them
when samsung->pll.ssc_en is true:

drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c:samsung_mipi_dcphy_pll_co=
nfigure() {
	...
	if (samsung->pll.ssc_en) {
		regmap_write(samsung->regmap, PLL_CON3,
			     MRR(samsung->pll.mrr) | MFR(samsung->pll.mfr));
		regmap_update_bits(samsung->regmap, PLL_CON4, SSCG_EN, SSCG_EN);
	}
	...
}

In addition, samsung_mipi_dcphy_pll_calc_rate() sets samsung->pll.ssc_en =3D
true when fout > 2500000000LL, but never resets it to false for lower
rates, so switching to a lower-rate mode keeps spread-spectrum clocking
enabled with stale modulation parameters.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110-dcphy-rx-v=
1-v6-0-d681ba20b36a@gmail.com?part=3D5
