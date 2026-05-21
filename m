Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755EB23D297
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 09:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779354255; cv=none; b=PVyk2jGHsv8lhj1BzK3RJ1TvTVRetslugn+c1HKiXGO5ayKdHEUZefjzY02Bi47g/VnX8d2VBbf2+uQR3is7uj1+LkbEWlxGy5Pk8XQfN3nNSlIYG8NvNFJyPjBwvPthEnp5XHY7Lwm3hEYS+DVcps/6oaN535dCK0WV4BcoOow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779354255; c=relaxed/simple;
	bh=KZswCArHv+mkybCG9EPNGeFFNXsUr+0/djEhi9PCRsE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=m5wSPwdD8pC+hRP/Gi/2ovi4mxDTbaVFJtMslJx7irNjBAkvOz6SIyCuHxe9R8lq4NwdjiEjRFkps3HkNWO+UJ3ZO+jlGwP+HI60SBWb9Ir4LB5IA9XdR3rJS4hq7W89XF1pBvrwJWwk9BRQnmBY1Wm4WWqSiwfGU7sEC56v1c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YsEX2VQ1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YsEX2VQ1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4F961F000E9;
	Thu, 21 May 2026 09:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779354254;
	bh=EB6m9HF9tqbEdWrWbrH6fdfk4qb3gPVBxxZDCaWDyTk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YsEX2VQ16ZIHncW6Bvu6UcqFo8yETj9GxgiBTlpe7GGTBB2esD9X1nqElZz3JZ0lP
	 RObYItGxuybxkapQ9wSq9w7cytl6wftxkoCciVt0orFkD2bull7TdQDwu1lwdOcfWE
	 8B3dS/FP5wceZHOJ4uqHi9JisWkSDA9zJrZqalIhoSxkPf+Z8l+6H40S5ARACuA/L8
	 MuOXxA+FREKqZQcBckZ4RvaWAWHeVO0xzWFwWIsBUM2S9UAw+GAF16C07N3+qDetup
	 HX3fBQbkxgMkOpR+riHcpV7zgoAY8NnmntnDNCNpHdJmzXgkF+a118rmued/MnITbD
	 krLnStyKHylBw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 2/2] usb: cdnsp: Add support for device-only
 configuration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pawel Laszczak via B4 Relay" <devnull+pawell.cadence.com@kernel.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260521-no_drd_config_v9-v9-2-2512cef10104@cadence.com>
References: <20260521-no_drd_config_v9-v9-2-2512cef10104@cadence.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 21 May 2026 09:04:13 +0000
Message-Id: <20260521090413.C4F961F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The error path in `cdnsp_pci_probe` incorrectly frees the shared `=
wrap` structure, leading to a Use-After-Free and Double-Free when the sibli=
ng PCI function is subsequently removed.
- [High] Concurrent probing of the two PCI functions can cause a race condi=
tion leading to a NULL pointer dereference of the `wrap` object.
- [High] Missing cleanup of the registered USB role switch and hardware sta=
te in the `cdns3_plat_probe` error path.
- [High] Failure to call `phy_exit()` for `usb2_phy` when `usb3_phy` acquis=
ition fails in `cdns3_plat_probe()`.
- [High] TOCTOU race in `cdns_role_start()` and `cdns_role_stop()` allows m=
ultiple concurrent starts or stops of a USB role.
- [High] Unbinding the first PCI function disables its MMIO resources while=
 the registered platform device remains active, causing system crashes on s=
ubsequent accesses.
--

commit a6e4224829252614819c7a92327bc797dbce1637
Author: Pawel Laszczak <pawell@cadence.com>
Subject: usb: cdnsp: Add support for device-only configuration

This patch adds support for the Cadence USBSSP (cdnsp) controller in hardwa=
re
configurations where the Dual-Role Device (DRD) register block is missing.
It allows the driver to operate exclusively in a fixed peripheral or host
mode without relying on DRD logic. It also adjusts BAR indexing for 32-bit
addressing used in this layout.

