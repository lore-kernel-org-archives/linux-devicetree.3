Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793201459;
	b=ZvSeF7pirr4kENqfKvj5kcGhon7gQZf1e0AJUMj157/IOqUz3Nm2GxQGlmOZUPxkXm2S
	 V17Mr2hB/ihYjvzqxdwufyIxTsElKrwPLm6l6gRr/QcuZB+nxNF9ootiSbbcYLiHRwI0U
	 ztjtjKURBNxVHM03VipPLTPszxKP7iOhESZPlEFrqtVQkuA5bSxvSv1KeBhdLcEGpQppO
	 THf8UkMoFuk5nmwWqnFMz8Yd8nzbdRzqqnbAg2Id7YoHp1XXZ/cA5wuZbYKlUOZE/48Ru
	 uqXvDNaGGZF+DaZQRWXAumNxl2usmaNwcB4pLRJMjlhjWG1Nn5VX/04d/piPXGKzbyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201459;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=u5OAziH+XXCu1kidoGU7GB4Imqu8yDWQL+K8hIK3tP0=;
	b=FSTZIJMuh8tdyfiZiPwfX1nkoeYjXdUsisgC6buTq7nuoA0lQg8cz1uukwC24491Kn0w
	 TPaYhjisFFJWULXgn/aXXM/GtoznBz9lsavIkf9UDWAajPwTmhD4Jj62s5FKvodQ4Htlq
	 UEHDKh3orHa84bJUf9WLvmFjjWkrPbIbTsD0R0Oras+5DeVYdA8M1VDZzgmiNpgBqyK1G
	 7xvX4u12hCalCnbrxZE0qiyiFRkafCHuwGiJpM4j3LjydNa1k1O1LNyrArwlO8hV8YINe
	 b0B3glSWWHCp/3RERbgMHawjNdkSU0HpkGywl6Q87vAVTpzitb9w1rIHodfQYEBz2Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dTsIaDuP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04F1606A31A
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 15:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dTsIaDuP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 031C71F01825;
	Wed, 28 Oct 2026 15:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793201458;
	bh=u5OAziH+XXCu1kidoGU7GB4Imqu8yDWQL+K8hIK3tP0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dTsIaDuPmNbYc85czKOjTglGn5Z8DQAWYvIJJfhrDvUN4Oiv4JQcFmPouBXmh3U4N
	 dhahV2WaVdWopuQOMPTwvl/tI+Z+NUUM0zA/SOSDEP4EWzqBHDFEvhauRa/hGUXZnE
	 taFb3d8ZnV7iOt+YmbyJI201dOt9d9qHnWxUs7cZ95zjx4ojt74+6XeWqg66M46UL+
	 w/ysNacXBRyeqjC5hcavxRPdpCEtpCrHp16BPtpCUt2kv7xgmziY5LLcHFO2HwK0/t
	 x/d17zt9omLMKSaS3WPS9BH25RmC922vDE0ZPtYn7HcZCuDdqQQPIMtnxHSBNASaLE
	 EKFma+VNwi9+w==
Message-ID: <sashiko-outbox-188055@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/5] phy: Add common Innosilicon HDMI PHY helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michal Wilczynski" <m.wilczynski@samsung.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261028-jh7110-inno-hdmi-phy-v6-2-f3379684d97e@samsung.com>
References: <20261028-jh7110-inno-hdmi-phy-v6-0-f3379684d97e@samsung.com>
 <CGME20261028152227eucas1p1ac945094a851893634a568a46cc2ee95@eucas1p1.samsung.com>
 <20261028-jh7110-inno-hdmi-phy-v6-2-f3379684d97e@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 28 Oct 2026 15:30:57 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] phy: inno-hdmi: 32-bit overflow in inno_hdmi_phy_pre_pll_recalc_=
rate()
--

commit ddb60d944975dab0de39c50bd23d32e884d239ae
Author: Michal Wilczynski <m.wilczynski@samsung.com>

phy: Add common Innosilicon HDMI PHY helpers

This commit introduces a shared helper library for the Innosilicon HDMI PHY
pre-PLL configuration, including table lookup, clock rate calculation helpe=
rs,
and register programming.

> diff --git a/drivers/phy/phy-inno-hdmi.c b/drivers/phy/phy-inno-hdmi.c
> new file mode 100644
> index 0000000000000..6900d4d83e464
> --- /dev/null
> +++ b/drivers/phy/phy-inno-hdmi.c
[ ... ]
> +unsigned long
> +inno_hdmi_phy_pre_pll_recalc_rate(const struct inno_hdmi_phy_pre_pll *pl=
l,
> +				  unsigned long parent_rate)
> +{
> +	unsigned int control, div_1, div_2, div_3, pclk_div_ab, pclk_div_cd;
> +	unsigned int frac_div_7_0, frac_div_15_8, frac_div_23_16, div;
> +	u8 nd, no_a, no_b, no_d;
> +	unsigned long frac, rate;
> +	u64 vco, vco_rate;
> +	u16 nf;
> +	int ret;
[ ... ]
> +	nd =3D div_1 & INNO_PRE_PLL_PRE_DIV_MASK;
> +	nf =3D (div_2 & INNO_PRE_PLL_FB_DIV_11_8_MASK) << 8;
> +	nf |=3D div_3;
> +	vco =3D parent_rate * nf;
> +
> +	if (!(div_2 & INNO_PRE_PLL_FRAC_DIV_DISABLE)) {
> +		ret =3D inno_read(pll, INNO_PRE_PLL_FRAC_DIV_7_0, &frac_div_7_0);
> +		if (ret)
> +			goto err;
> +		ret =3D inno_read(pll, INNO_PRE_PLL_FRAC_DIV_15_8, &frac_div_15_8);
> +		if (ret)
> +			goto err;
> +		ret =3D inno_read(pll, INNO_PRE_PLL_FRAC_DIV_23_16,
> +				&frac_div_23_16);
> +		if (ret)
> +			goto err;
> +
> +		frac =3D frac_div_7_0 | (frac_div_15_8 << 8) |
> +		       (frac_div_23_16 << 16);
> +		vco +=3D DIV_ROUND_CLOSEST(parent_rate * frac,
> +					 BIT(INNO_FRAC_DIV_WIDTH));
> +	}

[Severity: Medium]
Can the VCO calculations in inno_hdmi_phy_pre_pll_recalc_rate() in
drivers/phy/phy-inno-hdmi.c overflow on 32-bit architectures?

Both parent_rate and frac have type unsigned long, while nf is a u16 and vco
is a u64. On 32-bit targets where unsigned long is 32 bits wide,
parent_rate * nf is evaluated in 32-bit arithmetic before being widened to
u64. With a typical 24 MHz reference clock, any feedback divider nf >=3D 179
exceeds U32_MAX, whereas the 12-bit feedback divider reaches up to 757 in t=
he
Innosilicon pre-PLL configuration tables.

Similarly, when the fractional divider is enabled, parent_rate * frac and
DIV_ROUND_CLOSEST() operate on 32-bit unsigned long values before adding to
vco. For a 24 MHz parent_rate and a 24-bit frac value, parent_rate * frac
requires up to 49 bits and overflows 32-bit unsigned long whenever frac >=
=3D 179.

Should parent_rate be cast to u64 in parent_rate * nf, and should the
fractional calculation use DIV_ROUND_CLOSEST_ULL((u64)parent_rate * frac,
BIT(INNO_FRAC_DIV_WIDTH)) to avoid 32-bit truncation?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261028-jh7110-inn=
o-hdmi-phy-v6-0-f3379684d97e@samsung.com?part=3D2
