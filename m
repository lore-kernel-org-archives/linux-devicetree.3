Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4906B3AD538
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 05:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778735292; cv=none; b=BXcixQZNEbVvW/KCMHAL0Jv2duUV7E4iwWVlunO1XjlnUR3vsyczaVTe2V5T200G69uYs/ztbIELoAh4XPtKpeRLTT29XrGRC9Q3nPGFj9Ggoyxpq/h/901sIW1J7Mx5CsyTn/WLBvbsVLoPNkplqLl+12gtrX7iGzsiHnKzKR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778735292; c=relaxed/simple;
	bh=N7NAEXacT6Fn0qwUrAG3+Y4bqTugY/h2rHjnJfVpLuw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sqWWatP34ttHKwNdZMA9239I/s3I0D6+sV0NZToJL9Imp0sDJgZXK6sHiPSpeww+57Pnw3tER5aenNOETc51IxDvCIgOfzE40eiBpY5zwTSNJwzJKxV0RaMV5Ir5fHj7T1jLTXIdzSG3eYr6ID0gCW+KqLhq1IPsu5robIDjbEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PYk/mIwL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PYk/mIwL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4D80C2BCB7;
	Thu, 14 May 2026 05:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778735291;
	bh=N7NAEXacT6Fn0qwUrAG3+Y4bqTugY/h2rHjnJfVpLuw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=PYk/mIwLYO3W9gywsFbHyCQuIXpsRz6XCA9/3jBSA0nzOKz0EG3Q5lWnRwTsWaLKe
	 XG1DdbtMxirVQfd3PgfX45o5uETLiRKhy2RJSjXQvb/qfKYRcotfgKj5O4ntFGPgkP
	 1+9gFJlfPEV1OlfSeoN5ZKXs1HFcmu3XiR69/i7tmumP+qolKl4XCwIXQlx3mmO7bf
	 rngRzJM/udj11WT5bgB2zGf77NPqLz7Ui+eL1yxUaUID6y2llq7cZJyib/61R8G3eb
	 +fh9j3jw54+v0iDyJH4RfMPnlonOJFEx/y9EYmFb/i3ThkNCI+kDfk8jrmfttyOll5
	 6r7n4efCdi1bw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/2] usb: cdnsp: Add support for device-only
 configuration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pawel Laszczak via B4 Relay" <devnull+pawell.cadence.com@kernel.org>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260513-b4-no_drd_config-v6-2-e7789cd0e581@cadence.com>
References: <20260513-b4-no_drd_config-v6-2-e7789cd0e581@cadence.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 05:08:10 +0000
Message-Id: <20260514050811.B4D80C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Uninitialized variable `ret` is returned from `cdns_drd_host_on` w=
hen `cdns->no_drd` is true.
- [High] Error path in `cdnsp_pci_probe()` conditionally frees a shared `wr=
ap` structure, leading to a use-after-free and double-free vulnerability.
- [High] Concurrent execution of `cdnsp_pci_probe()` for both PCI functions=
 causes a NULL pointer dereference due to lockless synchronization.
--

commit ced8f360cae2b8973233c3e0a1eebbd2eb3a4cc6
Author: Pawel Laszczak <pawell@cadence.com>

usb: cdnsp: Add support for device-only configuration

This commit introduces support for the Cadence USBSSP (cdnsp) controller
in hardware configurations where the Dual-Role Device (DRD) register
block is not implemented or inaccessible, forcing the driver to rely on
a fixed peripheral or host mode.

> diff --git a/drivers/usb/cdns3/cdnsp-pci.c b/drivers/usb/cdns3/cdnsp-pci.c
> index 432007cfe6954..feb9162298709 100644
> --- a/drivers/usb/cdns3/cdnsp-pci.c
> +++ b/drivers/usb/cdns3/cdnsp-pci.c
> @@ -93,7 +104,7 @@ static int cdnsp_pci_probe(struct pci_dev *pdev,
> =20
>  	pci_set_master(pdev);
> =20
> -	if (pci_is_enabled(func)) {
> +	if (func && pci_is_enabled(func)) {
>  		wrap =3D pci_get_drvdata(func);
>  	} else {
>  		wrap =3D kzalloc_obj(*wrap);

Is it possible for the Host and OTG PCI functions to be probed concurrently?

If the first thread observes pci_is_enabled(func) as true because the
second thread just enabled it, but the second thread hasn't yet reached
pci_set_drvdata() at the end of its probe, could pci_get_drvdata() return
NULL here?

This would cause a NULL pointer dereference when accessing wrap->dev_res
further down.

[ ... ]

> @@ -158,6 +182,7 @@ static int cdnsp_pci_probe(struct pci_dev *pdev,
>  		plat_info.dma_mask =3D pdev->dma_mask;
>  		plat_info.data =3D &pdata;
>  		plat_info.size_data =3D sizeof(pdata);
> +		plat_info.properties =3D wrap->prop;
>  		wrap->devfn =3D pdev->devfn;
>  		/* register platform device */
>  		wrap->plat_dev =3D platform_device_register_full(&plat_info);

If the second function (OTG) retrieves a shared wrap structure allocated by
the first function (Host), and platform_device_register_full() fails, the
error path will execute kfree(wrap).

Does this create a dangling pointer in the first function's drvdata, leading
to a use-after-free or double-free later when the first function is removed?

[ ... ]

> diff --git a/drivers/usb/cdns3/drd.c b/drivers/usb/cdns3/drd.c
> index 84fb38a5723a3..f87cf85cb97a1 100644
> --- a/drivers/usb/cdns3/drd.c
> +++ b/drivers/usb/cdns3/drd.c
> @@ -181,6 +184,9 @@ int cdns_drd_host_on(struct cdns *cdns)
>  	u32 val, ready_bit;
>  	int ret;
> =20
> +	if (cdns->no_drd)
> +		goto phy_set;
> +
>  	/* Enable host mode. */
>  	writel(OTGCMD_HOST_BUS_REQ | OTGCMD_OTG_DIS,

[ ... ]

> @@ -197,6 +203,7 @@ int cdns_drd_host_on(struct cdns *cdns)
>  	if (ret)
>  		dev_err(cdns->dev, "timeout waiting for xhci_ready\n");
> =20
> +phy_set:
>  	phy_set_mode(cdns->usb2_phy, PHY_MODE_USB_HOST);
>  	phy_set_mode(cdns->usb3_phy, PHY_MODE_USB_HOST);
>  	return ret;

When cdns->no_drd is true, execution jumps to the phy_set label, bypassing
the initialization of the local variable ret.

Could this return uninitialized stack memory and cause callers like
cdns_role_start() to see a spurious failure and unexpectedly abort the host
role startup?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513-b4-no_drd_=
config-v6-0-e7789cd0e581@cadence.com?part=3D2
