Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805EB2882DE
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 02:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788403541; cv=none; b=tTZAgRSey2ze+UCjdx9FuvvAXZdcQiNdbD026B8is3CwRbKviXH85KkXyIbhyuqvV7wvLbvq/DDED9YnoeViEcuQSbbcIqLDxsg1m2mq7NjBMLIQl8PIaOlAj52cNC+4bxiIsp6wa+/frwkMNpW1t2Ufxc3fo8aYbMJ0l5ydoIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788403541; c=relaxed/simple;
	bh=DANyefz9nmXgO2/GOwrwjEN7lnlD/QnXQYO4qrHyHe0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KzqHeuRZcEfJNjqLocPSclDtmseo7UGtTTthKWvQJH6O+3sBWOoiSF7mX3zjpunYOGAFL16uypB6ArOGxH1Shm0nqoUPH+7x9M6tv6zQXqKZu8ue5A+SmUBSt1OFco51dXGBUvVcfePsnY4kWHFFGB2944WnIz29S7e1qZan1DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f3+sLfVO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f3+sLfVO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADB881F000E9;
	Thu,  3 Sep 2026 02:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788403540;
	bh=YA5GOgzpiNZnpTsf0aCfkh7Ipzo73Chaf6cmrvc+4IE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=f3+sLfVOQSYc9G89sF10GfU1tEo+Ly1C373GzlAU/UCUaZT85YkBWvzvlmUVHIEeE
	 Nu3RkCUO9TUNEUYPgGYQeKqZmefPaBH7TXG7yN6Fld/E9j2mHESAAoXHsqcd+eFIG7
	 T1TTmMcmaY2BwIbv88DSjxJtYHEy7Db4PnmoCFaag06s0A4/Kv5ybZMo17/gNQqy9M
	 jUvSH1Tg/EyF4LXqUNDEdJVCt7OC87vJ6e2G8Vm2XknoQnJjqyXZTqo1mUqfGMXrSe
	 HF1+yMoO+X4I9SYg9mWgUscZkzAOBBzvcv9GT2U6CHif/OghRXVYzAtmRgvJ2uTlh8
	 V6woKfsHxQo3g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/5] usb: cdns3: Add CIX Sky1 glue driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hongliang Yang" <hongliang.yang@cixtech.com>
Cc: vkoul@kernel.org, olteanv@gmail.com, neil.armstrong@linaro.org, linux-phy@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260903023521.2064986-5-hongliang.yang@cixtech.com>
References: <503e87d9-3311-413a-98c0-e02a02c4a354@kernel.org>
 <20260903023521.2064986-1-hongliang.yang@cixtech.com>
 <20260903023521.2064986-5-hongliang.yang@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 02:45:39 +0000
Message-Id: <20260903024539.ADB881F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] Double disable of clocks on probe error path causes reference coun=
t underflows.
- [High] Incorrect operation order and disable_irq() on a shared IRQ in cdn=
sp_sky1_shutdown.
- [High] Lockless access to cdns->host_dev during system suspend and shutdo=
wn leads to a Use-After-Free.
- [Medium] Incorrect PM wrapper macro used for the dev_pm_ops structure poi=
nter.
- [Medium] Fragile lookup of Device Tree child nodes for register addresses.
- [Medium] Unconditional disabling of AXI and SOF clocks during suspend bre=
aks Wake-on-USB.
- [Low] Missing inclusion of <linux/iopoll.h>.
--

commit 5ad3503fa82899af71645298ce56167ad8a8a82d
Author: Hongliang Yang <hongliang.yang@cixtech.com>
Date:   Thu Sep 3 02:35:20 2026 +0000

    usb: cdns3: Add CIX Sky1 glue driver

This patch adds a glue layer driver for the Cadence USBSSP controller
integrated into the CIX Sky1 SoC. It enables the controller clocks, resets,
and handles mode strap controls via the Sky1 S5 system controller.

