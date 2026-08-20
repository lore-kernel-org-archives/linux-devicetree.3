Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A89C3D7D8B
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 09:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787219943; cv=none; b=Y9EkDNhrYsjCDM1TYU3SQGwPXZP8rOK0XtPXnyLPHhV1CNW3lNbt0p95a+qFBJCbteDutdq5P6/SKSufMNddpEDbhoYFvr9WRiX4NdWrwVygof9uNgkN30J3BKGEIZXxkwln8k+xw9eiX7lu1Y9UYcOp0ES3gvdjBs9FWoaTaiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787219943; c=relaxed/simple;
	bh=RqQ1zK/Qx/QBDQS3rcQmCqeEfT056fJyMnfMnIVbeoY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FnriNhrCVu5V62twkop97/0p2j/qz01UyxVVmMz0I7QG+Bx+3sIUV59/aNqt1t+VH8RXYRnp1ezaUPinFg8cdg1E2GLl4Mbg7s5IbxrMdvb8t82MrG0gbzXUoBq2yocIP3vHDvs/NSTWz8C5OkgCL/SDY8G6+wnUn3K126t25OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U84ZAFLJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U84ZAFLJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 295841F000E9;
	Thu, 20 Aug 2026 09:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787219941;
	bh=LtswecI+rHAkz3dTSjrKzlPz+/+WeY1T5rQOVg3jjwo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=U84ZAFLJuwIk8tRe+LEHxHPe1MXiD/FVpfX6XboqMqFST6FdwC8KjS9PebkpbFyOV
	 4XuWmtmdLibYW8tMti2RBDzGKw2J0gYUW+DvWW3QwDenojq3MbwDSd16NsLfE8N6/i
	 R/V4ESElH3vqAIZpK5lezSQ516kuXHNSTWPY76h3QjjJQRzs265mZGsQ0DLa4N6r8H
	 ta9eIXCOIXT3fpCHJ7rIjq4vhZTGgYUjzs7/fXjKneY6Y32p7Z8+K2exytkXCSAEx5
	 Tkk8bQsWPFq2tLJUs3tqWuiA0oBJzku2XpMSl+IEG1zBglAE0lL/VEh2hgE99Pfh1y
	 XkLrLNKkDTrXg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/7] arm64: dts: qcom: Add LeEco Le2
Reply-To: sashiko-reviews@lists.linux.dev
To: "Adam Skladowski" <a39.skl@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260820-next-patches-v2-5-7130d68183d9@gmail.com>
References: <20260820-next-patches-v2-0-7130d68183d9@gmail.com>
 <20260820-next-patches-v2-5-7130d68183d9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 09:59:00 +0000
Message-Id: <20260820095901.295841F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] WLED backlight node is missing the 'status =3D "okay";' override, =
leaving it disabled.
- [Medium] Missing Volume Down key functionality despite commit message cla=
iming support for 'Volume Keys'
- [Medium] TUSB320 interrupt is configured with incorrect rising edge polar=
ity.
- [Low] Devicetree node name `gpio_keys` uses an underscore instead of a hy=
phen.
--

--- Patch [5]: [PATCH v2 5/7] arm64: dts: qcom: Add LeEco Le2 ---
commit 2faf39eef8c89160868ac706e9e8325f190da424
Author: Adam Skladowski <a39.skl@gmail.com>

arm64: dts: qcom: Add LeEco Le2
   =20
Add a devicetree for the LeEco Le2 smartphone, which is based on the
Eldarion/MSM8976 SoC. Supported functionality includes I2C peripherals, Pow=
er
Button, Volume Keys, Regulators, WLED, Remoteprocs, and GPU.

> diff --git a/arch/arm64/boot/dts/qcom/msm8976-leeco-s2.dts b/arch/arm64/b=
oot/dts/qcom/msm8976-leeco-s2.dts
> new file mode 100644
> index 0000000000000..acea087168afe
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/msm8976-leeco-s2.dts
> @@ -0,0 +1,435 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> +/*
> + * Copyright (c) 2026 Adam Skladowski <a39skl@gmail.com>
> + */

[ ... ]

> +/ {
> +	model =3D "Leeco Le S2";
> +	compatible =3D "leeco,s2", "qcom,msm8976";
> +	chassis-type =3D "handset";
> +
> +	gpio_keys {

[Severity: Low]
This isn't a bug, but should this node name use a hyphen instead of an
underscore (gpio-keys) to conform to standard devicetree naming conventions?

> +		compatible =3D "gpio-keys";
> +
> +		pinctrl-0 =3D <&gpio_key_default>;
> +		pinctrl-names =3D "default";
> +
> +		key-volume-up {
> +			label =3D "Volume Up";
> +			gpios =3D <&tlmm 113 GPIO_ACTIVE_LOW>;
> +			linux,code =3D <KEY_VOLUMEUP>;
> +		};
> +	};

[Severity: Medium]
The commit message mentions support for "Volume Keys", but only the Volume =
Up
key is defined here. Is the Volume Down key missing?

On PM8950 platforms, Volume Down is typically routed to the PMIC resin pin,
but pm8950_resin isn't overridden to status =3D "okay"; in this file. Will =
this
leave the Volume Down key non-functional?

[ ... ]

> +&blsp2_i2c2 {
> +	status =3D "okay";
> +
> +	haptics: haptics@5a {

[ ... ]

> +	};
> +
> +	tiusb320: typec@47 {
> +		compatible =3D "ti,tusb320";
> +		reg =3D <0x47>;
> +		interrupts-extended =3D <&tlmm 21 IRQ_TYPE_EDGE_RISING>;

[Severity: Medium]
The INT_N pin of the TUSB320 is an active-low open-drain output. Should this
interrupt be configured as IRQ_TYPE_EDGE_FALLING or IRQ_TYPE_LEVEL_LOW inst=
ead
of IRQ_TYPE_EDGE_RISING?

As it is, the kernel might ignore the high-to-low transition when a cable is
plugged in.

> +
> +		pinctrl-0 =3D <&tusb320_int_active>;
> +		pinctrl-names =3D "default";
> +	};
> +};

[ ... ]

> +&pm8950_spmi_regulators {
> +	vdd_s5-supply =3D <&vph_pwr>;
> +
> +	/* Cluster 0 supply */
> +	pm8950_spmi_s5: s5 {
> +		regulator-min-microvolt =3D <950000>;
> +		regulator-max-microvolt =3D <1165000>;
> +		regulator-name =3D "VDD_APC0";
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +};
> +
> +&pmi8950_wled {
> +	qcom,current-limit-microamp =3D <20000>;
> +	qcom,enabled-strings =3D <0 1>;
> +	qcom,ovp-millivolt =3D <29600>;
> +};

[Severity: High]
Is this node missing a status =3D "okay"; property?=20

The pmi8950-wled device defaults to disabled in pmi8950.dtsi. Without
explicitly enabling it here, will the display backlight fail to probe during
boot?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820-next-patch=
es-v2-0-7130d68183d9@gmail.com?part=3D5
