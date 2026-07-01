Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7443F44CA
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 13:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782912242; cv=none; b=QbzaDuD5ZR7OhctG+Iy0AheRuR7JPdN/pqdto3fYNAhD3giU3DK+D9PYFu6rlLmZR4E+RULj6XtRI4/Qe0yuGbFwt8zEUgrn/LObJ4GOJmqbMQ0SdI5+cCtbArQMR4FK9SPC/v1jS9DG5wETaQgwHhLomA4jDCB/aRIyIxXLerA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782912242; c=relaxed/simple;
	bh=KhYSRODMCt3hM1xOicEtHbnEHQj1GKnteSExoMBJfqQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KGiM242mO+R81pyGe+kJjS5gsnNqmBKe+Ew9IYoGoAyXey4IyIONUD+03uodP1SFyQLezLKQdZ1d4x6kC1mEzk0fhNfTZzH/dwo+h5xTyyOI9q+P1wynIwOTe3D093Ddieq/k4uVWDiYLqibXBRVr3sWj/RzM7h8J10M6mC7Zjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jr+mmcrq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jr+mmcrq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F8221F000E9;
	Wed,  1 Jul 2026 13:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782912240;
	bh=5ce/YNWsrifgEin2n5qYwukz7Qqgy+q+kcFFDG9/5qw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Jr+mmcrqsuiACQLOxL+r3vTNaZEncfl9eEXdVUM6L4ofbohFUM1vtM9dYBYxO0OPg
	 cHeL8K9wCA4u1ggJZZtiVUGk5v7GZc69CS4fnnWjzv+NZbY7ew+mKb3CDmrvzfSq3D
	 IlbyoWi1tQQmv8X2qxKKJNpYjifkcnH5DoAbIrcp3mRW+Gea7mq8gbISwtoWlL5p4S
	 iZfqka8MDyB9b7CAjRvfiMLtxyGcDAJG9zYYp163ENA5X1eBOpB0qXhDVQYyhooiwT
	 Olh+BjvD3Z7lg4T1iJICJsjCmvIZ5O5+G/+6nuAfF8Ykz+CycNJX9QMylMDkrg0hJY
	 DpRMK1oN9afeg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 07/11] drm/mediatek: mtk_dp: Add support for PHY from
 devicetree
Reply-To: sashiko-reviews@lists.linux.dev
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, dri-devel@lists.freedesktop.org, conor+dt@kernel.org
In-Reply-To: <20260701122024.19557-8-angelogioacchino.delregno@collabora.com>
References: <20260701122024.19557-1-angelogioacchino.delregno@collabora.com>
 <20260701122024.19557-8-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Jul 2026 13:23:59 +0000
Message-Id: <20260701132400.5F8221F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Double unregister of the mediatek-dp-phy platform device (`mtk_dp-=
>phy_dev`) on error paths.
- [High] Legacy PHY registers are incorrectly offset by `mtk_dp->legacy_reg=
off`, corrupting DP TOP and ENC registers and breaking PHY initialization o=
n legacy device trees.
- [Medium] The HDMI audio codec platform device (`mtk_dp->audio_pdev`) is l=
eaked on driver removal or probe failure.
--

commit 60c3f9c6bb6ec600fc25d97fe75494a73e71c05b
Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

    drm/mediatek: mtk_dp: Add support for PHY from devicetree
   =20
    Add support for specifying phys in devicetree to pass handle
    to the DisplayPort PHY.
   =20
    In order to retain compatibility with older devicetrees, check if
    phys was specified: if not, initialize the regmap_mmio with the
    legacy configuration and register the mediatek-dp-phy platform
    device from this driver, and get the PHY calibration data.

> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek=
/mtk_dp.c
> index 3b5348ab487de..bf3a4b15f3ec0 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
[ ... ]
> @@ -2769,6 +2790,7 @@ static int mtk_dp_register_phy(struct mtk_dp *mtk_d=
p)
>  				     "Failed to add phy unregister devm action");
>  	}
> =20
> +	/* PHY calibration data is in mtk_dp only for legacy devicetree */
>  	mtk_dp_get_calibration_data(mtk_dp);
> =20
>  	mtk_dp->phy =3D devm_phy_get(&mtk_dp->phy_dev->dev, "dp");

[Severity: High]
Does this code double-unregister the mediatek-dp-phy platform device?

