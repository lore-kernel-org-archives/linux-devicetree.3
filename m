Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80E63955C1
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 21:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778706268; cv=none; b=UwO8GgTy6hvrWHf/+5Z61/5BxkSmcEOu8+c4ceH0UnK8VwiQTnMT+DGdqgdhYwCjoyt1OL901vi7fy2yWg6JuojTwrneklzsUPM0P0qdKmLV+hTdGnCRwh5HdKHOXzuYuobCFYNWphRr5GmNKcN5XzvfFUiOS0hRfSfwiENrvL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778706268; c=relaxed/simple;
	bh=5UTsSnept7bHmH368MHXnsowJFnDqAlVsZxVHLSF7oY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Y8JRy7xSfoDv65H4cS1yf4xG3dVnyP68rvU1t41MMRGWYonCtvwCRiNsvsQJwXeH7E56VYoD0Fos2bBtreK5my44qDNV/Q+pwLRpUCZt+Rv3Vq4YSq1v3m0oSHrHZCOsVmyvWT1qP3FfE3Sw399nRFQjt3kt6ytSINTWFgVRVBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pTeX6KYt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pTeX6KYt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06563C19425;
	Wed, 13 May 2026 21:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778706268;
	bh=5UTsSnept7bHmH368MHXnsowJFnDqAlVsZxVHLSF7oY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=pTeX6KYt3Y9tzPD+XlFiQ1sU+HNbouTkHFO1Tsa4X3aI1VE7E/cN8NNb+GaiZnjdd
	 KN5WBRAU8GXpEItshZ/P2iDNdIWZ+o6R7n2594HGWgunhuYmCAmUK2tMBLJ+7fLDY8
	 /X+pAySp5v9seOOZfncJSVM81kpGY5BEgYQN1n/C4zfNh+tdcB4cN8zHDc1hOt2cuo
	 MJLBvg1qmCH1z+IqXLIjFqKNa1H70IqBzk1FehRB/0o4Uo+zAvrNwqV9IUlNwfvfIC
	 zhtR9KReh2o6rbLq+pdrcX+iGfXaNR89W3EWzOP6lVi9UiwJUo7xXY2oVDlAwcE0fe
	 EX5JeK/0q17ag==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] usb: cdnsp: Add support for device-only
 configuration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pawel Laszczak via B4 Relay" <devnull+pawell.cadence.com@kernel.org>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260512-b4-no_drd_config-v4-2-7b4e5dc96f81@cadence.com>
References: <20260512-b4-no_drd_config-v4-2-7b4e5dc96f81@cadence.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 May 2026 21:04:27 +0000
Message-Id: <20260513210428.06563C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Uninitialized variable returned in cdns_drd_host_on()
- [High] Use-After-Free due to improper error handling in cdnsp_pci_probe()
- [High] Use-After-Free via sysfs due to failure to unregister usb_role_swi=
tch on cdns_core_init_role() error
- [High] Race condition in cdnsp_pci_probe() leading to NULL pointer derefe=
rence under asynchronous probing
--

commit b729274ea9c34ef88a5c2a918206d853477c97a2
Author: Pawel Laszczak <pawell@cadence.com>

usb: cdnsp: Add support for device-only configuration

This patch introduces support for the Cadence USBSSP (cdnsp) controller in
hardware configurations where the Dual-Role Device (DRD) register block is
not implemented or is inaccessible. It adjusts BAR indexing, adds a no_drd
flag, and skips DRD-specific initializations if no_drd is true.

> diff --git a/drivers/usb/cdns3/cdns3-plat.c b/drivers/usb/cdns3/cdns3-pla=
t.c
> index 3fe3109a3688a..86c963a072dba 100644
> --- a/drivers/usb/cdns3/cdns3-plat.c
> +++ b/drivers/usb/cdns3/cdns3-plat.c
> @@ -81,6 +81,7 @@ static int cdns3_plat_probe(struct platform_device *pde=
v)
>  	if (cdns->pdata && cdns->pdata->override_apb_timeout)
>  		cdns->override_apb_timeout =3D cdns->pdata->override_apb_timeout;
> =20
> +	cdns->no_drd =3D device_property_read_bool(dev, "no_drd");
>  	platform_set_drvdata(pdev, cdns);

