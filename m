Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47654756A7
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 14:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787235026; cv=none; b=XVpTGUZeB0rcPs6EASfroRUUj88rPmqjpv6FGTr9wyAE2XFpgu0ev32XlEHZQ3iFZTX5qC5BtqrsflV4eMtC12TgKaP5+vlz31Gd+zFceBgm9pqGrg0qbQEy5/nfox9GIcpgZtQOeavWhfThH2B31sDAlUpZt7fkStSIlxb4mvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787235026; c=relaxed/simple;
	bh=m1iH+Rb0wRbKdMdZG//oG/mEeXWg3lauJhMPeMkrfXM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dPjhz1GngPTRYd307xyFk4Nyaq2QvUNOCLy8lVZL7xqUEe4dIYSqSTDlktV80oJ6I+ft3m6Q2wdNhSdyDzcQMAiHGHAJ0tHF7X/ZmvkOcRSreax2y+6ghpgClT57milvMG6N9AKiRl3Xt4Ppc63gtsNpNerJY6kZdDTF+hITnuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C+0jDr3I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C+0jDr3I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53E4C1F000E9;
	Thu, 20 Aug 2026 14:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787235024;
	bh=a+CmMMv9Z4Q0fBZyfb5J0prYodpTqEsZ2Ssj38rEE+0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=C+0jDr3IbuvSCpb3x1qwLZWATfyjjXZ102wpOgdbjP1uxs+eneLQhC3G13OX6DlV5
	 PhS0u/f4qz9vUuTL1lSR8JLawIJwAhk1kHnbwR4XGdH2lsu8SbrZHdAkXVy8eHsqLC
	 +Q1QLwjqBdarJt1Xe865XNDS03SV6oezA+BpiFlOD/LJFi8ohBbTGXjOg1qurOYXap
	 QKbU2Dy5x4IAiWQWqfQEB4v7JdjlOTmhRB4+xBSPg4onskmASzD+yQxA3PUDDbn6TD
	 sBkzv471K/jg1aEKD5RWqUrUIIA/XvIzIzIHtqsgcr0gC3EsL3lUuSGAH57+mJqEv5
	 8kac0hl2jTEhQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] phy: rockchip: phy-rockchip-inno-csidphy: add
 support for rk3576 variant
Reply-To: sashiko-reviews@lists.linux.dev
To: "Amin Gattout" <amin.gattout@gmail.com>
Cc: conor+dt@kernel.org, neil.armstrong@linaro.org, linux-phy@lists.infradead.org, vkoul@kernel.org, olteanv@gmail.com, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260820-rk3576-dphy-v1-3-70e25e8d5e78@gmail.com>
References: <20260820-rk3576-dphy-v1-0-70e25e8d5e78@gmail.com>
 <20260820-rk3576-dphy-v1-3-70e25e8d5e78@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 14:10:23 +0000
Message-Id: <20260820141024.53E4C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver acquires exclusive control over the PHY resets but neve=
r asserts or deasserts them during its lifecycle.
--

--- Patch [3]: [PATCH 3/4] phy: rockchip: phy-rockchip-inno-csidphy: add su=
pport for rk3576 variant ---
commit f333cc625c5d500108f905c6acdcb428ada8e7d6
Author: Amin Gattout <amin.gattout@gmail.com>

phy: rockchip: phy-rockchip-inno-csidphy: add support for rk3576 variant

This commit adds support for the RK3576 MIPI CSI-2 DPHY to the existing
rockchip-inno-csidphy driver. It introduces driver data and register
definitions for the new variant.

> diff --git a/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c b/drivers/p=
hy/rockchip/phy-rockchip-inno-csidphy.c
> index c79fb53d8ee5c..24aefdcd63617 100644
> --- a/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
> +++ b/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c

[ ... ]

> @@ -403,6 +410,17 @@ static const struct dphy_drv_data rk3568_mipidphy_dr=
v_data =3D {
>  	.resets_num =3D ARRAY_SIZE(rk3368_reset_names),
>  };
> =20
> +static const struct dphy_drv_data rk3576_mipidphy_drv_data =3D {
> +	.pwrctl_offset =3D -1,
> +	.ths_settle_offset =3D RK3568_CSIDPHY_CLK_WR_THS_SETTLE,
> +	.calib_offset =3D RK3568_CSIDPHY_CLK_CALIB_EN,
> +	.hsfreq_ranges =3D rk1808_mipidphy_hsfreq_ranges,
> +	.num_hsfreq_ranges =3D ARRAY_SIZE(rk1808_mipidphy_hsfreq_ranges),
> +	.grf_regs =3D rk3576_grf_dphy_regs,
> +	.resets =3D rk3368_reset_names,
> +	.resets_num =3D ARRAY_SIZE(rk3368_reset_names),

[Severity: High]
This is a pre-existing issue, but does the driver actually use these resets
after acquiring them?

Looking at rockchip_inno_csidphy_probe(), the driver acquires exclusive
control of the resets:

drivers/phy/rockchip/phy-rockchip-inno-csidphy.c:rockchip_inno_csidphy_prob=
e()
	ret =3D devm_reset_control_bulk_get_exclusive(dev, priv->resets_num,
						    priv->resets);
	if (ret) {
		dev_err(dev, "failed to get system reset control\n");
		return ret;
	}

However, the driver doesn't appear to ever call reset_control_bulk_deassert=
()=20
or reset_control_bulk_assert() during its lifecycle (such as in power_on or
init paths).

Because the driver claims exclusive control, no other subsystem can manage
these resets. Will the hardware remain permanently in reset and silently fa=
il
to operate if it is left asserted by the bootloader or a previous stage?

> +};
> +
>  static const struct dphy_drv_data rk3588_mipidphy_drv_data =3D {
>  	.pwrctl_offset =3D -1,
>  	.ths_settle_offset =3D RK3568_CSIDPHY_CLK_WR_THS_SETTLE,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820-rk3576-dph=
y-v1-0-70e25e8d5e78@gmail.com?part=3D3