Link: Closes: https://lore.kernel.org/oe-kbuild-all/202605141023.18vWXyw3-l=
kp@intel.com/

> diff --git a/drivers/usb/cdns3/cdns3-plat.c b/drivers/usb/cdns3/cdns3-pla=
t.c
> index 3fe3109a3688a..0d29c3cf58f11 100644
> --- a/drivers/usb/cdns3/cdns3-plat.c
> +++ b/drivers/usb/cdns3/cdns3-plat.c

[ ... ]

> @@ -113,21 +119,22 @@ static int cdns3_plat_probe(struct platform_device =
*pdev)
> =20
>  	cdns->dev_regs	=3D regs;
> =20
> -	cdns->otg_irq =3D platform_get_irq_byname(pdev, "otg");
> -	if (cdns->otg_irq < 0)
> -		return dev_err_probe(dev, cdns->otg_irq,
> -				     "Failed to get otg IRQ\n");
> -
> -	res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "otg");
> -	if (!res) {
> -		dev_err(dev, "couldn't get otg resource\n");
> -		return -ENXIO;
> +	if (!cdns->no_drd) {
> +		cdns->otg_irq =3D platform_get_irq_byname(pdev, "otg");
> +		if (cdns->otg_irq < 0)
> +			return dev_err_probe(dev, cdns->otg_irq,
> +					     "Failed to get otg IRQ\n");
> +
> +		res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "otg");
> +		if (!res) {
> +			dev_err(dev, "couldn't get otg resource\n");
> +			return -ENXIO;
> +		}
> +		cdns->otg_res =3D *res;
>  	}
> =20
>  	cdns->phyrst_a_enable =3D device_property_read_bool(dev, "cdns,phyrst-a=
-enable");
> =20
> -	cdns->otg_res =3D *res;
> -
>  	cdns->wakeup_irq =3D platform_get_irq_byname_optional(pdev, "wakeup");
>  	if (cdns->wakeup_irq =3D=3D -EPROBE_DEFER)
>  		return cdns->wakeup_irq;

[Severity: High]
This is a pre-existing issue, but further down in cdns3_plat_probe, when
acquiring usb3_phy, if devm_phy_optional_get() fails, it returns directly
via dev_err_probe().=20

Does this leak the initialized state of the usb2_phy since it bypasses the
err_phy3_init label where phy_exit() is called?

[Severity: High]
This is a pre-existing issue, but also further down in cdns3_plat_probe, if
cdns_core_init_role(cdns) fails, the error path jumps to err_cdns_init.

Does this error path miss unregistering the USB role switch? If cdns_init()
allocates and registers a non-devres managed role switch, bypassing the
cleanup could leave dangling sysfs nodes and cause issues on reprobe.

> diff --git a/drivers/usb/cdns3/cdnsp-pci.c b/drivers/usb/cdns3/cdnsp-pci.c
> index 432007cfe6954..c38a3dc7111a7 100644
> --- a/drivers/usb/cdns3/cdnsp-pci.c
> +++ b/drivers/usb/cdns3/cdnsp-pci.c

[ ... ]

> @@ -93,7 +104,7 @@ static int cdnsp_pci_probe(struct pci_dev *pdev,
> =20
>  	pci_set_master(pdev);
> =20
> -	if (pci_is_enabled(func)) {
> +	if (func && pci_is_enabled(func)) {
>  		wrap =3D pci_get_drvdata(func);
>  	} else {
>  		wrap =3D kzalloc_obj(*wrap);

[Severity: High]
This is a pre-existing issue, but could this race if both PCI functions are
probed concurrently?=20

If both call pcim_enable_device(pdev), both would increment their enable
counts. Both would then see pci_is_enabled(func) as true, attempt to get
the wrap structure via pci_get_drvdata(func), and receive a NULL pointer
since pci_set_drvdata() hasn't been called yet. Could this lead to a NULL
pointer dereference when wrap->dev_res is accessed?

[ ... ]

> @@ -145,9 +158,21 @@ static int cdnsp_pci_probe(struct pci_dev *pdev,
>  		wrap->dev_res[RES_IRQ_OTG_ID].flags =3D IORESOURCE_IRQ;
>  	}
> =20
> -	if (pci_is_enabled(func)) {
> +	if (no_drd || pci_is_enabled(func)) {
> +		u8 idx =3D 0;
> +
>  		/* set up platform device info */
>  		pdata.override_apb_timeout =3D CHICKEN_APB_TIMEOUT_VALUE;
> +
> +		if (no_drd) {
> +			wrap->prop[idx++] =3D PROPERTY_ENTRY_STRING("compatible",
> +								  "cdns,cdnsp");
> +			wrap->prop[idx++] =3D PROPERTY_ENTRY_STRING("dr_mode", "peripheral");
> +		} else {
> +			wrap->prop[idx++] =3D PROPERTY_ENTRY_STRING("dr_mode", "otg");
> +			wrap->prop[idx++] =3D PROPERTY_ENTRY_BOOL("usb-role-switch");
> +		}
> +
>  		memset(&plat_info, 0, sizeof(plat_info));
>  		plat_info.parent =3D &pdev->dev;
>  		plat_info.fwnode =3D pdev->dev.fwnode;
> @@ -158,6 +183,7 @@ static int cdnsp_pci_probe(struct pci_dev *pdev,
>  		plat_info.dma_mask =3D pdev->dma_mask;
>  		plat_info.data =3D &pdata;
>  		plat_info.size_data =3D sizeof(pdata);
> +		plat_info.properties =3D wrap->prop;
>  		wrap->devfn =3D pdev->devfn;
>  		/* register platform device */
>  		wrap->plat_dev =3D platform_device_register_full(&plat_info);

[Severity: High]
This is a pre-existing issue, but is it safe to unconditionally call
kfree(wrap) in the error path of platform_device_register_full()?

If the sibling function has already stored wrap in its drvdata, this might
leave a dangling pointer attached to the sibling function. When the sibling
is later unbound, could its remove routine retrieve the dangling pointer
and double-free it?

> @@ -185,13 +211,17 @@ static void cdnsp_pci_remove(struct pci_dev *pdev)
>  	if (wrap->devfn =3D=3D pdev->devfn)
>  		platform_device_unregister(wrap->plat_dev);
> =20
> -	if (!pci_is_enabled(func))
> +	if (!func || !pci_is_enabled(func))
>  		kfree(wrap);
> =20
>  	pci_dev_put(func);
>  }

[Severity: High]
This is a pre-existing issue, but could this lead to a crash if the user
unbinds the first PCI function?

If wrap->devfn points to the second function, unbinding the first function
would skip unregistering the platform device. The PCI core would then
disable the first function and unmap its BARs. Since the platform device
remains active, would subsequent MMIO accesses to the unmapped regions
trigger a PCI master abort or page fault?

> diff --git a/drivers/usb/cdns3/core.c b/drivers/usb/cdns3/core.c
> index 6a8d1fefbc0d0..504bdf13ea804 100644
> --- a/drivers/usb/cdns3/core.c
> +++ b/drivers/usb/cdns3/core.c
> @@ -70,7 +70,8 @@ static void cdns_role_stop(struct cdns *cdns)
>  static void cdns_exit_roles(struct cdns *cdns)
>  {
>  	cdns_role_stop(cdns);
> -	cdns_drd_exit(cdns);
> +	if (!cdns->no_drd)
> +		cdns_drd_exit(cdns);
>  }

[Severity: High]
This is a pre-existing issue, but does cdns_role_stop() have a race conditi=
on
if multiple threads attempt to start or stop a role concurrently?=20

Since cdns_role_stop() checks cdns->roles[role]->state outside of the
cdns->mutex, two threads could observe the state as active, acquire the
lock sequentially, and invoke the stop() callback twice. A similar risk
exists in cdns_role_start().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521-no_drd_con=
fig_v9-v9-0-2512cef10104@cadence.com?part=3D2
