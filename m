Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F34E2D9EC2
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 23:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778541455; cv=none; b=E3vm05z6tyBiriNQVOT0n12FwbWX8fmPq7RYN6XHh0y37mXxyFoRMo/eKGym6IbityPOebjHiw61MpuIrgdIqhahqAbTFc08sD1wZnTBmk1qcCv88S5zOxIzFazWlwVC7kjm9r29NK21wXRHzsuQwHBf1LXoG7F6djOzGbyIB7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778541455; c=relaxed/simple;
	bh=xyFbLrj6sJ4djgNrXRlNAgdb2lsqlL24KNd5VUSviNg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Lj+YZbM+58Y7P6Y5yjSTk+MjFpPyMXQOrRstWTMjfobZRE3US9edQX+NPT5jHiy5N24rRqWUpVwiQB+f0F8j2axPfWLMOVvMt6ssfeFxbSeLom30MkWSIc58Q3Qc5+T29hk+PinceRPFMZtdYSekyhZnLv+m+PRPWzYxEoOWpHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KcQu6Lse; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KcQu6Lse"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BDBCC2BCB0;
	Mon, 11 May 2026 23:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778541454;
	bh=xyFbLrj6sJ4djgNrXRlNAgdb2lsqlL24KNd5VUSviNg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=KcQu6LsejLH6URXUBSoevsxoz9a0ljvLTWGw5mOrbVuDjFXPFY4fIjEVCegQTMh/a
	 W9Mz1h3EJhvcYrTlYIsc12lcUpvLg47K6Dir2IDQweeAJzPpmONKTVFAGiLX3lBS88
	 dO5nEGCGqTRoA216PwWLrdDdk7ktCTl9KxBANQHXbv5MFjDjwFWK4fsCv/Yu0epG7U
	 kZktnjX0As9mhlGpxTkDpfCjP0PUgPnYCZdq+7DpjQuWcAOWrsJeQAhoVRQu1ukqi7
	 KoxRgr9hQ1nFezj4sxLGA75ExLLFVhmXhUBUyVlAh9bcfP9wvv+Ss0mtcm9mZfxeav
	 VXev2ti10JLig==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] usb: cdns3: sky1: Add cdnsp-sky1 glue driver
Reply-To: sashiko@lists.linux.dev
To: "Peter Chen" <peter.chen@cixtech.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260511024244.981941-3-peter.chen@cixtech.com>
References: <20260511024244.981941-3-peter.chen@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 11 May 2026 23:17:34 +0000
Message-Id: <20260511231734.9BDBCC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Probe returns success (0) when memory resource retrieval fails, le=
ading to a NULL pointer dereference.
- [High] Probe forcefully overwrites the mode strap configuration for all U=
SB controllers on the SoC.
- [Medium] Resource leak of clocks on early probe error paths.
- [Medium] Unconditional assignment of dev_pm_ops violates Power Management=
 Subsystem rules.
- [Medium] Commit message and implementation mismatch regarding hardware re=
sets.
- [Low] Using of_match_ptr() with a statically allocated array causes compi=
ler warnings.
--

commit a626bc93f86adbca6a4dce0b669265133a32a8cb
Author: Peter Chen <peter.chen@cixtech.com>

usb: cdns3: sky1: Add cdnsp-sky1 glue driver

Add a CIX sky1 platform glue driver with Kconfig and Makefile entry.
It calls APIs exported from cdns3-plat.c for probe/remote/suspend/resume
routines.

> 	  Glue driver for the Cadence USB dual-role controllers on CIX Sky1
> 	  (device tree compatible cix,sky1-usb3). It enables clocks and resets
> 	  from the SoC, then uses the shared cdns3 platform core (cdns.ko).

The commit message mentions it enables clocks and resets from the SoC, but =
is
there missing code to handle the resets? The implementation includes linux/=
reset.h
but doesn't appear to request or interact with any reset lines.

> diff --git a/drivers/usb/cdns3/cdnsp-sky1.c b/drivers/usb/cdns3/cdnsp-sky=
1.c
> new file mode 100644
> index 0000000000000..049044e3d09bd
> --- /dev/null
> +++ b/drivers/usb/cdns3/cdnsp-sky1.c

