Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF88443E3B
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 09:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792141629; cv=none; b=Njg10etjtBdpu5K4NB8YZxWTG7ffrhXKTlTtN3QehUqkXShVdzsiVAQU/8NAWuQ35j1eVOZgG/P03Whmgl3WU5TO/Ru/eLj6C81FY6NcF8PhQEBI/GLQL8q7Ul9lWGkf9Gp6PBIEQS83SGolI8Qvr6ZeFTsq34xrnG+tDGcXWJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792141629; c=relaxed/simple;
	bh=Wbg4f9JtQGzCOLp2zw55LLl1gAAq0+l/CrlyOqXlygA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=sFOehnJ04prWe7O+zaZ7H6Mr3kB2QVvJk0lonUu825u2POJxdiqm5AnMyyFVJSrMyAcjcuCeG79HilDsWUYIwTHchDVJ8PL85kwFHO02M50l8/+Y2Tg1wpXDyOdeKgasjBhcwlXXAwpM0SIapZqUpQ76MvnKuVprBf1sxTbhmvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=klzU1Oh7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="klzU1Oh7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C75E21F000C4;
	Fri, 16 Oct 2026 09:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792141628;
	bh=nXt0Ffk5ZyKbQZPWHout7lvibtTQy4gqCcXtkg6VLrI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=klzU1Oh7OQsSXczOnKLIr3QyphZ5un5GbMYyWhog8qQ6+Luwxx/AKiIE1mGJUfx3S
	 m3rz4QfcF9yrVjB+CTRqeYjXy2t5rTanm0MUMKv7pocY+ixceyqzlyyrE408nYkLJR
	 kPc3kIiOHhR1owyrvBSv5ONMW3aAOLg9uCf8CCyaFcsQyDNZJ9S4on0Z3YswdVWT0I
	 BC7Mkdj8SNFPe4r2mapTjAW1SvAnHZ9N2RzFmCIRdOFF2kItLP3cQDuk+vWgwzJMAu
	 /iz86x4Cyy/Ko3zKREO4dXGerpAUpbEDX6p6EFnqxXChT7P4QVJf9Y72pHikZXNWK4
	 oCdkwuBQ1uocg==
Message-ID: <sashiko-outbox-174053@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 4/8] phy: rockchip-samsung-dcphy: Name the
 transmitter helpers and ops
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jason Yang" <jason98166@gmail.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261016-dcphy-rx-v1-v5-4-e63b49eabe2d@gmail.com>
References: <20261016-dcphy-rx-v1-v5-0-e63b49eabe2d@gmail.com>
 <20261016-dcphy-rx-v1-v5-4-e63b49eabe2d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 09:07:07 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] phy: missing PLL disable and reset deassert on tx_power_on error
--

commit 779b5f96ef2afd3f131c3123d0f3f45979f568d8
Author: Jason Yang <jason98166@gmail.com>

phy: rockchip-samsung-dcphy: Name the transmitter helpers and ops

The block is a combo PHY: it exposes a transmitter and a receiver, and a
later change registers one struct phy for each. Prepare for that. Give
every helper that programs the master lanes a tx_ prefix, and move the
phy pointer and the lane count, which only the transmitter uses, into a
struct samsung_mipi_phy that the receiver can have one of too.

> diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c b/drivers/=
phy/rockchip/phy-rockchip-samsung-dcphy.c
> index 1471a1563d2a1..e4293c8d2b292 100644
> --- a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
> +++ b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c

[ ... ]

> @@ -1339,13 +1343,13 @@ static int samsung_mipi_dphy_power_on(struct sams=
ung_mipi_dcphy *samsung)
>  			   I_MUX_SEL_MASK, I_MUX_400MV);
> =20
>  	samsung_mipi_dcphy_pll_configure(samsung);
> -	samsung_mipi_dphy_clk_lane_timing_init(samsung);
> -	samsung_mipi_dphy_data_lane_timing_init(samsung);
> +	samsung_mipi_dphy_tx_clk_lane_timing_init(samsung);
> +	samsung_mipi_dphy_tx_data_lane_timing_init(samsung);
>  	ret =3D samsung_mipi_dcphy_pll_enable(samsung);
>  	if (ret < 0)
>  		return ret;

[Severity: Medium]
If samsung_mipi_dcphy_pll_enable() times out, does this error path return
early without clearing the PLL_EN bit or deasserting the m_phy_rst reset li=
ne?

When samsung_mipi_dcphy_pll_enable() fails, it returns an error but the PHY=
 is
left with the PLL_EN bit set and m_phy_rst asserted. The PHY framework does=
 not
call phy_power_off() if phy_power_on() fails, so this hardware state could =
leak,
potentially preventing successful lock on future relock attempts.

> =20
> -	samsung_mipi_dphy_lane_enable(samsung);
> +	samsung_mipi_dphy_tx_lane_enable(samsung);
> =20
>  	reset_control_deassert(samsung->m_phy_rst);
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016-dcphy-rx-v=
1-v5-0-e63b49eabe2d@gmail.com?part=3D4
