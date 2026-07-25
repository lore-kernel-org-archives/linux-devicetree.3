Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A39A2D5412
	for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 17:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784999053; cv=none; b=ZaD/md1alsPgsY6s2nJW9pFKt+I19qC/bt+wYvFVEs1yaAnw79Bvla7r4pBx1GHwwtKDhesMrWmmq5/bXQILv+sth0EO1bsmk1vSZDR5VWQt9T9oEvWTaPOyHQQ6r+bWc33FplRxMZoqK70OvKVDwRmxAGKSmO8+l8aoDC2Wcns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784999053; c=relaxed/simple;
	bh=KS24fp2hjExXdJWJKJNGazja21SQfq3QfZA0W7djCYc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nPoOwlwcUufcfwAp20KmTPJQS5Qp9Zj0bUzCKkR+JJiQguMUTzcY+3hwEqB4KR8N9pE2cdNgrHglhl2x3eJy+rYYJtee/xxCmv3iEQvNFwDJdXE+tqlfoYcG9VKSxVbLyvhtFotXEbBLlWBMdGmG6+odEzUpP28AdgMOoPeN6NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hQ2EQCFc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hQ2EQCFc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BC9A1F000E9;
	Sat, 25 Jul 2026 17:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784999051;
	bh=9yDTOoJHkJsbvQ7Dq8/vdLVppCEVxAzUpjtQ9OQeIWI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hQ2EQCFcgZlxv+lC5fa15ePQIEbXO7uZJxEnh60qjJ5lc+FIYSmePRxwnrzK6auI3
	 31nBsWgxE/Rtc+zclevNUa4EFioVQ3ms4+slvx6jk1lTfwpR4Fi8YPfwMpd6e+UGFN
	 rJpI/ggrektvtvJGecc9O3uBT7NaRZmLCpog5DROGhsHGWed15Q0dmXW7ooXv8/1LD
	 FTwTc4vyrVvszfo645brXqCfAQueV5KSr4m1LpiX4om2gPaBC7i01hIJfOMM3lXpm4
	 kzVG9FaTA2kxjN5OZUtQPM/8yIOOOi5gznIjvGmq1HO+WuFKvuF2RECRvtXjr+WLrl
	 wyFei2sEV4GIw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/3] phy: rockchip: phy-rockchip-inno-csidphy: fix
 rk1808 hsfreq table
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gerald Loacker" <gerald.loacker@wolfvision.net>
Cc: olteanv@gmail.com, linux-phy@lists.infradead.org, neil.armstrong@linaro.org, robh@kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260725-feature-mipi-csi-dphy-4k60-v4-1-5b2c4626d31e@wolfvision.net>
References: <20260725-feature-mipi-csi-dphy-4k60-v4-0-5b2c4626d31e@wolfvision.net>
 <20260725-feature-mipi-csi-dphy-4k60-v4-1-5b2c4626d31e@wolfvision.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 25 Jul 2026 17:04:10 +0000
Message-Id: <20260725170411.6BC9A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Valid MIPI D-PHY data rates <=3D 109 Mbps are incorrectly rejected=
 due to an ambiguous sentinel check on `hsfreq`.
- [High] The driver requests exclusive hardware reset controls during probe=
 but fails to ever deassert them.
- [High] The PHY provider is registered before PM runtime is enabled, leadi=
ng to a race condition that can cause unexpected `-EACCES` failures on init=
ialization.
--

--- Patch [1]: [PATCH v4 1/3] phy: rockchip: phy-rockchip-inno-csidphy: fix=
 rk1808 hsfreq table ---
commit 4840808911c634155f4b288f67fa4f3c71720406
Author: Gerald Loacker <gerald.loacker@wolfvision.net>

phy: rockchip: phy-rockchip-inno-csidphy: fix rk1808 hsfreq table

The rk1808 hsfreq table capped at 2499 Mbps, preventing a data rate of
exactly 2500 Mbps. Extend the final entry to 2500 Mbps to support this
rate.

> diff --git a/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c b/drivers/p=
hy/rockchip/phy-rockchip-inno-csidphy.c
> index c79fb53d8ee5c..5281f8dea0ad3 100644
> --- a/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
> +++ b/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
> @@ -170,7 +170,7 @@ static const struct hsfreq_range rk1808_mipidphy_hsfr=
eq_ranges[] =3D {
>  	{ 299, 0x06}, { 399, 0x08}, { 499, 0x0b}, { 599, 0x0e},
>  	{ 699, 0x10}, { 799, 0x12}, { 999, 0x16}, {1199, 0x1e},
>  	{1399, 0x23}, {1599, 0x2d}, {1799, 0x32}, {1999, 0x37},
> -	{2199, 0x3c}, {2399, 0x41}, {2499, 0x46}
> +	{2199, 0x3c}, {2399, 0x41}, {2500, 0x46}
>  };
> =20
>  static const struct hsfreq_range rk3326_mipidphy_hsfreq_ranges[] =3D {

[Severity: High]
This isn't a bug introduced by this patch, but since you are modifying the=
=20
hsfreq table, I noticed a potential problem in how these entries are=20
processed.

In rk3326_mipidphy_hsfreq_ranges, the lowest frequency range sets the=20
configuration bit to 0x00:

static const struct hsfreq_range rk3326_mipidphy_hsfreq_ranges[] =3D {
	{ 109, 0x00}, { 149, 0x01}, { 199, 0x02}, { 249, 0x03},

Later in rockchip_inno_csidphy_configure(), we check for a match and fail=20
if hsfreq is zero:

	for (i =3D 0; i < drv_data->num_hsfreq_ranges; i++) {
		if (drv_data->hsfreq_ranges[i].range_h >=3D data_rate_mbps) {
			hsfreq =3D drv_data->hsfreq_ranges[i].cfg_bit;
			break;
		}
	}
	if (!hsfreq)
		return -EINVAL;

Does this condition mistakenly reject valid low data rates (<=3D 109 Mbps)?=
=20
When data_rate_mbps is 109 or lower, hsfreq becomes 0x00, which causes the=
=20
check to fail and return -EINVAL.=20

[Severity: High]
This is a pre-existing issue, but looking at the driver's initialization,=20
it requests exclusive resets but doesn't seem to use them:

rockchip_inno_csidphy_probe() {
    ...
	ret =3D devm_reset_control_bulk_get_exclusive(dev, priv->resets_num,
						    priv->resets);
    ...
}

I don't see any calls to reset_control_bulk_deassert() or=20
reset_control_bulk_assert() for priv->resets anywhere in=20
rockchip_inno_csidphy_power_on(). Can this leave the PHY hardware stuck in=
=20
reset if the bootloader didn't deassert it beforehand?

[Severity: High]
This is another pre-existing issue, but I noticed a potential race=20
condition during initialization in rockchip_inno_csidphy_probe():

	phy_provider =3D devm_of_phy_provider_register(dev, of_phy_simple_xlate);
	if (IS_ERR(phy_provider)) {
		dev_err(dev, "failed to register phy provider\n");
		return PTR_ERR(phy_provider);
	}

	pm_runtime_enable(dev);

Does this expose the PHY provider to consumers before PM runtime is fully=20
enabled?=20

If a consumer probes concurrently and calls phy_power_on(), the call routes=
=20
to rockchip_inno_csidphy_power_on(). That function attempts to call=20
pm_runtime_resume_and_get().=20

Wouldn't this return -EACCES since runtime PM isn't enabled yet, causing=20
unexpected probe failures for the consumer?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260725-feature-mi=
pi-csi-dphy-4k60-v4-0-5b2c4626d31e@wolfvision.net?part=3D1
