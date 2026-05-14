Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F4036897B
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 03:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778729269; cv=none; b=FMzxO3tLm/zzX2GKDzNDecctJf3XbrcDv1lCpDeanWwQVWBNjtpPVbEZncFNW4OIJQaDxUNcDgxPb4sB38FhTlYS6JVB1HmQ7fg2nCZtTpwgmra0Km7MIB8XQIGRaBQ+wc2Sx7RzW0NvDC5wxzT4nG14kUHlxyB0cKxKxFuwwGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778729269; c=relaxed/simple;
	bh=yzHWvzNTeKBwJzAj6zQvG6rgFpzBYQ6JZTuXukCubhI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=teg1xalQQ1DloCyHgyYQw7Ib6NgkZVETZAhj3GJ7NhzqaP6ytmFjHEbSoelHuTQFNj/v22D3HATKROfJfcwDtLNcequrIpWDzPMTcHR37TQkBelEAm+k8lCdraFLnvMPM35d5ypJF1lX00Rq8i6QiTrCBsyvsEI6pHBMUN9WM0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UWVqxyi3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UWVqxyi3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9578AC19425;
	Thu, 14 May 2026 03:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778729268;
	bh=yzHWvzNTeKBwJzAj6zQvG6rgFpzBYQ6JZTuXukCubhI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=UWVqxyi3h8Plq9CoiSavusKVbhT6hIrvDEUtgT0+3rFjpf4zNho6D/mxZo+tRbhJ4
	 GCRZAp0V2qTNO/6AIoz93lYmnsMS8KooxxhFgIOp2/7ITf07us80i4CqyCGWwh2Lmx
	 FQ+yRh+LOhOkuXIUF7wH9g/SOO+kgixzDqWr96A0fRBJnbll//H+eIkPomNuB9yqEL
	 ISod3tev90P1w8JOT2WbH6I/2t6M/LQAd8MfHFG4tZxZonLp1slWkBP1C4UvQp2Psw
	 2isAvo8/JJXKHkHmJ8mO/d+VoWQmyOpsV8xj7NBXDc0kTiEl5214A6muiy1Y8iLiY3
	 3mygB8dwR1JOA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/2] usb: cdnsp: Add support for device-only
 configuration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pawel Laszczak via B4 Relay" <devnull+pawell.cadence.com@kernel.org>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260513-b4-no_drd_config-v5-2-1c633a4b9a29@cadence.com>
References: <20260513-b4-no_drd_config-v5-2-1c633a4b9a29@cadence.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 03:27:48 +0000
Message-Id: <20260514032748.9578AC19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Uninitialized variable `ret` is returned in `cdns_drd_host_on()` w=
hen `cdns->no_drd` is true.
- [High] In `cdnsp_pci_probe()`, a failed `platform_device_register_full()`=
 leads to a Use-After-Free and potential Double Free via a dangling pointer=
 in the sibling PCI device's `drvdata`.
--

commit 3bccaf516e61eb4462bbd76ec7e121917dbcc00b
Author: Pawel Laszczak <pawell@cadence.com>
usb: cdnsp: Add support for device-only configuration

This patch introduces support for the Cadence USBSSP controller in hardware
configurations where the Dual-Role Device (DRD) register block is not
implemented. In these configurations, the driver operates exclusively in a
fixed mode and uses 32-bit addressing instead of 64-bit addressing.

> diff --git a/drivers/usb/cdns3/cdnsp-pci.c b/drivers/usb/cdns3/cdnsp-pci.c
> --- a/drivers/usb/cdns3/cdnsp-pci.c
> +++ b/drivers/usb/cdns3/cdnsp-pci.c
[ ... ]
> @@ -158,6 +182,7 @@ static int cdnsp_pci_probe(struct pci_dev *pdev,
>  		plat_info.dma_mask =3D pdev->dma_mask;
>  		plat_info.data =3D &pdata;
>  		plat_info.size_data =3D sizeof(pdata);
> +		plat_info.properties =3D wrap->prop;
>  		wrap->devfn =3D pdev->devfn;
>  		/* register platform device */
>  		wrap->plat_dev =3D platform_device_register_full(&plat_info);

This is an existing issue in the code modified here, but if
platform_device_register_full() fails just below this hunk:

        wrap->plat_dev =3D platform_device_register_full(&plat_info);
        if (IS_ERR(wrap->plat_dev)) {
                ret =3D PTR_ERR(wrap->plat_dev);
                kfree(wrap);
                goto put_pci;
        }

When the second PCI function is probed and pci_is_enabled(func) is true,
wrap is retrieved from the first function's drvdata. Does calling kfree(wra=
p)
in this error path leave a dangling pointer in the first device's drvdata?
If so, could this lead to a use-after-free and a double free later when
cdnsp_pci_remove() is called?

> diff --git a/drivers/usb/cdns3/drd.c b/drivers/usb/cdns3/drd.c
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

When cdns->no_drd is true, this jumps to phy_set, bypassing the assignment
to ret. Since ret is declared without initialization, could returning it at
the end of the function propagate a non-zero garbage value? This might cause
spurious host mode initialization failures.

>  	/* Enable host mode. */
>  	writel(OTGCMD_HOST_BUS_REQ | OTGCMD_OTG_DIS,
>  	       &cdns->otg_regs->cmd);
[ ... ]
> @@ -197,6 +203,7 @@ int cdns_drd_host_on(struct cdns *cdns)
>  	if (ret)
>  		dev_err(cdns->dev, "timeout waiting for xhci_ready\n");
> =20
> +phy_set:
>  	phy_set_mode(cdns->usb2_phy, PHY_MODE_USB_HOST);
>  	phy_set_mode(cdns->usb3_phy, PHY_MODE_USB_HOST);
>  	return ret;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513-b4-no_drd_=
config-v5-0-1c633a4b9a29@cadence.com?part=3D2
