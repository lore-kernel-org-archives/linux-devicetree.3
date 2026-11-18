Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794982050;
	b=DfBGrc5Id+LENNDJXtNGxxSeEAgL6uwXu2NjnFamBIhRm6wXmn9M6sKEtgCvNKG6CymT
	 AJU5tRwfXAPeYOwRBNwXtmh2TSVyTu4ipB/SJ2xpYh+ZaUz2KIzJrhejkTz+hRLnx8pWa
	 LmMT9LdeLn2B35aQm8QfvqApb666TcSnMioLOUZHUHbEzIHYfDdC/7sjPASQL3o/xp/PT
	 efzhC4meHcno1p8gJuuLdtc5v/jFZ0rTS7yweoXVDndlonMiEZyTKf7TNHqR1uFSSUTzU
	 /FyKeFYooZPoLMqi5YKCWtanWCz9k6rtkvxo6TuPkSLcxxkoLhPD3tdD6+4+CGG4AeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794982050;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=4O2M6DjzNYvNSUJkigNXwXXVLbLSdFMdZsPmTdwOj/M=;
	b=4qn1R4hVtz4nl8rG3CTxEH4Cb7F2uae2t3FfDZy5NrLf9v537Tv+rp/gg6OM6tL+OzR2
	 /3UgpOSj1+9+LlIe1jlup2Vgl/lcDIoHR9s/cgzgXmn8ZJkoeAPz7R+aOxYdOcwHRZjHA
	 9IwTBVM0X//XbUHTG4e8SVUOU1hV+bdyp/6yZVsfZlE0uqh89d1VadlSwzU/x6WR/6b1E
	 ELkbXMaYUhzlQ0mNBpy3MP/KaBsmw6TNiOapFB8u1mXZaE8eKTV33XwP44v2yA1hMol0H
	 DZJGOOPXIamrvjfYG2EqR45dHa6EYmTLaFxJdkw32NiMxBDBdDyeUl++o4/ahRYxwOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gH+hgf5i;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A661606A325
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gH+hgf5i
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85EAC1F000C4;
	Wed, 18 Nov 2026 06:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794982050;
	bh=4O2M6DjzNYvNSUJkigNXwXXVLbLSdFMdZsPmTdwOj/M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gH+hgf5iXxDZWiN388MTCqCGeGJEkdb6bRRqFi/M/Huiv8xJnz/02miBxhmi2cr7/
	 D57kfwyVOSxXnlj/It2SkBmMZyZ6MFzfN8f0q4nX44pcq6NXJ6LZrcVEA4lhy0xQh8
	 a2IaMfwNmC7fRs3GSPbuJ0BlNX8o4mSQvfmn/NBmXSxDsST7zorgELLkPqAeduakat
	 q7GkNXu7cM/EVC9t7ND4XnVC9z2gT7SWIOV2Bkqhlbf/VHQDIfOonC4jjWw3nUIw6G
	 o4H54wqrr3Xd74uLNWljNns0Z0IH4ftmCyyHODwQ8iLKYsQAQwRYxVmAFpCxzyNZuc
	 4xfCW+SrvUz0Q==
Message-ID: <sashiko-outbox-220207@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 5/9] phy: rockchip-samsung-dcphy: Move block-level
 setup to runtime resume
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jason Yang" <jason98166@gmail.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261118-dcphy-rx-v1-v7-5-8de1adac3a74@gmail.com>
References: <20261118-dcphy-rx-v1-v7-0-8de1adac3a74@gmail.com>
 <20261118-dcphy-rx-v1-v7-5-8de1adac3a74@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 06:07:29 +0000
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

commit a6584894a1af89f8c3700f6291dca98835a2e8c7
Author: Jason Yang <jason98166@gmail.com>

phy: rockchip-samsung-dcphy: Move block-level setup to runtime resume

This commit moves the APB reset pulse and BIAS block initialization from the
D-PHY power-on path to the runtime resume callback so that bringing up a
second PHY consumer does not reset the shared block.

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
Does removing the apb_rst pulse from samsung_mipi_dcphy_power_on() leave
spread-spectrum clocking enabled when reconfiguring the transmitter from a
rate above 2.5 Gbps to 2.5 Gbps or below while the device stays runtime
resumed?

Without the APB reset on each power-on, PLL_CON3 and PLL_CON4 keep their
previous values across mode changes, and samsung_mipi_dcphy_pll_configure()
only touches them when samsung->pll.ssc_en is true:

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

In addition, samsung_mipi_dcphy_pll_calc_rate() sets samsung->pll.ssc_en to
true when fout > 2500000000LL, but never clears it back to false for lower
rates, so both the driver state and SSCG_EN in PLL_CON4 stay enabled with
stale modulation parameters.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118-dcphy-rx-v=
1-v7-0-8de1adac3a74@gmail.com?part=3D5
