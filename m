Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147C91F5821
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 09:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787219771; cv=none; b=MAm7EAK+lWbgr6JI85bsrjFAvScaI3stDGGR5KngOtE1GAFpVfebNirLwSPSmq8gZ7GdLdkYojfbZUTUA+6w9Qcq3GZiu9p17dYZ3XcqJmcqBXjo5dUzioTUS/jhEDCVGuP+pUxS1osZf027HKOZzL1DHCpiOp4dlpNKarWzQgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787219771; c=relaxed/simple;
	bh=FyFhc2rTzcunigOy7FNFdlTeJSqAvfIjWvfcYQfQdvw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rmpzKIYUh2Z5O9OXUAxJRagCF/xhoGXnJdxpJVtVQrubNo0ZNvJD7J0wbfRMp4kZLB1OeAMQrQdBP3bNn0hsV59aGvG6W6kNhbLkueJQaZyB7SjlmUtfAmzZpMI63dyVoGsxj8/yonyAr6TkoUxS/J1SPOycqTvv1nZoUOQ9CJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RFeGZEii; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RFeGZEii"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CF7B1F000E9;
	Thu, 20 Aug 2026 09:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787219769;
	bh=6CkWZuXIdOiWJUTuQOsXqvBnst21KR1ar/SX/dUsxJI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RFeGZEiiWoi9z/bwbwGpY9iT/1yg9mpAG9DeZvNIMIAMQlVf2hbdt+RA7Rj2SGLHk
	 kATWhowPsLwIflRPWPue19NEmz3OKt7xRTgGwqurIg/ZxjDNy5q6nztlvRr7M6c/Z6
	 WkuB27a04GbHMtVKzsHIavAq3pP86XTNcrQh6DdYO9a3Aqkxda1TxWmXksR4bxcaFJ
	 YUf/unVgGtipL9smYoAo4mGgN5VkLUMqKGVsXzVES3MbjjA12VQkG1/ZuY3KgZx4AA
	 +wdmd2orSCptqFeHsm2D9RhzN6L1KGneTHo/jlbxMsnGxDa7KCAplfZKkyjr48JSzR
	 ui1eL5fd1xddA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/7] arm64: dts: qcom: Add Motorola One
Reply-To: sashiko-reviews@lists.linux.dev
To: "Adam Skladowski" <a39.skl@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260820-next-patches-v2-3-7130d68183d9@gmail.com>
References: <20260820-next-patches-v2-0-7130d68183d9@gmail.com>
 <20260820-next-patches-v2-3-7130d68183d9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 09:56:09 +0000
Message-Id: <20260820095609.9CF7B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Touchscreen `reset-gpios` logic is inverted, which will hold the c=
ontroller in reset during operation.
- [Medium] The touchscreen node is disabled, contradicting the commit messa=
ge claim of supported functionality.
- [Low] The `usb-role-switch` property in the `fcs,fusb302` node is a DT sc=
hema violation and misdirected.
--

--- Patch [3]: [PATCH v2 3/7] arm64: dts: qcom: Add Motorola One ---
commit a01f938ee143a61f1aad41106fd89f197d7a249a
Author: Adam Skladowski <a39.skl@gmail.com>

arm64: dts: qcom: Add Motorola One

This commit adds a devicetree for the Motorola One smartphone based on the
Jacala/MSM8953 SoC. It introduces support for basic functionality including
I2C peripherals, physical buttons, regulators, remoteprocs, and USB.

> diff --git a/arch/arm64/boot/dts/qcom/msm8953-motorola-deen.dts b/arch/ar=
m64/boot/dts/qcom/msm8953-motorola-deen.dts
> new file mode 100644
> index 0000000000000..acb0b61b8f947
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/msm8953-motorola-deen.dts

[ ... ]

> +&i2c_1 {
> +	status =3D "okay";
> +
> +	typec-portc@22 {
> +		compatible =3D "fcs,fusb302";
> +		reg =3D <0x22>;
> +		interrupts-extended =3D <&tlmm 9 IRQ_TYPE_LEVEL_LOW>;
> +
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&fusb302_int_default>;
> +
> +		usb-role-switch =3D <&usb3>;

[Severity: Low]
Does this property violate the fcs,fusb302 device tree schema? The binding
strictly disallows additional properties like usb-role-switch.

Also, should this point to the DWC3 core node (&usb3_dwc3) instead of the
wrapper node (&usb3) where the role switch is actually registered?

> +		vbus-supply =3D <&fusb302_vbus>;

[ ... ]

> +&i2c_3 {
> +	status =3D "okay";
> +
> +	touchscreen@62 {
> +		compatible =3D "novatek,nt36672a-ts";
> +		reg =3D <0x62>;
> +		interrupts-extended =3D <&tlmm 65 IRQ_TYPE_EDGE_RISING>;
> +
> +		reset-gpios =3D <&tlmm 64 GPIO_ACTIVE_HIGH>;

[Severity: High]
Will this hold the touchscreen controller in reset during operation?

During driver probe, the reset GPIO is requested with GPIOD_OUT_LOW to bring
the controller out of reset. If the hardware reset line is active-low,
defining it as GPIO_ACTIVE_HIGH here will cause the driver to incorrectly
drive the pin physically low and hold the controller in reset.

> +		iovcc-supply =3D <&pm8953_l6>;
> +		/* vcc-supply should follow lab from panel */
> +
> +		pinctrl-0 =3D <&ts_reset_default &ts_int_default>;
> +		pinctrl-1 =3D <&ts_reset_sleep &ts_int_sleep>;
> +		pinctrl-names =3D "default", "sleep";
> +
> +		touchscreen-size-x =3D <720>;
> +		touchscreen-size-y =3D <1520>;
> +
> +		status =3D "disabled";

[Severity: Medium]
The commit message explicitly lists the touchscreen as supported functional=
ity
in this initial submission, but it is disabled here.

Should the commit message be updated to reflect that it remains disabled
due to missing dependencies?

> +	};
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820-next-patch=
es-v2-0-7130d68183d9@gmail.com?part=3D3
