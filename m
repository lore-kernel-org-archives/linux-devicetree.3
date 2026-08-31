Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BFA3397692
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 08:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788165671; cv=none; b=N5SErCqpYgj4dtlQ7m+Zihn9N6h5J5G6M4JXwb1QQHGnNJTW0mOoySSUEhbO8pK5FqWt3hGk7C080YgyD06yjEbBbbqQ0u2Wl0rTHZy7NVAkzbKmzA/f9j3bFCc+CDROkxOv7x6cebts/M//6IBVVBZErq09/K293U6nyPsbulQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788165671; c=relaxed/simple;
	bh=l0SI8SLuurkMXpxi82jxXzBQ8NVvmiXbaSp6jmeaBo4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kL4k+WHx7uZS6aQzm8x/waBn71cxUmaDpIqy6o/dXzUdT6PeZYz5iqkelr7yvA20aBA3cN2KMdStzSQsTjt4ROElhMvi9FmZdLv2LZSNCvhtkc62zYWol1hZGrc2BCWIgBvIv+xZAtghYY9HTA25yK+k0wBkQuR67UmBQ7jgAno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MzKA/KSs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MzKA/KSs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30DA11F000E9;
	Mon, 31 Aug 2026 08:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788165669;
	bh=SYxdarkq2tSLaE0LEwk03SmpjTFmGU6/ydnxJALoFJI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MzKA/KSsfm6Hjb4InbYVJ2XTLVor6c7MrG3XLiTzGi1O48c9O4CA0Y9B2BpcNH62w
	 NjTDYXSG5dyV+x+aazxjG3Ur21BW1ypv2Ihbjpaek6wzdnG7xwhC3YvtEg+crpkFc8
	 cUHCc3PNiPgwNUCr8vPnkhpX/9OhFEr+jP/5E5IQenKTHV8v+eQ4E5vuebJgoHsJk1
	 w/lvmtooj1vYHd+psMEe+c+Zt/hgRonYENzaEFNJ/nRFQ9cY9Fw4QbtzP/x5oee4Fx
	 uU+vlRSKNw1fW8odT+NYON8+yViQp7uuu316Rd9hMTqkXWPU/I/FB0UdyeylsT6thn
	 6w+5/LYfJHBFA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 3/4] usb: cdns3: Add CIX Sky1 glue driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hongliang Yang" <hongliang.yang@cixtech.com>
Cc: neil.armstrong@linaro.org, olteanv@gmail.com, conor+dt@kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org, linux-phy@lists.infradead.org, robh@kernel.org
In-Reply-To: <20260831082309.3854507-4-hongliang.yang@cixtech.com>
References: <20260831082309.3854507-1-hongliang.yang@cixtech.com>
 <20260831082309.3854507-4-hongliang.yang@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 08:41:07 +0000
Message-Id: <20260831084108.30DA11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 11 potential issue=
(s) to consider:
- [High] IOMEM, clock, and reset leaks on probe error paths.
- [High] Missing get_device() causes unsafe device pointer storage in match=
 function, leading to Use-After-Free.
- [High] Global state corruption of shared static cdns_sky1_auxdata array i=
n probe.
- [High] Flawed platform_data memory management causes leaks or double-free=
s when multiple or zero children exist.
- [High] Unbalanced Runtime PM state during driver removal.
- [High] Incorrect hardware reset logic during driver removal.
- [High] Signed integer overflow in clock frequency calculations.
- [High] Writing inverted AXI_HALT bitmask to the capability register inadv=
ertently sets all other bits to 1.
- [Medium] Device node reference leak in sky1_of_get_addr_by_name.
- [Medium] Clock error recovery paths destructively nullify devres managed =
clock pointers.
- [Low] Signed integer overflow when defining CFG_3XPORT_MODE_DIS_SSP.
--

commit f5b41d8b4e76c0521bdb8557f0e54b6023714500
Author: Hongliang Yang <hongliang.yang@cixtech.com>

usb: cdns3: Add CIX Sky1 glue driver

Add glue layer for the Cadence USBSSP DRD controller on CIX Sky1 SoCs.
The glue driver handles platform-specific initialization including clocks,
resets, and PHY configuration.

