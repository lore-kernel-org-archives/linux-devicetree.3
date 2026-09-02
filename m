Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F95820D4F0
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 03:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788319944; cv=none; b=D9FkoIGavCLA3lJ/TC5xRoAhc+Z8moZp0OtqBXYpa4uskOCBRCO6KzqMFhQibdkhm7aOniMcF000ss8fSWEKXHMo14B5tlzVmqcmH6C6hrvpNZ10Tgahaj8wI4AJimF86RlQ3ChszkGRQjecLlcOvUhhq8/fBRUe/ZfzaO9SfP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788319944; c=relaxed/simple;
	bh=unqFh81SC4GrlgHaSxmgS1NQpTWfyNKvVwccyCP6RVk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pnqaxbeP0czKORO5zho7rq1UjKx98Cao2LlcDMVwST11FPLNRHUvPlWN5JQ1dXDB/lxBzDAyd3c3pQeOVXyQkkdPJ5zXPqsw6P0r2avRgQRjttJQ3rnyxFpY16vLDlWQ5Cb9gpY4lrEpXYHgglCEz+VOrS3gflUCfhvwe96kk/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RszOs/Ce; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RszOs/Ce"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA24A1F000E9;
	Wed,  2 Sep 2026 03:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788319943;
	bh=uEhLsjX4mcPRU4LShL1Gu6TdGWkkCFUPfe8iS/HC7oE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RszOs/CeAmAC7YIyLp9uDmOfTuSktR6ONfR3zrqT2MAm3Lt1qau4QXAMoC0ce4Igk
	 vSRp3ZKdyQurhL8qUrrs67hPuXo5V359/CIpmr8l0thLKWp1WA4DneC3v5iWQ1VsCC
	 xrFIj240gWCiLsvmUAyxNj3vNwm5oofDXVXHxZkf3D/KX/jz+aR2HkeQzk7naBZVzN
	 wQeQp16VeKaPzj5KNcZIvJI5AO/76E4iUhwn2vvjHyLEfyUTQqej52oUiPrN+BJ5cw
	 Uis8fQi3dOe2L542Y66Dj6yeypD2S35tK0JqcuNjlV3cQAZB0XRO7X6ta2I3We2bhg
	 B2Zt7TvPYrqgA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/5] usb: cdns3: Add CIX Sky1 glue driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hongliang Yang" <hongliang.yang@cixtech.com>
Cc: vkoul@kernel.org, linux-phy@lists.infradead.org, olteanv@gmail.com, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20260902032134.1182634-5-hongliang.yang@cixtech.com>
References: <20260831082309.3854507-1-hongliang.yang@cixtech.com>
 <20260902032134.1182634-5-hongliang.yang@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 03:32:22 +0000
Message-Id: <20260902033222.CA24A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 10 potential issue=
(s) to consider:
- [High] Massive resource leak on probe error paths (I/O memory, clocks, an=
d resets).
- [High] Thread-safety and double-free vulnerability due to modifying a sta=
tic global of_dev_auxdata array during probe.
- [High] Unbalanced runtime PM usage count and missing PM disable in cdnsp_=
sky1_remove.
- [High] Incorrect reset control assertion logic in remove path fails to qu=
iesce hardware.
- [High] NULL pointer dereference when accessing xhci_dev->dev in platform_=
suspend.
- [Medium] OF node reference leak in sky1_of_get_addr_by_name() because the=
 reference obtained by of_get_next_child() is never released.
- [Medium] Destructive error handling in cdnsp_sky1_clk_enable_resume corru=
pts internal clock pointers.
- [Medium] Potential Use-After-Free (UAF) due to missing device refcounting=
 in iterator callbacks during shutdown.
- [Medium] Undefined behavior due to bitwise shift into the sign bit.
- [Medium] PM subsystem guideline violation: PM sleep callbacks are assigne=
d without the required pm_sleep_ptr() wrapper.
--

commit 0232318426cffe797c62a93651116101c396ebb4
Author: Hongliang Yang <hongliang.yang@cixtech.com>

usb: cdns3: Add CIX Sky1 glue driver

This commit adds a glue layer driver for the Cadence USBSSP controller
integrated in the CIX Sky1 SoC. The driver manages the controller clocks,
resets, and the mode strap controls located in the Sky1 S5 system
controller.

