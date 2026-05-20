Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB61533B97D
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 19:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779304614; cv=none; b=UjYX+LPqtWrXvAjPYep1ZFlhT26iZ/8A+I/arOlJ44RM+YuaPlgKEtrzz44Yui5pwiMjLB1B3EmChdDAJVTLiXe9A2qGqBDd5FJJX6aMLOzv3Gglmo4ZpO9sNCAi5oIdBlLdXIELwQeeglMFeIE4Ke+b3SjeMbPEOUHwe9jZzDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779304614; c=relaxed/simple;
	bh=YzmybcpxXpY+MBkfwGDWXSLBUDrl1pFXZKFToXfK2vo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tfShojkj4ixVHj8Jweht2q4/c1/rtILiaaIdnH9qKGVZg+vlMsp3TqKEdqanYse3k+lf69lsVOccEWDUecmQoLMIcVvXsjR34Ibp24gjaUj6xoCLQx1g17T5XiNw3EOytaUD40jVBK31qtc/DrA7JZnGBNXG23D72B6lVVzeZWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gpBUS93F; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gpBUS93F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2227B1F000E9;
	Wed, 20 May 2026 19:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779304612;
	bh=ZufmQbkp+l9Qe756vPAdTNkGrC4zMSgQy6UsHl4hI3c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gpBUS93FfJTCYs9Kqmu0q1JoXhXorpTqLS+HHTvgdtGtB/XdtWeVKG82prixZrfP1
	 UlleZwJP+OQV/xoJn2nEPJtWokp7p7mZrfMqJI4/nSRiG7UbZpJ/QRaRmIyP+9xQ3Q
	 lI56/ijMc7Jzks8kPdwoJ0yN3ZfOhuE5L5JgJMeVMwIgtgbR+w0wcMJNRx4dOOQSPH
	 gGPVW0/YEjzFSTDvTA9YySihjhwPWeENHIs41Og7OS3jqel8sVyT9FNnQzj/HzbplO
	 kiDrQ//2y9zlz+rPQ4qB6C3tznMHdsQjAH4vkdMezu8FIFXr9HVNGFXorTM81IOH16
	 5v+fWBYgBVg/w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 4/6] phy: realtek: usb2: introduce reset controller
 struct
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rustam Adilov" <adilov@disroot.org>
Cc: olteanv@gmail.com, neil.armstrong@linaro.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, vkoul@kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260520175728.720877-5-adilov@disroot.org>
References: <20260520175728.720877-5-adilov@disroot.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 May 2026 19:16:51 +0000
Message-Id: <20260520191652.2227B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [High] The driver attempts to access the PHY's memory-mapped registers in=
 `probe()` before the newly introduced reset control is deasserted.

Pre-existing issues:
- [Critical] An off-by-one error in `rtk_phy_toggle` allows out-of-bounds a=
ccess to the `phy_parameter` array.
- [High] The loop in `rtk_phy_init()` silently ignores initialization error=
s from all but the last PHY.
- [High] Pointer arithmetic on `void __iomem *` leads to unaligned I/O acce=
ss and duplicated memory mappings.
- [High] Per-port PHY properties are parsed in a loop and written directly =
into the globally shared `rtk_phy->phy_cfg` array, overwriting settings fro=
m earlier ports.
--

commit adbf8b08353248c649e3e87e6816cbc9f57abfab
Author: Rustam Adilov <adilov@disroot.org>

phy: realtek: usb2: introduce reset controller struct

In RTL9607C, there is an IP Enable Controller which acts like a
reset controller. This introduces a reset_control struct to handle
deasserting the usb2 phy reset line using the reset framework.

> diff --git a/drivers/phy/realtek/phy-rtk-usb2.c b/drivers/phy/realtek/phy=
-rtk-usb2.c
> index a9e29d2f7e6fd..16c5fc3191dec 100644
> --- a/drivers/phy/realtek/phy-rtk-usb2.c
> +++ b/drivers/phy/realtek/phy-rtk-usb2.c