> diff --git a/drivers/usb/cdns3/cdnsp-sky1.c b/drivers/usb/cdns3/cdnsp-sky=
1.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/usb/cdns3/cdnsp-sky1.c
> @@ -0,0 +1,682 @@
[ ... ]
> +static int cdnsp_sky1_clk_enable_resume(struct device *dev)
> +{
[ ... ]
> +err_usb_clks:
> +	cix_usb_clks[i] =3D NULL;
> +	while (--i >=3D 0) {
> +		clk_disable_unprepare(cix_usb_clks[i]);
> +		cix_usb_clks[i] =3D NULL;

[Severity: Medium]
Is it safe to nullify these clock pointers?=20

Because the clocks are devres-managed, devres will still properly free them,
but nullifying the pointers destroys the driver's ability to ever reference
them again.=20

If a transient error occurs during a resume attempt, any subsequent retry or
cleanup will fail because the driver lost its internal pointers.

> +	}
> +	return ret;
> +};
[ ... ]
> +static void cdnsp_sky1_configure_controller(struct cdnsp_sky1 *data)
> +{
[ ... ]
> +	writel(AXI_HALT, data->device_base + D_XEC_AXI_CAP);
> +	writel(AXI_HALT, data->xhci_base + D_XEC_AXI_CAP);
> +	writel(data->axi_bmax_value, data->device_base + D_XEC_AXI_CTRL0);
> +	writel(data->axi_bmax_value, data->xhci_base + D_XEC_AXI_CTRL0);
> +	writel((~(u32)(AXI_HALT)), data->device_base + D_XEC_AXI_CAP);
> +	writel((~(u32)(AXI_HALT)), data->xhci_base + D_XEC_AXI_CAP);

[Severity: High]
Does this inadvertently overwrite other capability bits?=20

AXI_HALT is defined as BIT(31). Blindly writing ~(u32)(AXI_HALT) yields
0x7FFFFFFF, which sets bits 0 through 30 to 1 rather than preserving their
existing state with a read-modify-write or clearing them with 0.=20

Overwriting 31 capability bits with 1s can enable unintended modes or cause
unpredictable hardware behavior.

> +	clk =3D data->sof_clk_freq;
> +	v0 =3D  25 * clk / 100000000;
> +	v1 =3D clk / 10000;
> +	v2 =3D clk / 10;
> +	writel(((v0 > 1) ? v0 - 1 : 1), data->device_base
> +		+ D_XEC_PRE_REG_250NS);
> +	writel((unsigned int)((v1 / 100 > 1) > 0 ? (v1 / 100) - 1 : 1),
> +	       data->device_base + D_XEC_PRE_REG_1US);
> +	writel((unsigned int)((v1 / 10 > 1) > 0 ? (v1 / 10) - 1 : 1),
> +	       data->device_base + D_XEC_PRE_REG_10US);
> +	writel(((v1) > 1 ? v1 - 1 : 1), data->device_base
> +		+ D_XEC_PRE_REG_100US);
> +	writel((unsigned int)((125 * clk / 1000000) > 1 ? (125 * clk / 1000000)=
 : 1),
> +	       data->device_base + D_XEC_PRE_REG_125US);

[Severity: High]
Will this calculation overflow for frequencies above 17.1 MHz?

Because clk is typed as a signed 32-bit int, 125 * clk will exceed INT_MAX
(2,147,483,647) and overflow for values above approximately 17.1 MHz. This
yields a negative value that improperly configures the hardware pre-scaler
registers.=20

Could this be mitigated by using an unsigned 64-bit cast, such as 125ULL * =
clk?

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
Can this leak the device node reference?

of_get_next_child() acquires and returns a device node with an incremented
reference count, but the reference is never released with of_node_put() on
either the success or failure paths.

[ ... ]
> +static struct of_dev_auxdata cdns_sky1_auxdata[] =3D {
> +	{
> +		.compatible =3D "cdns,usb3",
> +	},
> +	{},
> +};
> +
> +static int cdnsp_sky1_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	data->device_base =3D sky1_get_addr_by_name(dev, "dev");
> +	if (!data->device_base)
> +		return -ENODEV;
> +	ret =3D cdnsp_sky1_drd_init(data);
> +	if (ret =3D=3D -ETIMEDOUT)
> +		return -EPROBE_DEFER;
> +	if (ret)
> +		return ret;

[Severity: High]
Do these error paths leak the IOMEM regions, hardware clocks, and resets?

cdnsp_sky1_probe() manually maps IOMEM regions using sky1_get_addr_by_name()
and enables hardware clocks in cdnsp_sky1_drd_init(). If subsequent
initialization steps fail, the function returns directly or jumps to the err
label without unmapping the IOMEM with iounmap(), disabling the clocks, or
re-asserting the hardware resets.

Since probe can be retried multiple times, these leaked resources will
accumulate.

> +	data->oc_gpio =3D devm_gpiod_get_optional(data->dev, "oc", GPIOD_IN);
> +	if (IS_ERR(data->oc_gpio)) {
> +		dev_err(data->dev, "can not get oc_gpio\n");
> +		ret =3D PTR_ERR(data->oc_gpio);
> +		return ret;
> +	}
> +	if (data->oc_gpio) {
> +		ret =3D gpiod_direction_input(data->oc_gpio);
> +		if (ret < 0)
> +			dev_err(data->dev, "set oc_gpio input failed:%d\n", ret);
> +	}
> +	/* release by platform_device_release */
> +	cdns_sky1_pdata =3D kzalloc(sizeof(*cdns_sky1_pdata), GFP_KERNEL);

[Severity: High]
Can this cause a memory leak or double-free of cdns_sky1_pdata?

The instance-specific structure cdns_sky1_pdata is allocated here and passed
to child devices via of_platform_populate(). If of_platform_populate() matc=
hes
zero children, the pointer is never attached to a device and permanently le=
aks.

If it matches multiple children, all children receive the exact same pointe=
r,
resulting in a double-free kernel panic when each child's release function
attempts to free the same pointer upon unbind.

> +	if (!cdns_sky1_pdata)
> +		return -ENOMEM;
> +	cdns_sky1_pdata->platform_suspend =3D cdns_sky1_platform_suspend;
> +	cdns_sky1_pdata->quirks =3D CDNS3_DEFAULT_PM_RUNTIME_ALLOW;
> +	cdns_sky1_auxdata->platform_data =3D cdns_sky1_pdata;
> +	ret =3D of_platform_populate(node, NULL, cdns_sky1_auxdata, dev);

[Severity: High]
Does this corrupt the global cdns_sky1_auxdata array?

cdns_sky1_auxdata is defined as a statically shared array for the driver, b=
ut
a dynamically allocated, instance-specific pointer (cdns_sky1_pdata) is
assigned to cdns_sky1_auxdata->platform_data.

Because the device tree contains multiple instances of this driver, probing
them concurrently or sequentially will race to overwrite this shared global
state, causing cross-device memory corruption and dangling pointers.

[ ... ]
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
Should these resets be asserted instead of deasserted?

The driver attempts to tear down the hardware but incorrectly calls
reset_control_deassert() again instead of reset_control_assert(). This fails
to reset the hardware and leaves it active while its clocks are subsequently
disabled, which can hang the system or cause undefined hardware behavior.

> +	cdnsp_sky1_clk_disable_all(dev);
> +	platform_set_drvdata(pdev, NULL);
> +}

