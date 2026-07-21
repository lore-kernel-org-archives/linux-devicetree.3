Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20C447CC71
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 10:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784630708; cv=none; b=MdYF0vHp6ZHzLhlgRKnwCjCll/sr9U+HTZClCHsMltgX7aMEpKm6dKgbddAnAQErhEgmXuB2SMhnAMns0nOMyrTB+Ipk8WtGBc6a4Rs67WOu/7AcZNV7Hyaang24ITGWaqLZSavv7vzn4167X68fqJsM4Jyuk/xkU5wdO2OCGqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784630708; c=relaxed/simple;
	bh=5EM7ubJjHz5fiA28FWIG4AbOWJqBv2zGh8oX0Y6j+IU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TR4Sj/fX2BVLDE7FW0G3lYe6TlF7XBQ4tgL7Cs3XE/d+K4Lj2X2EmfL5jPJQO7qyHtF4zL4iJR+pjxaIggtyrNjfBsdq4n4pGfSu2u5s7ZLCKDMdrUvtCpB9aTNnYHSDMdQWVBz3FykmANRWrCyaHtxdK2aVjHI0Meq6djaGHEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vs6SiBL/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vs6SiBL/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0695D1F01560;
	Tue, 21 Jul 2026 10:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784630696;
	bh=tJX4kj2jitKMiWS+Uh9p1DsaUgPNpmcPv2ceUiltH1g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Vs6SiBL/KFPnpCoM5pqp4FJeZNCbkhOcPI0rbHwFRqGplKTucjaebXk/sTSSdTgyU
	 uJCZ8KoxYXMvmsKsnEmgFRusZCjPd2AUFQxmDmmQX16TaFRiXffHmKUcEf8mJoAroq
	 mV0uFqZWcEsywoycdkPQS+6MhzzwUAqD3QzSRU137DMapoC+qz5tf7RagYJy4sQ481
	 5yfQpPqyTwT0jgMdPrddS0/2cajE5IrwVZkTo8Rv2DimgixrIG+4Ck4xRSwNl6zKvE
	 VAwJtYE9h4WGsH++Wa5mnEquRrXVyC1BT6r2y2stJbZxhluo//D8SSA9JKWT1QTTgb
	 Gpb0+ycUlTVng==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] phy: rockchip-samsung-dcphy: model TX and RX as
 separate PHYs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jason Yang" <jason98166@gmail.com>
Cc: conor+dt@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com, vkoul@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, linux-phy@lists.infradead.org
In-Reply-To: <20260721-dcphy-rx-v1-v1-3-4fc83c0ccac9@gmail.com>
References: <20260721-dcphy-rx-v1-v1-0-4fc83c0ccac9@gmail.com>
 <20260721-dcphy-rx-v1-v1-3-4fc83c0ccac9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 10:44:55 +0000
Message-Id: <20260721104456.0695D1F01560@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Concurrent or unsupported PHY configuration clobbers the shared `s=
amsung->lanes` driver state before verifying the direction is supported.
--

--- Patch [3]: [PATCH 3/4] phy: rockchip-samsung-dcphy: model TX and RX as =
separate PHYs ---
commit 242b9435d09e0133de4658156f3cc224aa2f84c9
Author: Jason Yang <jason98166@gmail.com>

phy: rockchip-samsung-dcphy: model TX and RX as separate PHYs

This commit models the MIPI DSI transmitter and MIPI CSI receiver as separa=
te
PHYs that share the same hardware block. It registers one struct phy per
direction and adds a per-provider mutex to serialize access to the shared
state.

> diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c b/drivers/=
phy/rockchip/phy-rockchip-samsung-dcphy.c
> --- a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
> +++ b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c

[ ... ]

> @@ -1488,11 +1521,15 @@ samsung_mipi_dcphy_pll_calc_rate(struct samsung_m=
ipi_dcphy *samsung,
>  static int samsung_mipi_dcphy_configure(struct phy *phy,
>  					union phy_configure_opts *opts)
>  {
> -	struct samsung_mipi_dcphy *samsung =3D phy_get_drvdata(phy);
> +	struct samsung_mipi_dcphy_dir *pd =3D phy_get_drvdata(phy);
> +	struct samsung_mipi_dcphy *samsung =3D pd->parent;
>  	unsigned long long target_rate =3D opts->mipi_dphy.hs_clk_rate;
> =20
>  	samsung->lanes =3D opts->mipi_dphy.lanes > 4 ? 4 : opts->mipi_dphy.lane=
s;
> =20
> +	if (pd->dir =3D=3D RK_DCPHY_DIR_RX)
> +		return -EOPNOTSUPP;
> +

[Severity: High]
Does this code modify the shared samsung->lanes state before checking if
the direction is supported?

Since this is done without holding samsung->lock, can a consumer
configuring the RX PHY clobber the active TX PHY's lane count?

If the lane count is corrupted, it looks like it could lead to incorrect la=
ne
power-down sequences when the TX PHY is disabled later, potentially leaving
MIPI lanes actively driven.

Should the pd->dir check and the lock acquisition happen before updating
samsung->lanes?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721-dcphy-rx-v=
1-v1-0-4fc83c0ccac9@gmail.com?part=3D3