[ ... ]

> @@ -676,6 +678,15 @@ static int rtk_phy_init(struct phy *phy)
>  	if (!rtk_phy)
>  		return -EINVAL;
> =20
> +	if (rtk_phy->phy_rst) {
> +		ret =3D reset_control_deassert(rtk_phy->phy_rst);
> +
> +		if (ret)
> +			return ret;
> +
> +		usleep_range(5000, 6000);
> +	}
> +
>  	for (i =3D 0; i < rtk_phy->num_phy; i++)
>  		ret =3D do_rtk_phy_init(rtk_phy, i);

[Severity: High]
This is a pre-existing issue, but does this loop silently ignore
initialization errors from all but the last PHY?

If an error occurs on any PHY other than the last one, the ret variable
is overwritten by the result of the subsequent iteration. Could this
falsely return success even if earlier ports failed to initialize?

[Severity: Critical]
This is a pre-existing issue, but is there an out-of-bounds access
in the toggle function called during initialization?

When do_rtk_phy_init() calls the toggle function for a given index, the
target function checks if index > rtk_phy->num_phy instead of
index >=3D rtk_phy->num_phy. Since the phy_parameter array is allocated
with rtk_phy->num_phy elements, could passing index =3D=3D num_phy bypass
the bounds check and lead to memory corruption or arbitrary memory
access via I/O operations?

[ ... ]

> @@ -1059,6 +1070,11 @@ static int rtk_usb2phy_probe(struct platform_devic=
e *pdev)
> =20
>  	rtk_phy->num_phy =3D phy_cfg->num_phy;
> =20
> +	rtk_phy->phy_rst =3D devm_reset_control_array_get_optional_exclusive(de=
v);
> +	if (IS_ERR(rtk_phy->phy_rst))
> +		return dev_err_probe(dev, PTR_ERR(rtk_phy->phy_rst),
> +				     "usb2 phy resets are not working\n");
> +
>  	ret =3D parse_phy_data(rtk_phy);

[Severity: High]
Does parse_phy_data() attempt to access the PHY's memory-mapped registers
before the newly introduced reset control is deasserted?

It appears that the driver acquires the reset in probe() and then
immediately calls parse_phy_data(), which executes hardware read/write
operations via update_dc_driving_level() and update_hs_clk_select().

Because the reset is only deasserted later in rtk_phy_init(), could
accessing registers of an IP block held in reset trigger a synchronous
bus error or silently return zeroes, preventing proper initialization?

[Severity: High]
This is a pre-existing issue, but does pointer arithmetic on void __iomem *
lead to unaligned I/O access and duplicated memory mappings in
parse_phy_data()?

Looking at the loop in parse_phy_data():

	for (index =3D 0; index < rtk_phy->num_phy; index++) {
		...
		phy_parameter->phy_reg.reg_gusb2phyacc0 =3D of_iomap(np, 1) + index;
		...
	}

Since of_iomap() returns a void __iomem *, does adding index advance the
pointer by exactly 1 byte? Could this result in an unaligned pointer for
subsequent 32-bit readl() or writel() operations and trigger an alignment
fault?

Also, does calling of_iomap() repeatedly inside the loop create redundant,
duplicate mappings of the exact same physical resource?

[Severity: High]
This is a pre-existing issue, but are per-port PHY properties parsed in a
loop and written directly into the globally shared rtk_phy->phy_cfg array,
overwriting settings from earlier ports?

In parse_phy_data(), the driver iterates over all PHY ports and retrieves
port-specific parameters. Functions like update_dc_driving_level() modify
the globally shared array.

Will properties computed for port 1 silently overwrite those computed
for port 0? When rtk_phy_init() is later called, do_rtk_phy_init() applies
this globally shared array to all ports, which seems like it might break
per-port configurations for any SoC with num_phy > 1.

>  	if (ret)
>  		goto err;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260520175728.7208=
77-1-adilov@disroot.org?part=3D4
