Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228ED3B95FF
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 09:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790241616; cv=none; b=AF/BsQZM/tR8jDDm1/7qYqLs+dHEiGJsQ+bL4Xg/GpAQi5DUVultr3ktcW8gaQubSoJdhPaMZfnGtoSKQzgqd2dtNALuNy62iqCO+Orfshjrof1GSirVeIQ14o+VPcbLmm7Zv6J595DimnBzmX/fCaBrUJQxGntozofzGuKpa3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790241616; c=relaxed/simple;
	bh=gXmO1V4lldzIiWbnSg0cFUWxzxzrT67bGtIc+1KMz+U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Zqto1qbyXRAiv9TZNb3/9zcDubF3ZZYH2T7mj91Da9yHe4cpWy9AzQvLLBYW0nfpm2FEernGe0aImjDNaRnLESDC5Pu2x7Q/vGkfHO8vB6pxtbBopoz+rIxY8d2H5/shWxn/iPjisiL+cj4ZYM6y/wpuZuSGGiKgPqofb03MjuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XOS7ddfd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XOS7ddfd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A9851F000FF;
	Thu, 24 Sep 2026 09:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790241614;
	bh=KSOlNrUCW/HHGq9448xZQlZ++yjIq8AB/M8zrvV9roU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XOS7ddfdnb1X0N1LZLejLcIVCOuDcQ59HFSsbVTYZ/tJlLpqHOywnqhTtvYFfZNOh
	 6ZJTPS2xPzxS6b4TJ2OTGjzrM1UYGhOOgmfnS+rDOsbHVLR7/f8mMcaX8q4AIfUVEX
	 6QmYNEJfBxrZGifS4LuabXtxGgMfoXgSYL9ph2ZScwhxrPUeVcNqhxemgTTC1dzT5b
	 XS65l5LrCFYuNmzgMRL1bbAzK8eRv1p8helXVJUR0ExLC2TG/BkewTMK1LY7+p4xn2
	 mDtDTNJ3GbaMEGE/O7V4khdqM44odfnG4alVypHJffGQk6F7xHhdWcDzPmOtk+rsWt
	 q4qPGZxveW/Eg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 7/7] ARM: tegra: lg-x3: Add backlight LED controller
 node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260924090608.28734-8-clamor95@gmail.com>
References: <20260924090608.28734-1-clamor95@gmail.com>
 <20260924090608.28734-8-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 09:20:14 +0000
Message-Id: <20260924092014.7A9851F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] drm: display probe deferral due to missing lm3533 DT support
- [Medium] mfd: lm3533: GPIO lookup failure due to mismatched property name
- [Low] dt-bindings: missing schemas for new compatible strings
--

commit 6d421d459ccd001174a12d39a40edbf6cba8d6fc
Author: Svyatoslav Ryhel <clamor95@gmail.com>

    ARM: tegra: lg-x3: Add backlight LED controller node
   =20
    Add node for TI LM3533 LED controller used in this device for panel
    backlight.

> diff --git a/arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts b/arch/arm/boot=
/dts/nvidia/tegra30-lg-p880.dts
> index f888987ce1340..3a5e66d869b1b 100644
> --- a/arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts
> +++ b/arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts
> @@ -155,6 +155,8 @@ panel@1 {
>  				vdd-supply =3D <&vcc_3v0_lcd>;
>  				vddio-supply =3D <&iovcc_1v8_lcd>;
> =20
> +				backlight =3D <&backlight>;

[Severity: High]
Does this cause the display panel to permanently defer probing?

When the lm3533 driver probes, it unconditionally calls dev_get_platdata()
and returns -EINVAL if pdata is missing:

drivers/mfd/lm3533-core.c:lm3533_device_init() {
    ...
	if (!pdata) {
		dev_err(lm3533->dev, "no platform data\n");
		return -EINVAL;
	}
    ...
}

Since the driver lacks Device Tree parsing logic entirely, the backlight
fails to probe, which causes the panel to return -EPROBE_DEFER indefinitely.

[ ... ]
> diff --git a/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi b/arch/arm/boot/=
dts/nvidia/tegra30-lg-x3.dtsi
> index c7ad3819c21d9..781cf38e9f183 100644
> --- a/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
> +++ b/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
> @@ -1170,6 +1170,30 @@ rmi4-f11@11 {
>  			};
>  		};
> =20
> +		led-controller@36 {
> +			compatible =3D "ti,lm3533";

[Severity: Low]
Are we missing Device Tree schemas for this new compatible string?

Adding a new compatible string without updating or creating Device Tree
bindings bypasses schema validation, leaving hardware variant capabilities
undocumented. Additionally, the imagis,isa1200 compatible string lacks
both a schema and kernel driver support.

> +			reg =3D <0x36>;
> +
> +			enable-gpios =3D <&gpio TEGRA_GPIO(N, 6) GPIO_ACTIVE_HIGH>;

[Severity: Medium]
Will this GPIO lookup fail due to a mismatched property name?

The driver requests the GPIO with a NULL connection ID:

drivers/mfd/lm3533-core.c:lm3533_device_init() {
    ...
	lm3533->hwen =3D devm_gpiod_get(lm3533->dev, NULL, GPIOD_OUT_LOW);
    ...
}

This causes gpiolib to strictly search for the base names gpios or
gpio, meaning it will receive -ENOENT instead of matching the provided
enable-gpios property.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924090608.2873=
4-1-clamor95@gmail.com?part=3D7