> diff --git a/drivers/usb/cdns3/cdnsp-sky1.c b/drivers/usb/cdns3/cdnsp-sky=
1.c
> new file mode 100644
> index 0000000000000..447c683b726c1
> --- /dev/null
> +++ b/drivers/usb/cdns3/cdnsp-sky1.c

[ ... ]

> +static int cdnsp_sky1_clk_enable_resume(struct device *dev)
> +{
> +	int i, ret;
> +	struct cdnsp_sky1 *data =3D dev_get_drvdata(dev);
> +	struct clk **cix_usb_clks =3D data->cix_usb_clks;
> +
> +	for (i =3D 0; i < CIX_USB_CLK_OFF_NUM; i++) {
> +		ret =3D clk_prepare_enable(cix_usb_clks[i]);
> +		if (ret) {
> +			dev_err(dev, "failed to enable clock %s: %d\n",
> +				cix_usb_clk_names[i], ret);
> +			goto err_usb_clks;
> +		}
> +	}
> +	return 0;
> +
> +err_usb_clks:
> +	cix_usb_clks[i] =3D NULL;
> +	while (--i >=3D 0) {
> +		clk_disable_unprepare(cix_usb_clks[i]);
> +		cix_usb_clks[i] =3D NULL;
> +	}
> +	return ret;
> +};

[Severity: Medium]
Does setting cix_usb_clks[i] to NULL here permanently wipe the devm-managed
clock references from the driver's private state? If a system clock fails
to resume, won't subsequent calls to enable or disable these clocks receive
NULL pointers and silently fail to configure the hardware?

[ ... ]

> +static int cdns_sky1_platform_suspend(struct device *dev,
> +				      bool suspend, bool wakeup)
> +{
> +	struct cdns *cdns =3D dev_get_drvdata(dev);
> +	struct platform_device *xhci_dev =3D cdns->host_dev;
> +	struct usb_hcd  *hcd;
> +	struct device *parent =3D cdns->dev->parent;
> +	struct cdnsp_sky1 *data =3D dev_get_drvdata(parent);
> +	u32 value;
> +	int ret =3D 0;
> +	int count =3D 3;
> +
> +	data->wakeup =3D wakeup;
> +
> +	if (cdns->role !=3D USB_ROLE_HOST)
> +		return 0;
> +
> +	hcd =3D dev_get_drvdata(&xhci_dev->dev);

[Severity: High]
Could xhci_dev be NULL if the host initialization failed or was unbound?
If so, would accessing &xhci_dev->dev lead to an out-of-bounds pointer
dereference during system suspend?

[ ... ]

> +static void *sky1_of_get_addr_by_name(struct device_node *parent, char *=
name)
> +{
> +	struct device_node *node;
> +	int index;
> +
> +	node =3D of_get_next_child(parent, NULL);
> +	if (node) {
> +		index =3D of_property_match_string(node, "reg-names", name);
> +		if (index >=3D 0)
> +			return of_iomap(node, index);
> +	}
> +	return NULL;
> +}

[Severity: Medium]
Does of_get_next_child() return the node with an incremented reference coun=
t?
Should there be a call to of_node_put(node) before returning to prevent a
memory leak?

[ ... ]

> +static int cdnsp_sky1_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct device_node *node =3D dev->of_node;
> +	struct cdnsp_sky1 *data;
> +	int ret =3D 0;
> +	struct cdns3_platform_data *cdns_sky1_pdata;

[ ... ]

> +	ret =3D cdnsp_sky1_drd_init(data);
> +	if (ret =3D=3D -ETIMEDOUT)
> +		return -EPROBE_DEFER;
> +	if (ret)
> +		return ret;

[Severity: High]
If probe fails here and returns directly, are the I/O memory mappings
for xhci_base and device_base (which were mapped via non-devm of_iomap)
left active? Should they be unmapped and the clocks/resets cleaned up?

[ ... ]

> +	/* release by platform_device_release */
> +	cdns_sky1_pdata =3D kzalloc(sizeof(*cdns_sky1_pdata), GFP_KERNEL);
> +	if (!cdns_sky1_pdata)
> +		return -ENOMEM;
> +	cdns_sky1_pdata->platform_suspend =3D cdns_sky1_platform_suspend;
> +	cdns_sky1_pdata->quirks =3D CDNS3_DEFAULT_PM_RUNTIME_ALLOW;
> +	cdns_sky1_auxdata->platform_data =3D cdns_sky1_pdata;
> +	ret =3D of_platform_populate(node, NULL, cdns_sky1_auxdata, dev);

[Severity: High]
Is it safe to assign a dynamically allocated instance-specific pointer
(cdns_sky1_pdata) to the statically allocated global array cdns_sky1_auxdat=
a?
Could this lead to a double-free vulnerability if multiple controller insta=
nces
exist or if the driver is repeatedly unbound and rebound?

> +	if (ret) {
> +		dev_err(dev, "failed to create children: %d\n", ret);
> +		goto err;
> +	}
> +	device_set_wakeup_capable(dev, true);
> +	pm_runtime_set_active(dev);
> +	pm_runtime_enable(dev);
> +	return 0;
> +err:
> +	kfree(cdns_sky1_pdata);
> +	return ret;
> +}