[Severity: High]
Does this leave the device's runtime PM subsystem in an unbalanced state?

cdnsp_sky1_probe() enables runtime PM, but cdnsp_sky1_remove() omits a call
to pm_runtime_disable() before exiting.

Additionally, cdnsp_sky1_remove() calls pm_runtime_get_sync() at the start
of the function but omits a balancing pm_runtime_put() call, permanently
leaking the device's usage counter.

[ ... ]
> +static int cdnsp_sky1_find_gadget_match(struct device *dev, void *data)
> +{
[ ... ]
> +	if (name && dev->bus && !strcmp(dev->bus->name, "gadget") &&
> +	    !strncmp(name, gadget_prefix, sizeof(gadget_prefix) - 1)) {
> +		*gadget_dev =3D dev;
> +		return 1;
> +	}
> +	return 0;
> +}
> +
> +static void cdnsp_sky1_shutdown(struct platform_device *pdev)
> +{
[ ... ]
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

[Severity: High]
Can this result in a use-after-free condition?

In cdnsp_sky1_find_gadget_match(), a pointer to the matched device is stored
without acquiring a persistent reference via get_device(). The iterator
device_for_each_child() immediately drops its reference when advancing or
returning, leaving a bare pointer.

If the gadget device is removed concurrently immediately before
device_release_driver() is called, the pointer becomes dangling.

[ ... ]
> diff --git a/drivers/usb/cdns3/cdnsp-sky1.h b/drivers/usb/cdns3/cdnsp-sky=
1.h
> new file mode 100644
> --- /dev/null
> +++ b/drivers/usb/cdns3/cdnsp-sky1.h
> @@ -0,0 +1,127 @@
[ ... ]
> +#define D_XEC_CFG_3XPORT_MODE_VALUE     0xa0031e07
> +#define XEC_CFG_3XPORT_MODE_VALUE       0xa0031e07
> +#define CFG_3XPORT_MODE_DIS_SSP         (~(1 << 31))

[Severity: Low]
Does this trigger undefined behavior?

1 is treated as a signed 32-bit integer, and shifting it left by 31 bits
overflows the sign bit. Should this be explicitly unsigned, such as
(~(1U << 31)) or ~BIT(31)?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831082309.3854=
507-1-hongliang.yang@cixtech.com?part=3D3
