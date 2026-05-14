Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B16314A98
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 17:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778781481; cv=none; b=ASrBYlamwgVg5b2/DpyFKfLVrndfhwWLJR4tOYFCxXm3Cr7JpIoXsmo/Dl7oZJoHu4EcjoSNQPkVflcOj4hMn1OvnfyKxshQzsW8ZUOfEEjh10dceArmNsRW8eI2VCUzVGuZABMv8eTKmoOuDyPxl/BpoFR1+sHtQztGKapJ8d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778781481; c=relaxed/simple;
	bh=tRApUe0zOAs7OSr5f08WxI0FSsnU0jJxGZ8C3hKI5hU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UvrrSQpoSpRwMoTB0HtZ+zrWD5CRFsVAbrBAExOx/F6lMVNTDiHwWyi4j+CXtQONdxvbm85VI5NyhQIdKWW4qGG1rtqUv9GFcQOOlFm+xHP8/cso0ydp+RRVgfq2q2UGij8Bt7f23fMtsAEDfFd7BRjzxO/3d44pdxhV/NkbN64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sC6Kfivc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sC6Kfivc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F4C4C2BCB3;
	Thu, 14 May 2026 17:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778781480;
	bh=tRApUe0zOAs7OSr5f08WxI0FSsnU0jJxGZ8C3hKI5hU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=sC6Kfivcjr3iE7IjNQlCwAYeoYkM4f9SIKlXl7+ovqxsrJxk2q9tz6XiMurCtmIn1
	 Uyny3dDmp/fAb0hMaYe08QIx+YKtOiKCmxYeHEtlYamUNF0S8guPrTAXQnno1IUtfZ
	 xOvb0/4S4WF0FsvGdjQGQmhTXz2+mgJMH2YdeoAX7bKD/X75cb8P11LSTBdryfZoNN
	 Z/cxKfRZWKDaKJcxpcMoFqTzIP0h6sP3ta97S3NF3tnbQsJS0IPS8ojH+3k2XR9Mg8
	 JKMt8Mpm79zFkOp/7Iajdy2gdVdGrSnYGh1fJyGqPGl8dVPZPVud1d9PLnrZJSD6i9
	 YP6cvm2QAzWyw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/2] usb: cdnsp: Add support for device-only
 configuration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pawel Laszczak via B4 Relay" <devnull+pawell.cadence.com@kernel.org>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260514-b4-no_drd_config-v7-2-18cc40e363fd@cadence.com>
References: <20260514-b4-no_drd_config-v7-2-18cc40e363fd@cadence.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 17:57:59 +0000
Message-Id: <20260514175800.5F4C4C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] An error in the second probed function's platform_device_register_=
full() frees the shared wrap structure, leaving a dangling pointer in the f=
irst function's drvdata.
- [High] Concurrent probing of multifunction PCI devices leads to a NULL po=
inter dereference in cdnsp_pci_probe() due to a TOCTOU race on pci_is_enabl=
ed().
- [High] Removing PCI function 0 before function 1 leaves the shared platfo=
rm device active while its underlying PCI resources are freed.
--

commit 720e53ba9595caee97ecf44de50fbb028048bc27
Author: Pawel Laszczak <pawell@cadence.com>

usb: cdnsp: Add support for device-only configuration

This commit introduces support for the Cadence USBSSP (cdnsp) controller in
hardware configurations where the Dual-Role Device (DRD) register block is
inaccessible. The driver is updated to operate exclusively in a fixed
peripheral/host mode for these configurations. It also modifies the BAR
indexing to accommodate the 32-bit addressing used in the DRD-disabled
hardware layout.

Closes: https://lore.kernel.org/oe-kbuild-all/202605141023.18vWXyw3-lkp@int=
el.com/

> diff --git a/drivers/usb/cdns3/cdnsp-pci.c b/drivers/usb/cdns3/cdnsp-pci.c
> index 432007cfe6954..7997af333307c 100644
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

This isn't a bug introduced by this patch, but can concurrent probing of
multifunction PCI devices lead to a NULL pointer dereference here?

If the PCI subsystem probes the two functions concurrently, both could call
pcim_enable_device() before checking the other's status. Since both are
enabled, pci_is_enabled(func) evaluates to true for both, and both
threads execute wrap =3D pci_get_drvdata(func).

Because neither thread has reached the end of the probe function to call
pci_set_drvdata(), drvdata would be NULL for both, causing a panic when
wrap->dev_res is unconditionally dereferenced below.

[ ... ]

> @@ -158,6 +182,7 @@ static int cdnsp_pci_probe(struct pci_dev *pdev,
>  		plat_info.dma_mask =3D pdev->dma_mask;
>  		plat_info.data =3D &pdata;
>  		plat_info.size_data =3D sizeof(pdata);
> +		plat_info.properties =3D wrap->prop;
>  		wrap->devfn =3D pdev->devfn;
>  		/* register platform device */
>  		wrap->plat_dev =3D platform_device_register_full(&plat_info);

This isn't a bug introduced by this patch, but if
platform_device_register_full() fails during the second function's probe,
the error path executes kfree(wrap).

Because wrap is still stored in the first function's drvdata via
pci_set_drvdata(), does this leave a dangling pointer?

When the first function is subsequently unbound, cdnsp_pci_remove()
retrieves this freed wrap and calls kfree(wrap) again, potentially leading
to a use-after-free or double free.

[ ... ]

> @@ -185,13 +210,17 @@ static void cdnsp_pci_remove(struct pci_dev *pdev)
>  	if (wrap->devfn =3D=3D pdev->devfn)
>  		platform_device_unregister(wrap->plat_dev);

This isn't a bug introduced by this patch, but could unbinding function 0
before function 1 leave the shared platform device active while its
underlying PCI resources are freed?

The platform device relies on memory-mapped BARs from both PCI function 0
and function 1. If a user unbinds function 0 first,
wrap->devfn =3D=3D pdev->devfn will be false (as wrap->devfn matches the la=
st
probed function, usually 1), skipping platform_device_unregister().

The PCI core then disables function 0 and unmaps its BARs, but the
platform driver remains active and continues to perform MMIO accesses to
the unmapped BARs, which could crash the system.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260514-b4-no_drd_=
config-v7-0-18cc40e363fd@cadence.com?part=3D2