[ ... ]

> +static int cdnsp_sky1_set_all_controllers_otg(struct regmap *syscon)
> +{
> +	int id, ret;
> +
> +	for (id =3D 0; id < SKY1_USB_S5_NUM; id++) {
> +		ret =3D cdnsp_sky1_set_mode_by_id(syscon, id, MODE_STRAP_OTG);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}

Does this code unintentionally alter the state of other independent USB
controllers? It appears to iterate through all controllers on the SoC and
updates them to MODE_STRAP_OTG, which might affect concurrent controllers
that are explicitly configured as host-only (like U2_HOST0_ID).

[ ... ]

> +static int cdnsp_sky1_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct cdnsp_sky1 *priv;
> +	struct cdns *cdns;
> +	struct cdns3_probe_data probe_data;
> +	struct resource *res;
> +	int ret;
> +
> +	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->dev =3D dev;
> +	priv->num_clks =3D ARRAY_SIZE(cdnsp_sky1_cdns_core_clks);
> +	priv->clks =3D devm_kmemdup(dev, cdnsp_sky1_cdns_core_clks,
> +				   sizeof(cdnsp_sky1_cdns_core_clks), GFP_KERNEL);
> +	if (!priv->clks)
> +		return -ENOMEM;
> +
> +	ret =3D devm_clk_bulk_get(dev, priv->num_clks, priv->clks);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to get clocks\n");
> +
> +	ret =3D clk_bulk_prepare_enable(priv->num_clks, priv->clks);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to enable clocks\n");
> +
> +	priv->usb_syscon =3D syscon_regmap_lookup_by_phandle(dev->of_node,
> +							   "cix,syscon-usb");
> +	if (IS_ERR(priv->usb_syscon))
> +		return dev_err_probe(dev, PTR_ERR(priv->usb_syscon),
> +				     "failed to get cix,syscon-usb regmap\n");
> +
> +	ret =3D cdnsp_sky1_set_all_controllers_otg(priv->usb_syscon);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "failed to set USB controllers to OTG strap\n");

Can these error paths cause a resource leak? The clocks were previously ena=
bled
via clk_bulk_prepare_enable(), but these direct returns bypass the err_clk
label where clk_bulk_disable_unprepare() is called.

> +
> +	res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "glue");
> +	if (!res)
> +		goto err_clk;

If this resource retrieval fails, does the probe function return success?

The ret variable was previously set to 0 by the successful call to
cdnsp_sky1_set_all_controllers_otg(), so jumping to err_clk without updating
ret to an error code like -ENODEV would result in returning 0.

Could this lead to a NULL pointer dereference during subsequent power
management operations? Since the device would be considered bound without
calling cdns3_core_probe(), dev_get_drvdata() might return NULL in
callbacks like cdnsp_sky1_runtime_suspend().

[ ... ]

> +static const struct of_device_id cdnsp_sky1_of_match[] =3D {
> +	{ .compatible =3D "cix,sky1-usb3" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, cdnsp_sky1_of_match);
> +
> +static struct platform_driver cdnsp_sky1_driver =3D {
> +	.probe		=3D cdnsp_sky1_probe,
> +	.remove		=3D cdnsp_sky1_remove,
> +	.driver		=3D {
> +		.name		=3D "cdnsp-sky1",
> +		.of_match_table	=3D of_match_ptr(cdnsp_sky1_of_match),

If the kernel is built with CONFIG_OF disabled, of_match_ptr() evaluates to
NULL. Since the cdnsp_sky1_of_match array is declared statically and without
__maybe_unused annotations, will this result in an unused variable compiler
warning?

> +		.pm		=3D &cdnsp_sky1_pm_ops,

Does unconditionally assigning the pm callback structure produce dead code =
when
CONFIG_PM is disabled? According to the power management subsystem guidelin=
es,
this should likely be wrapped with the pm_ptr() macro so it evaluates to NU=
LL
without PM support.

> +	},
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511024244.9819=
41-1-peter.chen@cixtech.com?part=3D2