> --- /dev/null
> +++ b/drivers/usb/cdns3/cdnsp-sky1.c
[ ... ]
> +static int sky1_handshake(void __iomem *ptr, u32 mask, u32 done, u64 tim=
eout_us)
> +{
> +	u32	result;
> +	int	ret;
> +
> +	ret =3D readl_poll_timeout(ptr, result,
> +				 (result & mask) =3D=3D done || result =3D=3D U32_MAX,
> +				 10, timeout_us);

[Severity: Low]
Could this fail to compile on certain architectures or configurations?

The readl_poll_timeout macro is used here, but its defining header=20
<linux/iopoll.h> is not included in the file.

[ ... ]
> +static int cdns_sky1_platform_suspend(struct device *dev,
> +				      bool suspend, bool wakeup)
> +{
> +	struct cdns *cdns =3D dev_get_drvdata(dev);
> +	struct platform_device *xhci_dev =3D cdns->host_dev;

[Severity: High]
Is it safe to read cdns->host_dev here without holding cdns->mutex?

If a concurrent OTG role switch triggers while the system executes this sus=
pend
callback, could this lead to a use-after-free when the host_dev is freed?

[ ... ]
> +static void __iomem *sky1_of_get_addr_by_name(struct device_node *parent=
, const char *name)
> +{
> +	void __iomem *addr =3D NULL;
> +	struct device_node *node;
> +	int index;
> +
> +	node =3D of_get_next_child(parent, NULL);
> +	if (!node)
> +		return NULL;
> +
> +	index =3D of_property_match_string(node, "reg-names", name);

[Severity: Medium]
Could this lookup be fragile against changes in the device tree ordering?

By passing NULL to of_get_next_child, it blindly assumes the target device =
node
is always the very first child.

If the structure is ordered differently, this might abort the probe.

[ ... ]
> +err_quiesce:
> +	reset_control_assert(data->reset);
> +	reset_control_assert(data->preset);
> +	cdnsp_sky1_clk_disable_all(dev);

[Severity: High]
Could this cause a reference count underflow on the clocks?

If cdnsp_sky1_clk_enable_all fails mid-initialization, it cleanly unwinds i=
ts
own prepared clocks.

Returning the error then propagates up to the probe function which jumps to
err_quiesce and unconditionally calls cdnsp_sky1_clk_disable_all, disabling
the already unwound clocks a second time.

[ ... ]
> +static int cdnsp_sky1_system_suspend(struct device *dev)
> +{
> +	struct cdnsp_sky1 *data =3D dev_get_drvdata(dev);
> +
> +	if (!data->wakeup) {
> +		reset_control_assert(data->reset);
> +		reset_control_assert(data->preset);
> +	}
> +	cdnsp_sky1_clk_disable_suspend(dev);
> +	return 0;
> +}

[Severity: Medium]
Does unconditionally disabling the AXI and SOF clocks here break Wake-on-USB
functionality?

The comment earlier mentions that closing the axi and sof clock will result=
 in
the inability to generate port status change interrupts, yet the disable
function is called unconditionally, outside the !data->wakeup block.

[ ... ]
> +static void cdnsp_sky1_shutdown(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct cdnsp_sky1 *data =3D dev_get_drvdata(dev);
> +	struct device *cdns_dev =3D NULL;
> +	struct device *gadget_dev =3D NULL;
> +	struct cdns *cdns =3D NULL;
[ ... ]
> +		if (cdns && cdns->host_dev) {
> +			struct usb_hcd *hcd =3D platform_get_drvdata(cdns->host_dev);

[Severity: High]
Similar to the suspend callback, is there a risk of a use-after-free here if
an interleaving OTG role switch frees cdns->host_dev right before
platform_get_drvdata is called, since this is accessed without cdns->mutex?

> +
> +			if (hcd && hcd->irq > 0) {
> +				disable_irq(hcd->irq);
> +				synchronize_irq(hcd->irq);
> +				/*
> +				 * Clear HCD_FLAG_HW_ACCESSIBLE before disable_irq.
> +				 * This prevents usb_hcd_irq from calling xhci_irq
> +				 * (which reads USBSTS) after clocks are disabled.
> +				 */
> +				clear_bit(HCD_FLAG_HW_ACCESSIBLE, &hcd->flags);
> +			}
> +		}

[Severity: High]
Does calling disable_irq on a potentially shared IRQ line risk breaking oth=
er
devices on the same line?

Additionally, the comment explicitly states that HCD_FLAG_HW_ACCESSIBLE must
be cleared before disable_irq to prevent the interrupt handler from reading
USBSTS after clocks are disabled.

However, the implementation executes disable_irq and synchronize_irq before
clear_bit.

Could this out-of-order execution risk interrupt handlers firing
inappropriately during teardown?

[ ... ]
> +static struct platform_driver cdnsp_sky1_driver =3D {
> +	.probe		=3D cdnsp_sky1_probe,
> +	.remove		=3D cdnsp_sky1_remove,
> +	.shutdown	=3D cdnsp_sky1_shutdown,
> +	.driver		=3D {
> +		.name	=3D "cdnsp-sky1",
> +		.of_match_table	=3D cdns_sky1_of_match,
> +		.pm	=3D pm_sleep_ptr(&cdnsp_sky1_pm_ops),
> +	},
> +};

[Severity: Medium]
Should the dev_pm_ops structure pointer use the pm_ptr macro instead of
pm_sleep_ptr?

If the kernel is built with CONFIG_PM=3Dy but CONFIG_PM_SLEEP=3Dn, using
pm_sleep_ptr erroneously excludes the structure pointer, leading to dead co=
de
and bypassed power management.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903023521.2064=
986-1-hongliang.yang@cixtech.com?part=3D4
