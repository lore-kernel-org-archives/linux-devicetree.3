Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5483A2DF3F2
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 23:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778540554; cv=none; b=SW41R/j2EM7DZRbgedV6Kp58HNL/gqnYO6sipIgobUQ0rw6hq9JLBUvb8lAcFx8HGsR78Qi+Tqe7+qDJDHwYyc6A1ozos9f30FOqDGpYCmJPYXP807pI8dgVGZKmxuEEaNMo0T3ARMHWrL9gM2SlpBnsY12jEXR/XeKDTrt1V+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778540554; c=relaxed/simple;
	bh=/as3E655MoyukKQD1OU8uTAKP//loZGP3/BuX922cSA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=j4pJrdHGW3TnAkoucvxtxz7gU9XDLGUxSSNJ5aWdheNJ+tzj1x5VmMbt6r61c2dkGzHvS4FJOVp0owX2kaOom0OixhREuHEVWJA7q5ADhkvJm539UBGnTdAIyEMvrh1/tHBxkJ31w6pdOSRUrlAiafT8Oif92yORNpPjkaAMdXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R2DawzK8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R2DawzK8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B40E6C2BCB0;
	Mon, 11 May 2026 23:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778540553;
	bh=/as3E655MoyukKQD1OU8uTAKP//loZGP3/BuX922cSA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=R2DawzK8D9ricw0ZgiB57ulrX9wdOuBkbOqeLY2lODzLOMaty7XojjMIexJtT8ZhI
	 Wbeu7RbxBOxCIsaBDGYHx/rvnojMrsFP04+wLRmLGEaM46KFO+DIyWYM+xnD5a2v25
	 c3uRlVB2NhFYOR2iaBlyN93iDJk7NkFq2mQHYFSlEmLh2jy96RkHy372hmkNytLeG/
	 R7K3eVHD2pc1anyBfRHEDRbga5gks1atDHMln8dq0g0drdwL6nfD2gNrseeV7N3DSv
	 yRTrzo1znyw0qZdG/5pfS6qcUUw56HEbrU2bgj4D3p8ygMoWWeKsnm6SMlarBhWk1L
	 6bgTPSvkA2s6Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/4] usb: cdns3: plat: Expose platform core driver as
 library
Reply-To: sashiko@lists.linux.dev
To: "Peter Chen" <peter.chen@cixtech.com>
Cc: robh@kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260511024244.981941-2-peter.chen@cixtech.com>
References: <20260511024244.981941-2-peter.chen@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 11 May 2026 23:02:32 +0000
Message-Id: <20260511230233.B40E6C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Leaked usb2_phy initialization on usb3_phy acquisition failure.
- [High] Leaked role switch and DRD resources on core role initialization f=
ailure.
- [High] Unbalanced pm_runtime_forbid() call permanently leaks the runtime =
PM usage counter across bind/unbind cycles.
- [High] Hardware PHY is powered off without calling synchronize_irq() duri=
ng runtime suspend.
- [Medium] Exported PM helpers in glue.h lack static inline stubs for disab=
led PM configurations.
--

commit a327903170c6c0082aaebdb421558ca806f906da
Author: Peter Chen <peter.chen@cixtech.com>

usb: cdns3: plat: Expose platform core driver as library

This commit splits the Cadence USB3 platform probe, remove, and PM paths in=
to
exported core functions. It also adds a new header glue.h to document the
probe data structure and public entry points, allowing SoC glue code to
instantiate the core deterministically.

