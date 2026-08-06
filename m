Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1E438911B
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 05:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785993190; cv=none; b=AvXlN2uVeyq4xVZu1s86rtLmLW0vBjK41Q6zUF6V6nJQp0KR4TUKB7rCYWipcRP26pZKI7qavtPhEjQTdw0GFJ359cBl77DK2c4ITzeECgdHYeOwcK9ZS4HZOer1u/UFd+rwB50EUGM5hQt78WfKN2drQYpCj2KGEJp6roM8USg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785993190; c=relaxed/simple;
	bh=hX2ArTgNsmUNyYIY803qaQALLJNdFLWHGkIX/hlHVtw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LlnmiuP+uXUl7hC2s+2ILtOIBxBkcb3mb3H0WQyofGopFUeILiASIO1Rftz700cTHAxIvJeU14YaKBLD0RKiLGZM7HhNTufSo39f5ePp/03GeIl0f4Yo5WZmVoq0ClhdDnoe9tum1bojoV3vGEEWqFfN6IsNAej65rIg9eUbfjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ss8h9rfo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ss8h9rfo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0167F1F000E9;
	Thu,  6 Aug 2026 05:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785993189;
	bh=ANuSI285WlBA5gQKWQ2tmcaLIzbBlHrG/+/amCAUFEo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ss8h9rfoMisFNEBIZICjJVD891Cd4yqLVJ9sb4WHxN8vHaTXv5340RI1OrbWZbyRL
	 qdQbirHJvtmxOpgLw03/9dGsueqdaWr8t4pbGKu9iTXOMipfab+x5Kjygr9nNf3SUs
	 Q0yACn0SrvQLHWoiCvb62dFwj4bD83YyirvY/KbxEV8colMLE8ID5htsY0CFyNRGY6
	 s/LFGU/+ZAxi9q2negRqiNYfKb+6rCXT3QXKlQX5plOebscLgJ3pmnfpuK72oxwVr8
	 kklB/1yWNvk6oZFZ3T2uDjq2UkQrsivoIIoLgCj4vBAJsKdF8vhr5ujmzLFUZOzLnw
	 +9Y8WcrbiLEUQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] usb: dwc3: dwc3-generic-plat: Add Renesas R-Car
 Gen5 DWC3 xHCI USB controller glue
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Vasut" <marek.vasut+renesas@mailbox.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, wsa+renesas@sang-engineering.com, conor+dt@kernel.org
In-Reply-To: <20260806050422.324435-2-marek.vasut+renesas@mailbox.org>
References: <20260806050422.324435-1-marek.vasut+renesas@mailbox.org>
 <20260806050422.324435-2-marek.vasut+renesas@mailbox.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 05:13:08 +0000
Message-Id: <20260806051309.0167F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The Renesas R-Car Gen5 glue register initialization performed duri=
ng probe is not restored during system or runtime resume, leading to silent=
 hardware state loss after a suspend cycle.
--

--- Patch [2]: [PATCH v2 2/2] usb: dwc3: dwc3-generic-plat: Add Renesas R-C=
ar Gen5 DWC3 xHCI USB controller glue ---
commit 211fb3fb7a52e528bcd297e2261a315030e4d2c9
Author: Thanh Quan <thanh.quan.xn@renesas.com>

usb: dwc3: dwc3-generic-plat: Add Renesas R-Car Gen5 DWC3 xHCI USB controll=
er glue

This commit extends the generic DWC3 platform driver to support the Renesas
R-Car Gen5 glue logic. It adds platform-specific initialization for the
glue registers based on the maximum speed property.

> diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3=
-generic-plat.c
> index ca69ac0eb07ce..518bb40d1372c 100644
> --- a/drivers/usb/dwc3/dwc3-generic-plat.c
> +++ b/drivers/usb/dwc3/dwc3-generic-plat.c

[ ... ]

> @@ -71,6 +71,52 @@ static int dwc3_eic7700_init(struct dwc3_generic *dwc3=
g)
>  	return 0;
>  }
> =20
> +static int dwc3_renesas_rcar_gen5_init(struct dwc3_generic *dwc3g)
> +{
> +	struct device *dev =3D dwc3g->dev;
> +	struct platform_device *pdev =3D to_platform_device(dev);
> +	const char *maximum_speed;
> +	bool use_usb3_flow;
> +	void __iomem *glue;
> +	int ret;
> +
> +	glue =3D devm_platform_ioremap_resource_byname(pdev, "glue");
> +	if (IS_ERR(glue))
> +		return PTR_ERR(glue);
> +
> +	ret =3D of_property_read_string(dev->of_node, "maximum-speed", &maximum=
_speed);
> +	if (ret)
> +		return dev_err_probe(dev, -ENODEV, "Failed to determine maximum speed\=
n");
> +
> +	use_usb3_flow =3D !strcmp(maximum_speed, "super-speed-plus") ||
> +			!strcmp(maximum_speed, "super-speed");
> +
> +	/*
> +	 * The datasheet describes initialization procedure without full
> +	 * information about the registers. Therefore, the source code is
> +	 * based on the bare metal code shared by the board team.
> +	 */
> +	writew(0x211, glue + 0x26);
> +
> +	/* USB3 does not need additional register programming. */
> +	if (use_usb3_flow)
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

[Severity: High]
Does this code lose the glue register state across power management suspend
and resume cycles?

Looking at dwc3_generic_resume() in the same file, the generic resume handl=
er
reenables clocks and calls dwc3_pm_resume(), but it lacks any mechanism to
invoke platform-specific glue re-initialization (such as a resume callback =
in
struct dwc3_generic_config).

Since these stateful MMIO registers are configured exactly once during
dwc3_renesas_rcar_gen5_init() and never restored upon resume, it seems the =
USB
controller glue registers will silently lose their state when the power dom=
ain
is cycled during system suspend or runtime PM suspend.

Will this cause USB functionality (especially the USB2 flow) to break upon
wake?

> +
> +	usleep_range(10000, 20000);
> +
> +	return 0;
> +}
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806050422.3244=
35-1-marek.vasut+renesas@mailbox.org?part=3D2
