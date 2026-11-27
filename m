Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795766262;
	b=w9hwtLOupaeGzpwA4ZSjO5VU5ldR4ETSkDUcwKZ+K9/o2jwD3xFJI6z03pgJjJwlPlQu
	 oYq9HejjkEBx4c/qzCi5hhcYS5EiPjcTnV8p0+EGd2K/ZzvT0b0CqGL+pVbFHuZplJmz3
	 nEaREi1w9aNWB+UZg5cQcd0uSPN8VikOaIZ1Qy1R4anWCQavHepw1E10+CbptSuEJg+BS
	 UooR28UHoePMV+vU8SdI4mNBZBLdi1WRsOLFVPgKBJ1t2B/Y3++6zTMJUE3aCGGat9LUf
	 yowjplLnBJCpIus6tcODrEgdhIDJjCz84GxaQN8dfg9LOc6+6CplJ280PkJ3LlcUvPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795766262;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=NnPdEAYz/7XWxxaJPld9mU0+MzVdVP9gQ8gL9OXAwDY=;
	b=B3YCMxwS5NONnXDyoCNcB7X+VfZhXf76X836AxAkhBtrBP2LSKU1R72zh8gdnxjy+JEq
	 rvxKAixCZ+CtUBjd2z5+Egl/jmomlDQyJhZum0F1sFsgld0ghTZt4qz+/UDckiw6Kelu1
	 LtvNYxmMCTMxt0+/jzW7+RoSP+r/1ULta3DQLlDx3ASHrBYz/tu+WJ9zG3N3YLV/5Gl8Y
	 VqdY91oqJv8VpwcqujYfx9wcwRFIPg+Dg3fqXMGSQ+aQkjRnkTVvYluk0sWn83dNTWrCY
	 ZpqSvoq5M3SPTddUroFref/N61nMTCZK2BZ0two3IIXHg8Noaa8pkf3oo6bzy/KFBgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gsrr4ce1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9586E606A338
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 07:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gsrr4ce1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D235A1F00898;
	Fri, 27 Nov 2026 07:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795766262;
	bh=NnPdEAYz/7XWxxaJPld9mU0+MzVdVP9gQ8gL9OXAwDY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gsrr4ce13efG+bBW8Plp86Mwb3bknUsyYDlsfhBrCQxf//oFPyLRN3A4IWgDk3VZX
	 QDrrDC9xAT0G97YYcv0n9L/Xu1y0zkVBHJfALboSKla7vuPqiiN5btlN1YnNJ6JFLR
	 vHzL9BWtuhMJgVopqviYV0uc6i9i3tXd9pRCQ6PJ9cc/jZQ8Vc/GBeLdxaNF5vbsM3
	 9cpq9QVF4gb0X9wZjTOdAcUqA3Uod6aUq+miq5Rgg7abdGIxiEFZp25TiyErNtrLg0
	 3Sxi8WCYUWPSWMRsPpb2tJatLzcK7/Mh7dSy8Gcz/dN9ZMtKi+9gmDmuPyQyMbNt+a
	 EjxeED8KY3+Mw==
Message-ID: <sashiko-outbox-236847@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 5/9] phy: rockchip-samsung-dcphy: Move block-level
 setup to runtime resume
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jason Yang" <jason98166@gmail.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261127-dcphy-rx-v1-v8-5-9ddfef99221d@gmail.com>
References: <20261127-dcphy-rx-v1-v8-0-9ddfef99221d@gmail.com>
 <20261127-dcphy-rx-v1-v8-5-9ddfef99221d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 07:57:41 +0000
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
- [Medium] phy: rockchip-samsung-dcphy: stale SSC in
  samsung_mipi_dcphy_pll_configure()
--

commit edbbf1e6ba40a7096ec6669569d318792a93587a
Author: Jason Yang <jason98166@gmail.com>

phy: rockchip-samsung-dcphy: Move block-level setup to runtime resume

This commit moves the APB reset pulse and BIAS block enablement from the
PHY power-on callback to the runtime resume callback so that bringing up a
second PHY consumer does not reset a running block.

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
> -
>  	switch (samsung->type) {
>  	case PHY_TYPE_DPHY:
>  		return samsung_mipi_dphy_power_on(samsung);

[Severity: Medium]
Can removing the APB reset from samsung_mipi_dcphy_power_on() leave
spread-spectrum clocking (SSCG_EN in PLL_CON4) enabled when the D-PHY
transmitter is reconfigured from a rate above 2.5 Gbps down to 2.5 Gbps or
below while the device stays runtime-active?

Previously, pulsing apb_rst on every power-on reset PLL_CON3 and PLL_CON4
to their defaults.  Unlike the lane timing registers updated in commit
"phy: rockchip-samsung-dcphy: Always write the rate-dependent registers",
samsung_mipi_dcphy_pll_configure() only touches PLL_CON3 and PLL_CON4 when
samsung->pll.ssc_en is true, and samsung_mipi_dcphy_pll_calc_rate() never
clears samsung->pll.ssc_en when fout <=3D 2500000000LL:

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

When a modeset switches from > 2.5 Gbps to <=3D 2.5 Gbps while runtime PM
remains active, SSCG_EN and the previous mrr/mfr values remain active in
hardware for the lower-rate mode.  Clearing samsung->pll.ssc_en by default
in samsung_mipi_dcphy_pll_calc_rate() and clearing SSCG_EN in PLL_CON4 when
ssc_en is false would avoid stale PLL modulation state.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127-dcphy-rx-v=
1-v8-0-9ddfef99221d@gmail.com?part=3D5
