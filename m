Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D1886341
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 18:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787941848; cv=none; b=lT2TIzFoqDidyoxbYFl/FbEKIuxkHOQbdfPkTQtN6D1sc/4DV6wV2xqM31DAztXk6iV8QLanmE8aBrDe+w933VE20e1tWAkESaYhCtJsEplCE8dYI0GESV0TS2hTZJ5CtLQ93oCyrtX2bRvus66WGU1I3UvWm7GcVQYhS7bLVUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787941848; c=relaxed/simple;
	bh=fze3uLU12hndJQorvlUfwA8Q6Iw+CJ0Gl4e1BfqxrXk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NtsXapyqLlCVtik1NASmM7VBPU1f/oCfZ1St7i+DMfVVNncIyB07lu3ydJ3kX5GXuLd/pCI010NRlZY45y5YByuKOklclspwHlYANH/RJBx0LXNywEjyHwdZylSnj6uFYJuO63qaeKi7ZNZ5UNWjvM/6RFuOK+vWG3eOLQ9i6F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gR6ftBap; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gR6ftBap"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86F731F000E9;
	Fri, 28 Aug 2026 18:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787941846;
	bh=j5OPm8gFCpVReX6anUl+3bJqWiqqj6AU2Mnt6snIxjg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gR6ftBapf7SM4J+bA7N0bSXiC3b2bN+6GGyiLuthdBbSCUkADJTWnbyz+y2CEWqTz
	 6Sz33wfbNTJhrCBHB4g+/0WjZi268m2Mk5Hryx3kYkPmCmYXoawTYwjMdJURxJNxh5
	 DHHH9VD0BQeEoyAJsqMF8kUVeFkOLFYdQXG1sidrNP4tvc89LKLTiAjqZJXp3ouqMJ
	 JHSLnnoN4IHN278pfAE9EXWdG5L0lbL7Cd/1Pg4QvQeyJmYIlZ8p2QUMb1jKwwdY4x
	 BbOh2C/S9K5je2LUf0Qsn5QKBVbdneAJSScMsUiF9n/rDU9wi0Xpvc3y2GlU16k/u2
	 OU28CvsexEaDA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/2] usb: dwc3: dwc3-generic-plat: Add Renesas R-Car
 Gen5 DWC3 xHCI USB controller glue
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Vasut" <marek.vasut+renesas@mailbox.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20260828182415.388367-2-marek.vasut+renesas@mailbox.org>
References: <20260828182415.388367-1-marek.vasut+renesas@mailbox.org>
 <20260828182415.388367-2-marek.vasut+renesas@mailbox.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 28 Aug 2026 18:30:46 +0000
Message-Id: <20260828183046.86F731F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing 'maximum-speed' DT property incorrectly forces the control=
ler into USB 2.0-only mode, overriding PHY-based detection.
--

commit 0727bb2cc9c155e4d5497db94c337bc5b2603464
Author: Thanh Quan <thanh.quan.xn@renesas.com>
usb: dwc3: dwc3-generic-plat: Add Renesas R-Car Gen5 DWC3 xHCI USB controll=
er glue

This commit extends the generic DWC3 platform driver with glue logic for
Renesas R-Car Gen5 USB controllers. It handles hardware initialization and
evaluates PHY presence alongside device tree properties to determine maximum
supported USB speeds.

> diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3=
-generic-plat.c
> index ca69ac0eb07ce..3994a6d93b9de 100644
> --- a/drivers/usb/dwc3/dwc3-generic-plat.c
> +++ b/drivers/usb/dwc3/dwc3-generic-plat.c
[ ... ]
> @@ -71,6 +71,55 @@ static int dwc3_eic7700_init(struct dwc3_generic *dwc3=
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
> +	/* Wireless USB is not supported */
> +	if (speed =3D=3D USB_SPEED_WIRELESS)
> +		return dev_err_probe(dev, -EINVAL, "Wireless USB not supported\n");
> +
> +	/* No USB 3 PHY in DT means this is surely USB 2 controller */
> +	if (device_property_match_string(dev, "phy-names", "usb3-phy") < 0)
> +		usb2only =3D true;
> +
> +	if (speed <=3D USB_SPEED_HIGH)
> +		usb2only =3D true;

[Severity: High]
Will this condition inadvertently force the controller into USB 2.0 mode wh=
en
the maximum-speed property is missing from the device tree?

When the maximum-speed property is absent, usb_get_maximum_speed() returns
USB_SPEED_UNKNOWN, which evaluates to 0. Since 0 is less than USB_SPEED_HIG=
H,
this condition evaluates to true and unconditionally sets usb2only to true.

This appears to override the preceding logic that correctly checked the
phy-names property to detect USB 3 capabilities. Could this cause hardware
with a USB 3 PHY to be improperly downgraded to USB 2.0 mode?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260828182415.3883=
67-1-marek.vasut+renesas@mailbox.org?part=3D2