This isn't a bug introduced by this patch, but does the error path in this
probe function leave a dangling role switch?

In cdns3_plat_probe(), cdns_init() registers a USB role switch which stores
a pointer to the devm-allocated cdns structure as its driver data.

If cdns_core_init_role() fails later in the probe:

cdns3_plat_probe()
    ret =3D cdns_init(cdns);
    ...
    ret =3D cdns_core_init_role(cdns);
    if (ret)
        goto err_cdns_init;

err_cdns_init:
    set_phy_power_off(cdns);
    ...

Is it possible the role switch remains alive and accessible via sysfs
without being unregistered, but the underlying cdns structure gets freed by
devres, leading to a use-after-free?

[ ... ]
> diff --git a/drivers/usb/cdns3/cdnsp-pci.c b/drivers/usb/cdns3/cdnsp-pci.c
> index 432007cfe6954..feb9162298709 100644
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

This isn't a bug introduced by this patch, but could this race if
asynchronous probing is enabled?

If the first function is probed concurrently, it calls
pcim_enable_device(), which makes pci_is_enabled(func) evaluate to true
for the second function.=20

If the second function reaches here before the first function calls
pci_set_drvdata() at the end of its probe, will pci_get_drvdata() return a
NULL pointer?

If so, could this lead to a NULL pointer dereference immediately following
this block when it populates resources via res =3D wrap->dev_res?

[ ... ]
> @@ -158,6 +182,7 @@ static int cdnsp_pci_probe(struct pci_dev *pdev,
>  		plat_info.dma_mask =3D pdev->dma_mask;
>  		plat_info.data =3D &pdata;
>  		plat_info.size_data =3D sizeof(pdata);
> +		plat_info.properties =3D wrap->prop;
>  		wrap->devfn =3D pdev->devfn;
>  		/* register platform device */
>  		wrap->plat_dev =3D platform_device_register_full(&plat_info);

This isn't a bug introduced by this patch, but does the error handling here
risk a double-free?

If the second PCI function is being probed and
platform_device_register_full() fails, the existing error handling does:

cdnsp_pci_probe()
    wrap->plat_dev =3D platform_device_register_full(&plat_info);
    if (IS_ERR(wrap->plat_dev)) {
        ret =3D PTR_ERR(wrap->plat_dev);
        kfree(wrap);
        goto put_pci;
    }

Since wrap was retrieved from the first function's driver data via
pci_get_drvdata(), the first function still holds this pointer. When the
first function is eventually unbound, will cdnsp_pci_remove() attempt to
use and free it again, resulting in a use-after-free?

[ ... ]
> diff --git a/drivers/usb/cdns3/drd.c b/drivers/usb/cdns3/drd.c
> index 84fb38a5723a3..f87cf85cb97a1 100644
> --- a/drivers/usb/cdns3/drd.c
> +++ b/drivers/usb/cdns3/drd.c
[ ... ]
> @@ -181,6 +184,9 @@ int cdns_drd_host_on(struct cdns *cdns)
>  	u32 val, ready_bit;
>  	int ret;
> =20
> +	if (cdns->no_drd)
> +		goto phy_set;
> +

Does this jump bypass the initialization of the return variable?

When no_drd is true, the execution jumps to the phy_set label, bypassing
the block where ret is populated.

[ ... ]
> @@ -197,6 +203,7 @@ int cdns_drd_host_on(struct cdns *cdns)
>  	if (ret)
>  		dev_err(cdns->dev, "timeout waiting for xhci_ready\n");
> =20
> +phy_set:
>  	phy_set_mode(cdns->usb2_phy, PHY_MODE_USB_HOST);
>  	phy_set_mode(cdns->usb3_phy, PHY_MODE_USB_HOST);
>  	return ret;

When the function finishes and returns ret, will it return an uninitialized
value from the stack, potentially causing host initialization to fail
unpredictably?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512-b4-no_drd_=
config-v4-0-7b4e5dc96f81@cadence.com?part=3D2
