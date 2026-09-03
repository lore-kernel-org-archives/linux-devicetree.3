Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F219378813
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 21:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788471555; cv=none; b=Bo/uUT/6sHq4R9JYEuHabmhruKmX/KPfQA1KAe86WT0D2HmbB9t/sUPVh0X+K87e9oesVcmbeKgGDX1G9c9wTHBd5jLJsGY7kPUaUoO3s3OxKXSep65mrGEIubFbWXwBz8EVyumRbBFE+97WeqDltO6LsswRX8FCyD4k+lO/7sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788471555; c=relaxed/simple;
	bh=svzg4kXMMc8rAk2JTsnr5FNoWL0BTi7e7K95Xf5osNU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=m+Q1c0hIVJOHVSZ5elG5KmDd7tO03w2BkcXGDV8tqPR0mvjZ+jOx8YPEbiu3w1tdTlj7Rm6eHIR5sH1z8dGbHj02Jgle3hC8YCSEdu+aMdhGGVNx6xzmGVjn/3LcT6wjZEI3J73SrtPs6IyQTuOXBfUsKHDAw8xiI2IXdLmq1rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NkhNOFJ9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NkhNOFJ9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 908A71F000E9;
	Thu,  3 Sep 2026 21:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788471553;
	bh=btoz8h9X3jIkwrLD3z9P0zG7urg8BQfWnyIT6u4KDxw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NkhNOFJ9DNmgHCHFS2PNc2QM2ZPKzN1jhDvk11AfB4rEHF6vpoIMDz5nf+q01qCon
	 ddh2ezQljZyeL/m4Sthnr8xw/S4xx5T2CEuGKC0pAYGbUYWq9vTaZURDDyYJKXxdSf
	 Acv+U4fJu2uXfAEJXIHpb4BLE1k7eQwaTr2kH3wo+gaSzl4q89Z5qV/W47T1uYUmpL
	 00yxdpR5FY6ylVwfHvNVJuSXpMnFyOvylubmUs7o+h5sd+ZYy56yqej3kTPw4J17in
	 g+TFdfwvZaio8274RzOE81IH7SBztfLh9988gKsMBcneeA5b1xw0tbA4j46keDMr8R
	 80a3diEmL0RMA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/2] usb: dwc3: dwc3-generic-plat: Add Renesas R-Car
 Gen5 DWC3 xHCI USB controller glue
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Vasut" <marek.vasut+renesas@mailbox.org>
Cc: wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260903213031.314473-2-marek.vasut+renesas@mailbox.org>
References: <20260903213031.314473-1-marek.vasut+renesas@mailbox.org>
 <20260903213031.314473-2-marek.vasut+renesas@mailbox.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 21:39:13 +0000
Message-Id: <20260903213913.908A71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] R-Car Gen5 platform-specific glue logic registers lose their state=
 across system suspend/resume cycles, permanently breaking the USB controll=
er upon wake.
--

commit 3972c6a9582e00349a3238f262e250712caa62f9
Author: Thanh Quan <thanh.quan.xn@renesas.com>

usb: dwc3: dwc3-generic-plat: Add Renesas R-Car Gen5 DWC3 xHCI USB controll=
er glue

The Renesas R-Car Gen5 SoC contains multiple instances of DWC3 USB controll=
er
with glue logic wrapper around them. Extend the generic DWC3 platform driver
with Renesas R-Car Gen5 glue logic specifics.

> diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3=
-generic-plat.c
> index ca69ac0eb07ce..32497ab6f065e 100644
> --- a/drivers/usb/dwc3/dwc3-generic-plat.c
> +++ b/drivers/usb/dwc3/dwc3-generic-plat.c

[ ... ]

> @@ -71,6 +71,51 @@ static int dwc3_eic7700_init(struct dwc3_generic *dwc3=
g)
>  	return 0;
>  }
> =20
> +static int dwc3_renesas_rcar_gen5_init(struct dwc3_generic *dwc3g)
> +{
> +	struct device *dev =3D dwc3g->dev;
> +	struct platform_device *pdev =3D to_platform_device(dev);
> +	enum usb_device_speed speed =3D usb_get_maximum_speed(dev);
> +	bool usb2only =3D false;
> +	void __iomem *glue;
> +
> +	/* No USB 3 PHY in DT means this is surely USB 2 controller */
> +	if (device_property_match_string(dev, "phy-names", "usb3-phy") < 0)
> +		usb2only =3D true;
> +
> +	if (speed >=3D USB_SPEED_LOW && speed <=3D USB_SPEED_HIGH)
> +		usb2only =3D true;
> +
> +	glue =3D devm_platform_ioremap_resource_byname(pdev, "glue");
> +	if (IS_ERR(glue))
> +		return PTR_ERR(glue);
> +
> +	/*
> +	 * The datasheet describes initialization procedure without full
> +	 * information about the registers. Therefore, the source code is
> +	 * based on the bare metal code shared by the board team.
> +	 */
> +	writew(0x211, glue + 0x26);

[Severity: High]
Does this setup break across system suspend/resume cycles?

Since the 'glue' pointer is instantiated as a local variable and discarded
after this initialization function returns, how are these hardware registers
restored when the controller's power domain is turned off during a
suspend-to-RAM (S3) or deep sleep cycle?

Looking at dwc3_generic_resume(), it restores the DWC3 core but doesn't seem
to have a configuration callback to re-initialize the platform-specific glue
wrapper. Even if there were a resume callback, it wouldn't be able to access
the remapped 'glue' __iomem pointer.

Will this cause the USB controller to become permanently non-functional aft=
er
system resume?

> +
> +	/* USB2 does need additional register programming. */
> +	if (!usb2only)
> +		return 0;
> +
> +	writew(0x11, glue + 0x81c);
> +	writew(0x0, glue + 0x81a);
> +	writew(0x1, glue + 0x802);
> +
> +	usleep_range(10000, 20000);
> +
> +	writew(0x0, glue + 0x802);
> +	writew(0x1, glue + 0x2a);
> +	writew(0x1, glue + 0x81a);
> +
> +	usleep_range(10000, 20000);
> +
> +	return 0;
> +}
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903213031.3144=
73-1-marek.vasut+renesas@mailbox.org?part=3D2
