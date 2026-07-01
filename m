Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD331E531
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 13:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782911159; cv=none; b=ttu5Xu5jRi+fHlmGbllu++lppiDJt25RzcOa4rMpSx2Pp8bec1CfGfhCMEv82cKtpp491aZQDEuljH6GImvpAT97P3cfIXjgLIFEqZeeo962Jy0eWY96wnXmUClVcZlQlJY1PbfNgXSXRvfj5UK6rpGjJ50Z0NQBKEtxqVvCRbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782911159; c=relaxed/simple;
	bh=mHY2A+LD9rs+H18H9wvDq6wbCI2QksmQrsmLffcd1Fs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=U4c43emX+g2tJS+HgQsrFf04f5YbM5Gf26ATXQTHr/YdqlKaSfekcpNYy1/Qwy6MfUH5X8gXq9N8mkEYGDMZq68+eZlFnIf8kzgIlqNZ8W19MTZ9/PKPb/Wk1qHcSWryNN3/v+btgDljH2uMwsDrD5ULJ6PM9+hl3/1ae/Dgz5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GVTttF6K; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GVTttF6K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1954E1F000E9;
	Wed,  1 Jul 2026 13:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782911158;
	bh=mJGnjd83HEOg1bmOOvMHGZTOklHSFANF9GaHyCXBPBQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GVTttF6Kne91Qs6Y2yDhf923njcHyQDPXDq2JCsxaSdiDKdm+Yo1IM58+RdjXyL+x
	 BwZAqvfbPJgjasCpMoSzCKnmZl66TfNu81/ZjK56HDRarSm7iwZxAQaK9NBfDk4fo1
	 gkydsd5apWBDotyAziv1ZacEwKAvAQsyCTbcg99LhOljMhnjjCvlnSMDrjTvtxR4ra
	 1L94rKybLeXVJvNthGYyussJVZrveklwduXANzqqkj25e70ndw2n/z8n6b4RJIgQnI
	 9CHMHhmcY9T4EkozDpVlI+xR+OPfI711lA0/eCRPe4Fyztc0CjQ7irEvcwpB/JuLoJ
	 7LIvxtlXX3ATA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 06/11] drm/mediatek: mtk_dp: Use PHY API for PHY power
 sequences
Reply-To: sashiko-reviews@lists.linux.dev
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
In-Reply-To: <20260701122024.19557-7-angelogioacchino.delregno@collabora.com>
References: <20260701122024.19557-1-angelogioacchino.delregno@collabora.com>
 <20260701122024.19557-7-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Jul 2026 13:05:57 +0000
Message-Id: <20260701130558.1954E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Double unregister of the PHY platform device on error paths.
- [High] HDMI audio codec platform device is leaked due to a copy-paste err=
or.
- [High] Ignoring the return value of phy_power_on() causes an unbalanced p=
hy_power_off() call if power-on fails.
--

commit 6e6e078245707d85aa500b0a872e31948a456e4f
Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

drm/mediatek: mtk_dp: Use PHY API for PHY power sequences
   =20
The PHY driver has gained support for .power_on() and .power_off()
callbacks: use the API provided phy_power_on(), phy_power_off()
functions instead of writing into PHY registers from this driver.

> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek=
/mtk_dp.c
> index 97bce8966a1f3..3b5348ab487de 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> @@ -1425,21 +1427,37 @@ static void mtk_dp_power_enable(struct mtk_dp *mt=
k_dp)
>  			   SW_RST_B_PHYD, SW_RST_B_PHYD);
>  	mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
>  			   DP_PWR_STATE_BANDGAP_TPLL, DP_PWR_STATE_MASK);
> -	mtk_dp_write(mtk_dp, DP_PHY_AUX_RX_CTL,
> -		     RG_DPAUX_RX_VALID_DEGLITCH_EN | RG_XTP_GLB_CKDET_EN |
> -		     RG_DPAUX_RX_EN);
> -	mtk_dp_update_bits(mtk_dp, MTK_DP_0034, 0, DA_CKM_CKTX0_EN_FORCE_EN);
> +
> +	if (mtk_dp->phy_dev) {
> +		mtk_dp_write(mtk_dp, DP_PHY_AUX_RX_CTL,
> +			     RG_DPAUX_RX_VALID_DEGLITCH_EN | RG_XTP_GLB_CKDET_EN |
> +			     RG_DPAUX_RX_EN);
> +		mtk_dp_update_bits(mtk_dp, MTK_DP_0034, 0, DA_CKM_CKTX0_EN_FORCE_EN);
> +	} else {
> +		ret =3D phy_power_on(mtk_dp->phy);
> +		if (ret)
> +			dev_warn(mtk_dp->dev, "Could not power on PHY!\n");

[Severity: High]
Does ignoring the return value of phy_power_on() cause an unbalanced
phy_power_off() call if power-on fails?

If phy_power_on() fails, the error is swallowed and only a warning is print=
ed.
The function returns normally, leaving the PHY core's internal power_count =
at 0.

> +	}
>  }
> =20
>  static void mtk_dp_power_disable(struct mtk_dp *mtk_dp)
>  {
> +	int ret;
> +
>  	mtk_dp_write(mtk_dp, MTK_DP_TOP_PWR_STATE, 0);
> =20
> -	mtk_dp_update_bits(mtk_dp, MTK_DP_0034,
> +	if (unlikely(mtk_dp->phy_dev)) {
> +		mtk_dp_update_bits(mtk_dp, MTK_DP_0034,
>  			   DA_CKM_CKTX0_EN_FORCE_EN, DA_CKM_CKTX0_EN_FORCE_EN);
> =20
> -	/* Disable RX */
> -	mtk_dp_write(mtk_dp, DP_PHY_AUX_RX_CTL, 0);
> +		/* Disable RX */
> +		mtk_dp_write(mtk_dp, DP_PHY_AUX_RX_CTL, 0);
> +	} else {
> +		ret =3D phy_power_off(mtk_dp->phy);

[Severity: High]
Can this unbalanced teardown lead to refcount underflows?

This function unconditionally calls phy_power_off() even if the initial
power-on failed. This decrements power_count to -1 and attempts to disable
regulators and release PM runtime references that were never actually acqui=
red.

> +		if (ret)
> +			dev_warn(mtk_dp->dev, "Could not power off PHY!\n");
> +	}
> +
>  	mtk_dp_write(mtk_dp, MTK_DP_TOP_MEM_PD,
>  		     0x550 | FUSE_SEL | MEM_ISO_EN);
>  }

[ ... ]

The following issues were introduced earlier in this patch series in commit
"drm/mediatek: mtk_dp: Fix hdmi codec and phy driver unregistration":

> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek=
/mtk_dp.c
> @@ -2680,18 +2687,29 @@ static int mtk_dp_register_audio_driver(struct de=
vice *dev)
>  		.data =3D mtk_dp,
>  		.no_capture_mute =3D 1,
>  	};
> +	int ret;
> =20
>  	mtk_dp->audio_pdev =3D platform_device_register_data(dev,
>  							   HDMI_CODEC_DRV_NAME,
>  							   PLATFORM_DEVID_AUTO,
>  							   &codec_data,
>  							   sizeof(codec_data));
> -	return PTR_ERR_OR_ZERO(mtk_dp->audio_pdev);
> +	if (IS_ERR(mtk_dp->audio_pdev))
> +		return PTR_ERR(mtk_dp->audio_pdev);
> +
> +	ret =3D devm_add_action_or_reset(dev, mtk_dp_unregister_pdevs, mtk_dp->=
phy_dev);

[Severity: High]
Does this devm action incorrectly register mtk_dp->phy_dev for cleanup inst=
ead
of the newly created mtk_dp->audio_pdev?

Since this function is called before mtk_dp_register_phy(), mtk_dp->phy_dev=
 is
NULL. When the driver is unbound, devres executes mtk_dp_unregister_pdevs(N=
ULL),
and the actual audio_pdev is permanently leaked.

> +	if (ret) {
> +		platform_device_unregister(mtk_dp->audio_pdev);
> +		return dev_err_probe(dev, ret,
> +				     "Failed to add codec unregister devm action");
> +	}
> +	return 0;
>  }
> =20
>  static int mtk_dp_register_phy(struct mtk_dp *mtk_dp)
>  {
>  	struct device *dev =3D mtk_dp->dev;
> +	int ret;
> =20
>  	mtk_dp->phy_dev =3D platform_device_register_data(dev, "mediatek-dp-phy=
",
>  							PLATFORM_DEVID_AUTO,
> @@ -2701,6 +2719,13 @@ static int mtk_dp_register_phy(struct mtk_dp *mtk_=
dp)
>  		return dev_err_probe(dev, PTR_ERR(mtk_dp->phy_dev),
>  				     "Failed to create device mediatek-dp-phy\n");
> =20
> +	ret =3D devm_add_action_or_reset(dev, mtk_dp_unregister_pdevs, mtk_dp->=
phy_dev);
> +	if (ret) {
> +		platform_device_unregister(mtk_dp->phy_dev);

[Severity: High]
Does this error path cause a double unregister of the PHY platform device?

If devm_add_action_or_reset() fails, it automatically executes the cleanup
action (mtk_dp_unregister_pdevs), which calls
platform_device_unregister(mtk_dp->phy_dev). The error handler then manually
calls platform_device_unregister(mtk_dp->phy_dev) a second time.

Alternatively, if devm_add_action_or_reset() succeeds but devm_phy_get() fa=
ils
later in the function, the error handler manually unregisters the device. T=
he
probe then fails, and devres cleans up by executing the registered action,
unregistering the device a second time.

> +		return dev_err_probe(dev, ret,
> +				     "Failed to add phy unregister devm action");
> +	}
> +
>  	mtk_dp_get_calibration_data(mtk_dp);
> =20
>  	mtk_dp->phy =3D devm_phy_get(&mtk_dp->phy_dev->dev, "dp");

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701122024.1955=
7-1-angelogioacchino.delregno@collabora.com?part=3D6
