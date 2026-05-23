Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28D81E1024
	for <devicetree@vger.kernel.org>; Sat, 23 May 2026 09:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779527825; cv=none; b=Cu3zZnhg9bKfzWRjYwQlVGieT3sf8flh2sPpzheUEGCm1xucLoQyW06HANhs5rIqx2ihyDEsdAMbeJHE9DzjTI4Z4jqKBCKxfeLX+yKkzLZB0xlbPFXf6U6vwHgeRbjgkfseZ2AENsy1Tjy/8pFag5MSCLxO8es06pyLdqZ+7MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779527825; c=relaxed/simple;
	bh=DyMejRNwWVIOhs+/epX+1iYUWjbNOwvI5BlY2sn0IJs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KMnJOzpE/ZzUn47JSamT+uaYLp9nylo4UKWiJWmRTj+8r7fgeSCpK43uoc5pGpDEPhjgx6cVgsbJXJsI2bFCqFAeVs1rvgEHARaWtibc8gdadWaojV/DsSnLTDN9vKQwXlJrtGPerajqTbAeANQXMRQeF210kfA58oCYwR7s66k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EgbMSKQj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EgbMSKQj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 039CA1F000E9;
	Sat, 23 May 2026 09:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779527824;
	bh=6vrseQqx30LnQhWOSpAixkXU4fcpjL9wWhUh2QFK6rY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EgbMSKQjhXmZ2sKp5Jm8aMHe9au05/5AmDlkVKjteftlNJYP3142Rj7uAI1pMPMpu
	 G83gNXpQcF3nZXsjnsQpdkem1sU+6WoC3mGMqc+vd9cTam+RixX0lWqoWdC3yTL310
	 /HmrJOa0/3wTYtOfv3DGh8MBgREUECcoGuDTYdDLPVis/T+h2uk1V29om4uzj4eHFb
	 vrk0pTd8T/I1Ruy3H8Kn5hGZ3+4PYjWv3KOlwct1Uji74T392ECMnbJ4bDb0WCaA+S
	 o8tf7OBYIGTTcY+JwLcngZPy7ZyIgs8fHHmnOGBlg45ho1c9Kyl4nq3Yy5WCK0+QfU
	 Ct9YwQRTja3CQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/4] usb: chipidea: tegra: Avoid controller/PHY init
 if bus is externally controlled
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260523083013.46372-4-clamor95@gmail.com>
References: <20260523083013.46372-4-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 23 May 2026 09:17:03 +0000
Message-Id: <20260523091704.039CA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Out-of-bounds I/O memory access in `tegra_ehci_hub_control()` due =
to unvalidated `wIndex`.
--

commit 60717c8d1b44f3d9bbb2d143c18add1a1d62f035
Author: Svyatoslav Ryhel <clamor95@gmail.com>

usb: chipidea: tegra: Avoid controller/PHY init if bus is externally contro=
lled

This commit skips the registration of the USB controller and PHY
initialization if they are externally controlled. Since the USB PHY
in Tegra controls clock gates required by the controller itself, it
defers this configuration to the device that controls the bus.

> diff --git a/drivers/usb/chipidea/ci_hdrc_tegra.c b/drivers/usb/chipidea/=
ci_hdrc_tegra.c
> index 372788f0f9701..a19cb3b33bf37 100644
> --- a/drivers/usb/chipidea/ci_hdrc_tegra.c
> +++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
[ ... ]
> @@ -342,12 +348,14 @@ static int tegra_usb_probe(struct platform_device *=
pdev)
>  	if (of_usb_get_phy_mode(pdev->dev.of_node) =3D=3D USBPHY_INTERFACE_MODE=
_ULPI)
>  		usb->data.flags &=3D ~CI_HDRC_SUPPORTS_RUNTIME_PM;
> =20
> -	usb->dev =3D ci_hdrc_add_device(&pdev->dev, pdev->resource,
> -				      pdev->num_resources, &usb->data);

[Severity: High]
This is a pre-existing issue, but does tegra_ehci_hub_control() have an
out-of-bounds I/O memory access?

When handling root hub control requests, the core USB code in
rh_call_control() passes the raw, user-supplied wIndex (e.g., from usbfs via
the USBDEVFS_CONTROL ioctl) to the HCD's hub_control callback.

In tegra_ehci_hub_control(), which is passed in the usb->data structure her=
e,
the pointer to the port status register is calculated without bounds checki=
ng
on wIndex:

status_reg =3D &ehci->regs->port_status[(wIndex & 0xff) - 1]

If wIndex & 0xff evaluates to 0, the calculation produces an index of -1
(pointing to the configured_flag register). If it is a large number like 25=
5,
it results in an index of 254, reading far past the port_status array which
has a size of HCS_N_PORTS_MAX (15).

Could sending a SetPortFeature request with wValue =3D USB_PORT_FEAT_RESET
and a crafted wIndex allow a user with access to the root hub device node to
force the driver to perform multiple reads and writes at arbitrary MMIO
offsets?

> +	if (!usb->externally_controlled) {
> +		usb->dev =3D ci_hdrc_add_device(&pdev->dev, pdev->resource,
> +					      pdev->num_resources, &usb->data);
> +		if (IS_ERR(usb->dev)) {
> +			err =3D dev_err_probe(&pdev->dev, PTR_ERR(usb->dev),
> +					    "failed to add HDRC device");
> +			goto phy_shutdown;
> +		}
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260523083013.4637=
2-1-clamor95@gmail.com?part=3D3