Earlier in mtk_dp_register_phy(), devm_add_action_or_reset() is called to
register mtk_dp_unregister_pdevs. If devm_phy_get() fails, this error path
explicitly calls platform_device_unregister().

When returning an error, devres will unwind and execute the previously
registered devm action (mtk_dp_unregister_pdevs), unregistering the device
a second time.

Similarly, the devm_add_action_or_reset() error path explicitly unregisters
the device, but devm_add_action_or_reset() automatically executes the clean=
up
function if it fails, also resulting in an immediate double-unregister.

[ ... ]
> @@ -2821,7 +2843,12 @@ static int mtk_dp_probe(struct platform_device *pd=
ev)
> =20
>  	mtk_dp->dev =3D dev;
>  	mtk_dp->data =3D (struct mtk_dp_data *)of_device_get_match_data(dev);
> -	mtk_dp->legacy_regoff =3D MTK_DP_TOP_OFFSET_LEGACY;
> +
> +	/* Prefer PHY from devicetree - if not found, this is legacy */
> +	if (of_property_present(dev->of_node, "phys"))
> +		mtk_dp->legacy_regoff =3D 0;
> +	else
> +		mtk_dp->legacy_regoff =3D MTK_DP_TOP_OFFSET_LEGACY;

[Severity: High]
Does adding mtk_dp->legacy_regoff to all register accesses break legacy PHY
initialization?

The code relies on mtk_dp_update_bits() and mtk_dp_write() which unconditio=
nally
add mtk_dp->legacy_regoff (0x2000 for legacy device trees) to all register
accesses:

	int ret =3D regmap_update_bits(mtk_dp->regs,
				     offset + mtk_dp->legacy_regoff,
				     mask, val);

While this is correct for DP TOP and DP ENC registers that were rebased to =
0x0
in the new header, the legacy PHY registers (like DP_PHY_GLB_BIAS_GEN_00 and
DP_PHY_AUX_RX_CTL) still use their original absolute offsets starting at 0x=
0.

Writing to them now ends up at 0x0 + 0x2000 =3D 0x2000, overwriting
MTK_DP_TOP_PWR_STATE instead of the intended PHY calibration registers.
Writing to DP_PHY_AUX_RX_CTL (0x1040) writes to 0x3040, which corrupts the
ENC0 register space.

> =20
>  	ret =3D mtk_dp_dt_parse(mtk_dp, pdev);
>  	if (ret)
[ ... ]
> @@ -2872,9 +2899,18 @@ static int mtk_dp_probe(struct platform_device *pd=
ev)
>  					     "Failed to register audio driver\n");
>  	}
> =20

[Severity: Medium]
Is the HDMI audio codec platform device (mtk_dp->audio_pdev) leaked on driv=
er
removal or probe failure?

In mtk_dp_register_audio_driver(), a devm action is registered to clean up
mtk_dp->audio_pdev. However, it incorrectly passes mtk_dp->phy_dev as the d=
ata
argument:

	ret =3D devm_add_action_or_reset(dev, mtk_dp_unregister_pdevs,
				       mtk_dp->phy_dev);

Because mtk_dp_register_audio_driver() runs before mtk_dp_register_phy(),
mtk_dp->phy_dev is NULL here. When the driver is unbound or probe fails, de=
vres
executes platform_device_unregister(NULL) which does nothing, but the actual
audio platform device remains registered and is leaked.

> -	ret =3D mtk_dp_register_phy(mtk_dp);
> -	if (ret)
> -		return ret;
> +	if (!mtk_dp->legacy_regoff) {
> +		mtk_dp->phy =3D devm_phy_get(dev, NULL);
> +		if (IS_ERR(mtk_dp->phy))
> +			return dev_err_probe(dev, PTR_ERR(mtk_dp->phy),
> +					     "Failed to get phy\n");
> +
> +		mtk_dp->phy_dev =3D NULL;
> +	} else {
> +		ret =3D mtk_dp_register_phy(mtk_dp);
> +		if (ret)
> +			return ret;
> +	}
> =20
>  	mtk_dp->bridge.of_node =3D dev->of_node;
>  	mtk_dp->bridge.type =3D mtk_dp->data->bridge_type;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701122024.1955=
7-1-angelogioacchino.delregno@collabora.com?part=3D7
