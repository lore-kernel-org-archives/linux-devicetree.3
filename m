Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521C348AE21
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778846077; cv=none; b=p/EqpoMFudfVEZJP7dSl4OOzO+XqigXQ/lMVg7XOx1C5aI6rf/eIsUnPKVrcZEvBhAqKYOKJb/RJ9J9vDNoevCFrq+lG4cW63UQt/aBvRhDBvyXAjvxcHpHI/aehYICG6+QmOndIUOe3RpgPaNv6VV9c87fLImT9ZuNNZ6QlH0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778846077; c=relaxed/simple;
	bh=RulHm11K1INEe3Avumhc0LeHtX2JGhd/S72JsSzLsF0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pD73CYE9ikrOPgG60DtrRqwL8S5l55Ibag3qBcI9s7DzF+dFHe4aEzi8KIvvXKdLZhhabDFhgQB1AO00WDINBPZQFax9ZR7RkBVQQ82urwpbhGn3ihWDsZcDPjFln5SrWq/uWQ1dwQIM/4aB3qTPplL0UfFtgPSsy7xKXZdnLFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FSinmiSl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FSinmiSl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1F9DC2BCB0;
	Fri, 15 May 2026 11:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778846077;
	bh=RulHm11K1INEe3Avumhc0LeHtX2JGhd/S72JsSzLsF0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=FSinmiSli4KBSIWJe9B0exlKcgfukYhLWk5NOTBy9+odz/a6i2jvcKCk2keOmul5W
	 UnPiKP4qFYJlVVrnHlXMC1w/llK8IGcr9D0GxJFKNfEMNeJQlu6X8z4NzHDlJqCCeA
	 ixj47RG0lpbxeph160KhMXomIFn+x7gqSQvnLCN/+rFEg5wbQlr4BvPx3PFcLU2m2X
	 vH/9+E7FKU1nDRrAUVgl8C4snLWpjH5r3Z5Q2+4F0kfIAo4tEHXW1D85PETiON9AE9
	 b5fUsWbXvvnCAs2Ly14mHTEddcvb/dXoMPndq6RFfHAMLLh7DZpeP7r+Ojjhvsgp/W
	 bmLtfKcAJe87g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 2/2] usb: cdnsp: Add support for device-only
 configuration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pawel Laszczak via B4 Relay" <devnull+pawell.cadence.com@kernel.org>
Cc: krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260515-b4-no_drd_config-v8-2-75cb05317679@cadence.com>
References: <20260515-b4-no_drd_config-v8-2-75cb05317679@cadence.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 11:54:36 +0000
Message-Id: <20260515115436.C1F9DC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Critical] In `cdnsp_pci_probe()`, the error path unconditionally frees t=
he shared `wrap` structure if `platform_device_register_full()` fails, caus=
ing a use-after-free and double-free vulnerability.
--

commit 4dafbda57ec59e424fb1db39575dac6fe3174dd5
Author: Pawel Laszczak <pawell@cadence.com>

usb: cdnsp: Add support for device-only configuration

This patch introduces support for the Cadence USBSSP (cdnsp) controller in
hardware configurations where the Dual-Role Device (DRD) register block is
not implemented or is inaccessible.

Closes: https://lore.kernel.org/oe-kbuild-all/202605141023.18vWXyw3-lkp@int=
el.com/

> diff --git a/drivers/usb/cdns3/cdnsp-pci.c b/drivers/usb/cdns3/cdnsp-pci.c
> index 432007cfe6954..1a71dee5044cc 100644
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

[ ... ]

> @@ -158,6 +183,7 @@ static int cdnsp_pci_probe(struct pci_dev *pdev,
>  		plat_info.dma_mask =3D pdev->dma_mask;
>  		plat_info.data =3D &pdata;
>  		plat_info.size_data =3D sizeof(pdata);
> +		plat_info.properties =3D wrap->prop;
>  		wrap->devfn =3D pdev->devfn;
>  		/* register platform device */
>  		wrap->plat_dev =3D platform_device_register_full(&plat_info);

This might be a pre-existing issue rather than a new regression, but is the=
re
a use-after-free risk in the error handling immediately following this
platform device registration?

If probing a dual-function device, the first PCI function allocates the
shared wrap structure, stores it in its drvdata, and completes its probe.
When the second PCI function probes, it retrieves the shared wrap from the
first function and calls platform_device_register_full().

If that registration fails:

    wrap->plat_dev =3D platform_device_register_full(&plat_info);
    if (IS_ERR(wrap->plat_dev)) {
        ret =3D PTR_ERR(wrap->plat_dev);
        kfree(wrap);
        goto put_pci;
    }

Does the unconditional kfree(wrap) here free the memory that the first PCI
function's drvdata still points to?

If so, when the first function is later unbound, cdnsp_pci_remove() might
retrieve the dangling wrap pointer and eventually call kfree(wrap) again,
causing a double-free. Should the error path only free wrap if it was
allocated exclusively during the current probe execution?

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

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515-b4-no_drd_=
config-v8-0-75cb05317679@cadence.com?part=3D2
