Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C5D2777F3
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 16:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783440408; cv=none; b=A/QWrmBm3qtay6E16yYgLaYVceirTvn0/tTn3JHMZAN30L/cPl3NjycyKB2/c8AZTHiEp0xO2AZ7d5RkV8NBUYbmfcwfemLAjV3NwqIU69fgi0ijdbrzq9TKUWWz+Xh6f1Z+ryp2hQFhQ1QuMH/9mkaDx5ySnXCOZbIUet9kMcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783440408; c=relaxed/simple;
	bh=0VGHzDYBm0N7ODWWGcxmhraoTwtHm351aNt2Ep1oM6I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gf1IVNHmkN3lGsGYN/BA3yWjzPwjTX0+E1xu1iO1b5IODWjrPIUuvkSQNbnpsufRHg9H4sw/jRJklZAcPGUD6n5y5WllraWHXaZwI+6u073YDh2Hlun2DIG6wZGFYlnf2ayRDVQNpL7Jn5HT6QAxb3kGCZjQqlz0ir3MgJZ56eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fBDYi1zG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fBDYi1zG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 813771F000E9;
	Tue,  7 Jul 2026 16:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783440407;
	bh=L5y+zUPinxjtVfco8HA4/kOWa/nb9LJmepf6+tT3NBY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fBDYi1zGE7lf4Blqh7AGdmstS6BNHwbUlm21DQ1dz+mK03zfb1ZPwQM0DyOwzhChE
	 uZL6yI19C0Nmz6mjClnAAzrwgzPLTo/cwyNspErpwAt+MxEBctJumAse1eQvmDohkE
	 PwP6fkEj11lvde6jy6Zr2Wz1mj8ghRhN0LAIsQH37SQbT1PYUMQNacHIFEPEyqg7jK
	 /t6EdzTj5cXvDyVsxerjN65IX6J9KExgkXXrWqkGAoNKYPKP7ACtJeaEHOvUSLBiNb
	 vMKVwNJKFaNKGz1Ra4hqYrOHnEWVI1y9os8RRb/py1Qy9/uSZbwYMhXmp2M7xvgh5d
	 Z4q5of08j19VA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 03/12] phy: phy-mtk-dp: Allow probing with devicetree
 match
Reply-To: sashiko-reviews@lists.linux.dev
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com, linux-phy@lists.infradead.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260707154245.198361-4-angelogioacchino.delregno@collabora.com>
References: <20260707154245.198361-1-angelogioacchino.delregno@collabora.com>
 <20260707154245.198361-4-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 16:06:46 +0000
Message-Id: <20260707160646.813771F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Hardcoded `PHY_OFFSET` causes out-of-bounds register accesses or r=
esource conflicts when the PHY is probed as a standalone devicetree node.
- [High] Hardware registers are accessed in `mtk_dp_phy_configure()` while =
the PHY device is runtime-suspended, causing a system crash or silent loss =
of configuration.

Pre-existing issues:
- [High] Dereferencing `dev->platform_data` before checking if it is NULL l=
eads to a kernel crash.
--

--- Patch [3]: [PATCH v3 03/12] phy: phy-mtk-dp: Allow probing with devicet=
ree match ---
commit 710ab5488fd0b66b2ea62388b977a4308f99a0c6
Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

phy: phy-mtk-dp: Allow probing with devicetree match

Make it possible to decouple the registration of the DisplayPort
PHY driver from the DisplayPort IP driver by adding a devicetree
match to probe the PHY. In order to retain compatibility with older
devicetrees, the legacy code was moved in a mtk_dp_phy_legacy_probe()
function.

> diff --git a/drivers/phy/mediatek/phy-mtk-dp.c b/drivers/phy/mediatek/phy=
-mtk-dp.c
> index bf7b3a95e72d2..d241004e28286 100644
> --- a/drivers/phy/mediatek/phy-mtk-dp.c
> +++ b/drivers/phy/mediatek/phy-mtk-dp.c
[ ... ]
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
This is a pre-existing issue, but does casting and dereferencing
dev->platform_data before checking if it is NULL lead to a kernel crash?

If the driver is bound to a device without platform data via sysfs, this
unvalidated pointer will be dereferenced before the check for
!dp_phy->regmap can execute.

[ ... ]
>  static int mtk_dp_phy_probe(struct platform_device *pdev)
>  {
>  	struct device *dev =3D &pdev->dev;
[ ... ]
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
Since the driver hardcodes PHY_OFFSET (0x1000) into its register macros like
MTK_DP_PHY_DIG_PLL_CTL_1, will this independent regmap cause out-of-bounds
accesses if the devicetree maps the PHY node to its true physical base?

If the devicetree instead sets the PHY node's reg to the parent DP IP base =
to
counteract this offset, won't this cause devm_platform_ioremap_resource() to
fail with -EBUSY due to resource conflicts between the PHY driver and the DP
IP driver?

> +	if (IS_ERR(dp_phy->regmap))
> +		return PTR_ERR(dp_phy->regmap);
> +
> +	ret =3D devm_pm_runtime_enable(dev);
> +	if (ret)
> +		return ret;

[Severity: High]
By enabling runtime PM here, could mtk_dp_phy_configure() access hardware
registers while the PHY device is runtime-suspended?

The consumer driver calls phy_configure() without calling phy_power_on().
The PHY framework takes a runtime PM reference during .init and .reset,
but explicitly drops it right before returning, and does not take a referen=
ce
during .configure.

When the consumer calls phy_configure(), it writes directly to hardware via
regmap_write() and regmap_update_bits() while the device PM usage count
is zero. Can this crash the system or cause silent loss of configuration?

> +
>  	phy =3D devm_phy_create(dev, NULL, &mtk_dp_phy_dev_ops);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260707154245.1983=
61-1-angelogioacchino.delregno@collabora.com?part=3D3
