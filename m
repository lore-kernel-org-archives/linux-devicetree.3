Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA823C9EF0
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 09:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789033270; cv=none; b=C1kA2EObhFlOS9foK5TfH2JoN3sWnWrtoArWGu1rY/6DMLSVyBSPM2PaO4exqlZSrhM+0P4evrV1Blqx/Zj1DIUJ4bZ/TJGkyW6FFpgO+k8JWrF/PjRZd60xAYVrzAHl0atzUn5qrhEXJT/Y0exA1Cb4a+2Vq+nJkSIiechLhIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789033270; c=relaxed/simple;
	bh=tcFKYaDMfsHuMRnSlWdlRVHdpLeIKTEi0NeWb3ndDeM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=puc46QJmIuZADljf8n+SmXqfcwomYkYRLPX37uVTCKmor2JEMbNHpA3v2hRu3F64VB5M27eTKGKOdU2RCAkgxQFFbt7PzWGrO0C0QRQAKkZtCzEsiVKcGn6mSgYX82fabTEIJxqsHkdQghp8a7CadCUE/WhHQeGq4sCXQj/Av4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hU7nLQeA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hU7nLQeA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A1451F000FF;
	Thu, 10 Sep 2026 09:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789033268;
	bh=f/tNEh3u69QI6vn+/x9mNUryEaGDOqotLzS3rONNass=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hU7nLQeAwq4pWrwhlO2ILp1OORFmx+9Dk7G2numdWdrIsUtEA+jvkHTz4vklyUsP7
	 lFaWuRTwIPboVlHq/uhPaMOGAOq4UrFPts/df82w2IGvC0uv03EQfFuRhLl/y5L9SE
	 T/ODl9DvaQqVKIQ84OZMFcDT1FrYkndJoDliRbx7tbh7Mekdrp99nddoWre4Xxj+0y
	 xiy4T+oiV5wWD5HTZ95MwXjki1WfKPTFxQdy9F6ekl+++2XwqjOkuOrcnrWciAivmF
	 LbrEwXlnKxgygQTZ37U55h3spx8PKJOISj4+7FR+91AMfXnl2A3GWbvkyeWwlvXtEw
	 Ld0g6264OrDgA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 03/12] phy: phy-mtk-dp: Allow probing with devicetree
 match
Reply-To: sashiko-reviews@lists.linux.dev
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
Cc: conor+dt@kernel.org, vkoul@kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org, olteanv@gmail.com, linux-phy@lists.infradead.org, neil.armstrong@linaro.org, devicetree@vger.kernel.org
In-Reply-To: <20260910092038.48291-4-angelogioacchino.delregno@collabora.com>
References: <20260910092038.48291-1-angelogioacchino.delregno@collabora.com>
 <20260910092038.48291-4-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 09:41:07 +0000
Message-Id: <20260910094108.3A1451F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Hardcoded register offsets cause incorrect MMIO access or resource=
 conflicts in the new OF probe path.

Pre-existing issues:
- [High] NULL pointer dereference when accessing platform_data before valid=
ation.
--

commit e5a7ed1fddd4b70c5e3f6f679c0fa4e43da6f22b
Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

phy: phy-mtk-dp: Allow probing with devicetree match

This commit decouples the DisplayPort PHY driver from the DisplayPort IP
driver by allowing it to probe via a devicetree match. When probed via
devicetree, it registers an OF PHY provider and maps its own MMIO regmap,
while retaining the legacy behavior in mtk_dp_phy_legacy_probe().

> diff --git a/drivers/phy/mediatek/phy-mtk-dp.c b/drivers/phy/mediatek/phy=
-mtk-dp.c
> index bf7b3a95e72d2..d241004e28286 100644
> --- a/drivers/phy/mediatek/phy-mtk-dp.c
> +++ b/drivers/phy/mediatek/phy-mtk-dp.c

[ ... ]