> diff --git a/drivers/usb/cdns3/cdns3-plat.c b/drivers/usb/cdns3/cdns3-pla=
t.c
> index 3fe3109a3688a..2219cbff1c592 100644
> --- a/drivers/usb/cdns3/cdns3-plat.c
> +++ b/drivers/usb/cdns3/cdns3-plat.c
[ ... ]
> @@ -59,29 +60,21 @@ static int cdns3_plat_host_init(struct cdns *cdns)
>  }
> =20
>  /**
> - * cdns3_plat_probe - probe for cdns3 core device
> - * @pdev: Pointer to cdns3 core platform device
> + * cdns3_core_probe - Initialize the Cadence USB3 platform core
> + * @data: Controller context and platform device supplied by the glue la=
yer
>   *
>   * Returns 0 on success otherwise negative errno
>   */
> -static int cdns3_plat_probe(struct platform_device *pdev)
> +int cdns3_core_probe(const struct cdns3_probe_data *data)
>  {
> +	struct platform_device *pdev =3D data->pdev;
>  	struct device *dev =3D &pdev->dev;
> -	struct resource	*res;
> -	struct cdns *cdns;
> +	struct cdns *cdns =3D data->cdns;
> +	struct resource *res;
>  	void __iomem *regs;
>  	int ret;
> =20
> -	cdns =3D devm_kzalloc(dev, sizeof(*cdns), GFP_KERNEL);
> -	if (!cdns)
> -		return -ENOMEM;
> -
> -	cdns->dev =3D dev;
> -	cdns->pdata =3D dev_get_platdata(dev);
> -	if (cdns->pdata && cdns->pdata->override_apb_timeout)
> -		cdns->override_apb_timeout =3D cdns->pdata->override_apb_timeout;
> -
> -	platform_set_drvdata(pdev, cdns);
> +	dev_set_drvdata(dev, cdns);
> =20
>  	ret =3D platform_get_irq_byname(pdev, "host");

Further down in this function, if devm_phy_optional_get() for cdns->usb3_phy
fails (e.g. with -EPROBE_DEFER), it returns directly via dev_err_probe(),
bypassing the error cleanup path in err_phy3_init.

Does this leak the usb2_phy initialization since phy_exit(cdns->usb2_phy) is
never called?

If probe is deferred and retried, will this repeatedly increment the PHY's
init_count, preventing it from ever powering down?

Also in this function, after cdns_init(cdns) successfully registers resourc=
es
like a role switch, if cdns_core_init_role(cdns) fails, the error path
jumps to err_cdns_init:

err_cdns_init:
	set_phy_power_off(cdns);
err_phy_power_on:
...

This error path only powers off the PHYs. Can this permanently leak the role
switch and DRD resources by omitting a call to cdns_remove(cdns) or
usb_role_switch_unregister()?

Towards the end of this function, pm_runtime_forbid(dev) is conditionally
called to increase the device's runtime PM usage count:

	if (!(cdns->pdata && (cdns->pdata->quirks & CDNS3_DEFAULT_PM_RUNTIME_ALLOW=
)))
		pm_runtime_forbid(dev);

Should there be a corresponding pm_runtime_allow(dev) in the remove path to
balance this count?

[ ... ]
> @@ -195,14 +188,41 @@ static int cdns3_plat_probe(struct platform_device =
*pdev)
[ ... ]
> +/**
> + * cdns3_core_remove - Tear down the Cadence USB3 platform core
> + * @cdns: Controller context previously initialized by cdns3_core_probe()
> + */
> +void cdns3_core_remove(struct cdns *cdns)
>  {
> -	struct cdns *cdns =3D platform_get_drvdata(pdev);
>  	struct device *dev =3D cdns->dev;
> =20
>  	pm_runtime_get_sync(dev);
> @@ -213,24 +233,30 @@ static void cdns3_plat_remove(struct platform_devic=
e *pdev)
>  	phy_exit(cdns->usb2_phy);
>  	phy_exit(cdns->usb3_phy);
>  }
> +EXPORT_SYMBOL_GPL(cdns3_core_remove);

Since pm_runtime_forbid(dev) was called in the probe function, could the
absence of pm_runtime_allow(dev) here permanently leak the runtime PM usage
counter across bind/unbind cycles?

If the driver is repeatedly unbound and bound, will the usage counter
continuously increment, eventually preventing the device from entering a
runtime suspended state?

[ ... ]
> @@ -242,7 +268,7 @@ static int cdns3_controller_suspend(struct device *de=
v, pm_message_t msg)
>  	else
>  		wakeup =3D device_may_wakeup(dev);
> =20
> -	cdns3_set_platform_suspend(cdns->dev, true, wakeup);
> +	cdns3_set_platform_suspend(cdns, true, wakeup);
>  	set_phy_power_off(cdns);
>  	spin_lock_irqsave(&cdns->lock, flags);

The controller uses shared IRQs, such as IRQF_SHARED for cdns->wakeup_irq.
The PM subsystem guidelines require drivers using shared IRQs to call
synchronize_irq() before powering down hardware.

Might calling set_phy_power_off(cdns) here before synchronize_irq() risk
hardware PHY being powered off while an interrupt handler is executing
concurrently on another CPU?

[ ... ]
> diff --git a/drivers/usb/cdns3/glue.h b/drivers/usb/cdns3/glue.h
> new file mode 100644
> index 0000000000000..67cd1073b5551
> --- /dev/null
> +++ b/drivers/usb/cdns3/glue.h
> @@ -0,0 +1,51 @@
[ ... ]
> +/*
> + * The following callbacks are for glue drivers to invoke from their own
> + * &dev_pm_ops, so platform-specific work can wrap the shared controller=
 logic.
> + */
> +int cdns3_runtime_suspend(struct cdns *cdns);
> +int cdns3_runtime_resume(struct cdns *cdns);
> +int cdns3_pm_suspend(struct cdns *cdns);
> +int cdns3_pm_resume(struct cdns *cdns);
> +
> +#endif /* __DRIVERS_USB_CDNS3_GLUE_H */

These functions are conditionally compiled in cdns3-plat.c depending on
CONFIG_PM and CONFIG_PM_SLEEP. However, they are unconditionally declared
here without empty static inline fallback stubs.

If a glue driver uses __maybe_unused annotations instead of #ifdef CONFIG_PM
for its own callbacks, will the compiler still attempt to resolve these cal=
ls
and produce undefined reference linker errors when PM is disabled?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511024244.9819=
41-1-peter.chen@cixtech.com?part=3D1
