Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0737C481A88
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 12:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782908820; cv=none; b=E3Ia35d9f1DasPsqvkaX9YN1yQpBhwoKe8uXxq8Nit+0Ml40pAhP7qDfBHVYtEe02iEfrd0NDsy/QCMsc0DhP8K9O0a3kPbJSYzRSxpXTwRCk/XxjnDNrKqq7iBa5r7PPI7Fv9aHUkhtpmOlhnmgq3kUAadbHBU8oiMUyUoCsJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782908820; c=relaxed/simple;
	bh=KHghZi445oQc7YCgSSynxc3ak3EQr1zWxMm3fZUH74E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Uqi+2L3StQPUY4mRi3jwyPVUW+1gYHiW6YyWtBxg3vIqA2juf8BbJ/xOMJjzzV+J5C8FavqBKQ8c0fCkM6Gp39af42WiVh7pEPACEUBWq3u6oXwMIbeEPi1R3eK2nFHS9mAPABu4k/dd75bnuj15pyzDMrF7XsZ7SE+lJwrfMK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YMX46vOG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YMX46vOG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 307E21F000E9;
	Wed,  1 Jul 2026 12:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782908818;
	bh=52TWOxi0a9pzDOPVJc9NbYPQ8WvoOLt636S3MKAbHJA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YMX46vOGtug9PRPhaH8+H3L/5/KdufZTz7PM5e2MY4oETmZAvnVYqLv2bcaIMiV1c
	 185urfMN9u5KoQo7IamVLySokmd0AMTJrlbag6A6ilUyW4Wa6YRh/cyNPsLhNDil1J
	 gj6SZsmezNXYB3La4yiM+5mLoRVJaHbQ3bMYV9RQFIz7/3XrT+vf1PpMWaCsxd1H1v
	 o5+bFg8JZM5+RDVXjcY69jNUYF6OwIA9G3qm8cOL0mcf72CxTh6QB8xDCPDWArDp9w
	 WBvKt5DYeDLvxYgYIStdw/mR7Mkm24Nq2tFDGLbuHEAk5tKO3UaqsbAOoEKMHiM8UM
	 sZvd//fWXmbvQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 02/12] phy: phy-mtk-dp: Rename regs to regmap in struct
 mtk_dp_phy
Reply-To: sashiko-reviews@lists.linux.dev
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
Cc: linux-phy@lists.infradead.org, neil.armstrong@linaro.org, dri-devel@lists.freedesktop.org, conor+dt@kernel.org, robh@kernel.org, olteanv@gmail.com, devicetree@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260701122008.19509-3-angelogioacchino.delregno@collabora.com>
References: <20260701122008.19509-1-angelogioacchino.delregno@collabora.com>
 <20260701122008.19509-3-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Jul 2026 12:26:57 +0000
Message-Id: <20260701122658.307E21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing NULL check for `dev->platform_data` before dereferencing.
- [High] Missing `remove` callback to clean up PHY lookup leads to a memory=
 leak and use-after-free.
--

commit a1a96e429cf3345472aae1b06f6ffe5b31edee81
Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

phy: phy-mtk-dp: Rename regs to regmap in struct mtk_dp_phy

In preparation to perform further cleanups and to extend the driver to
support more SoCs, rename the regs member to regmap to improve readability,
as this is a common name across many kernel drivers for a struct regmap.

> diff --git a/drivers/phy/mediatek/phy-mtk-dp.c b/drivers/phy/mediatek/phy=
-mtk-dp.c
> index d7024a1443358..bf7b3a95e72d2 100644
> --- a/drivers/phy/mediatek/phy-mtk-dp.c
> +++ b/drivers/phy/mediatek/phy-mtk-dp.c
[ ... ]
> @@ -176,7 +176,7 @@ static int mtk_dp_phy_probe(struct platform_device *p=
dev)

[Severity: High]
This is a pre-existing issue, but is it possible for dev->platform_data to =
be
NULL here?

Earlier in mtk_dp_phy_probe(), dev->platform_data is dereferenced directly
without a check:

drivers/phy/mediatek/phy-mtk-dp.c:mtk_dp_phy_probe() {
	...
	struct regmap *regs;

	regs =3D *(struct regmap **)dev->platform_data;
	if (!regs)
	...
}

If the driver is manually bound via sysfs (or otherwise instantiated without
platform data), dev->platform_data will be NULL.

Should the code validate that dev->platform_data is not NULL before
dereferencing it to avoid a kernel panic?

[Severity: High]
This isn't a bug introduced by this patch, but does this driver leak the
phy_lookup struct and leave a dangling pointer if it gets unbound?

In mtk_dp_phy_probe(), when !dev->of_node is true, a lookup entry is
registered:

drivers/phy/mediatek/phy-mtk-dp.c:mtk_dp_phy_probe() {
	...
	if (!dev->of_node)
		phy_create_lookup(phy, "dp", dev_name(dev));

	return 0;
}

However, mtk_dp_phy_driver does not have a .remove callback to call
phy_remove_lookup():

drivers/phy/mediatek/phy-mtk-dp.c:
static struct platform_driver mtk_dp_phy_driver =3D {
	.probe =3D mtk_dp_phy_probe,
	.driver =3D {
		.name =3D "mediatek-dp-phy",
	},
};

If the driver is unbound, the phy_lookup struct is leaked and remains linked
in the global phys list. Since the phy struct gets freed by the
device-managed subsystem, subsequent device probes iterating the PHY lookup
list would trigger a use-after-free.

Could a .remove callback be added to unregister the lookup and prevent this?

>  	if (!dp_phy)
>  		return -ENOMEM;
> =20
> -	dp_phy->regs =3D regs;
> +	dp_phy->regmap =3D regs;
>  	phy =3D devm_phy_create(dev, NULL, &mtk_dp_phy_dev_ops);
>  	if (IS_ERR(phy))
>  		return dev_err_probe(dev, PTR_ERR(phy),

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701122008.1950=
9-1-angelogioacchino.delregno@collabora.com?part=3D2