> @@ -160,43 +162,109 @@ static const struct phy_ops mtk_dp_phy_dev_ops =3D=
 {
>  	.owner =3D THIS_MODULE,
>  };
> =20
> +static void mtk_dp_phy_legacy_remove_lookup(void *data)
> +{
> +	struct phy *phy =3D data;
> +	struct mtk_dp_phy *dp_phy =3D phy_get_drvdata(phy);
> +
> +	phy_remove_lookup(phy, "dp", dev_name(dp_phy->dev));
> +}
> +
> +static int mtk_dp_phy_legacy_probe(struct platform_device *pdev, struct =
mtk_dp_phy *dp_phy)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct phy *phy;
> +	int ret;
> +
> +	dp_phy->regmap =3D *(struct regmap **)dev->platform_data;
> +	if (!dp_phy->regmap)
> +		return dev_err_probe(dev, -EINVAL, "No platform data available\n");

[Severity: High]
This is a pre-existing issue, but is it possible for dev->platform_data to =
be
NULL here? If the platform device is instantiated without platform_data
(for example, via a sysfs manual bind or driver core testing), dereferencing
it unconditionally before the validation check will cause a crash.

The code currently does:

dp_phy->regmap =3D *(struct regmap **)dev->platform_data;

The subsequent check if (!dp_phy->regmap) cannot prevent the crash if
dev->platform_data itself is NULL. Could we validate dev->platform_data
before attempting to dereference it?

> +
> +	phy =3D devm_phy_create(dev, NULL, &mtk_dp_phy_dev_ops);
> +	if (IS_ERR(phy))
> +		return dev_err_probe(dev, PTR_ERR(phy),
> +				     "Failed to create DP PHY\n");

[ ... ]

> +static int mtk_dp_phy_probe(struct platform_device *pdev)
>  {
>  	struct device *dev =3D &pdev->dev;
> +	struct phy_provider *provider;
>  	struct mtk_dp_phy *dp_phy;
> +	void __iomem *base;
>  	struct phy *phy;
> -	struct regmap *regs;
> -
> -	regs =3D *(struct regmap **)dev->platform_data;
> -	if (!regs)
> -		return dev_err_probe(dev, -EINVAL,
> -				     "No data passed, requires struct regmap**\n");
> +	int ret;
> =20
>  	dp_phy =3D devm_kzalloc(dev, sizeof(*dp_phy), GFP_KERNEL);
>  	if (!dp_phy)
>  		return -ENOMEM;
> =20
> -	dp_phy->regmap =3D regs;
> +	dp_phy->dev =3D dev;
> +
> +	/* If there's no devicetree, go for legacy pdev probe */
> +	if (!dev->of_node)
> +		return mtk_dp_phy_legacy_probe(pdev, dp_phy);
> +
> +	base =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	dp_phy->regmap =3D devm_regmap_init_mmio(dev, base, &mtk_dp_phy_regmap_=
cfg);

[Severity: High]
When mapping the dedicated MMIO region for the PHY in the new devicetree
match path, will the existing hardcoded register offsets cause out-of-bounds
accesses?

Looking at the existing phy data structures in this driver, offsets such as
.off_dig_glb =3D 0x1000 are used. These offsets appear to be relative to the
DP IP base address from the legacy shared regmap.

If the devicetree 'reg' property points to the PHY's actual physical
base address, using these hardcoded offsets on top of the new dedicated
MMIO mapping will overshoot the PHY registers by an additional 0x1000.

Alternatively, if the devicetree tries to compensate by pointing to the
DP IP base, wouldn't this cause a resource conflict (-EBUSY) with the
DP driver's own devm_platform_ioremap_resource() call?

> +	if (IS_ERR(dp_phy->regmap))
> +		return PTR_ERR(dp_phy->regmap);
> +
> +	ret =3D devm_pm_runtime_enable(dev);
> +	if (ret)
> +		return ret;
> +
>  	phy =3D devm_phy_create(dev, NULL, &mtk_dp_phy_dev_ops);

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910092038.4829=
1-1-angelogioacchino.delregno@collabora.com?part=3D3