[Severity: High]
Does this shared error path fail to clean up the I/O memory mappings, assert
resets, and disable clocks before returning?

> +static void cdnsp_sky1_remove(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct cdnsp_sky1 *data =3D dev_get_drvdata(dev);
> +
> +	pm_runtime_get_sync(dev);
> +	of_platform_depopulate(dev);
> +	sky1_put_addr(data->xhci_base);
> +	sky1_put_addr(data->device_base);
> +	reset_control_deassert(data->reset);
> +	reset_control_deassert(data->preset);

[Severity: High]
Should these be reset_control_assert() instead of deassert() to correctly
quiesce the hardware before the clocks are disabled?

> +	cdnsp_sky1_clk_disable_all(dev);
> +	platform_set_drvdata(pdev, NULL);
> +}

[Severity: High]
Does this function need to call pm_runtime_put_sync() and pm_runtime_disabl=
e()?
Because pm_runtime_get_sync(dev) increments the usage counter at the start =
of
the function, could omitting the decrement lead to a leaked usage count and=
 a
broken PM state machine for the device on subsequent binds?

[ ... ]

> +static const struct dev_pm_ops cdnsp_sky1_pm_ops =3D {
> +	.suspend =3D cdnsp_sky1_system_suspend,
> +	.resume =3D cdnsp_sky1_system_resume,
> +};

[Severity: Medium]
Should these sleep callbacks be wrapped with pm_sleep_ptr()? Without it,
if CONFIG_PM is enabled but CONFIG_PM_SLEEP is disabled, could this generate
dead code warnings for the suspend and resume functions?

[ ... ]

> +static void cdnsp_sky1_shutdown(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct cdnsp_sky1 *data =3D dev_get_drvdata(dev);
> +	struct cdns *cdns =3D NULL;
> +	struct device *gadget_dev =3D NULL;
> +
> +	if (!device_may_wakeup(dev)) {
> +		/*
> +		 * Find the cdns3 child device, then find its gadget device
> +		 * and release the function driver before disabling clocks.
> +		 * This ensures all register accesses in gadget_unbind_driver
> +		 * complete before clocks are turned off.
> +		 */
> +		device_for_each_child(dev, &cdns, cdnsp_sky1_find_cdns);
> +		if (cdns)
> +			device_for_each_child(cdns->dev, &gadget_dev,
> +					      cdnsp_sky1_find_gadget_match);
> +		if (gadget_dev)
> +			device_release_driver(gadget_dev);

[Severity: Medium]
Does device_for_each_child() release the reference on the child device
immediately after the callback returns?

If so, could extracting the cdns and gadget_dev pointers out of the iterator
loop without acquiring references create a use-after-free window when they
are subsequently dereferenced?

> diff --git a/drivers/usb/cdns3/cdnsp-sky1.h b/drivers/usb/cdns3/cdnsp-sky=
1.h
> new file mode 100644
> index 0000000000000..49c3d5eab1744
> --- /dev/null
> +++ b/drivers/usb/cdns3/cdnsp-sky1.h

[ ... ]

> +#define D_XEC_CFG_3XPORT_MODE_VALUE     0xa0031e07
> +#define XEC_CFG_3XPORT_MODE_VALUE       0xa0031e07
> +#define CFG_3XPORT_MODE_DIS_SSP         (~(1 << 31))

[Severity: Medium]
Does shifting 1 by 31 bits here trigger undefined behavior since 1 is a
signed int? Could this use 1U or BIT(31) instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831082309.3854=
507-1-hongliang.yang@cixtech.com?part=3D4
