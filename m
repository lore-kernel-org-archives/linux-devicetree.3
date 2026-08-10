Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B982D3F8241
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 17:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786384151; cv=none; b=s4fwEc8GrEd3GiNJaXz47Yvq9YzXeA760EAS+6CwxNm9RExDcqf2lM0tPyk88gjVXFKG1ZVELb98gm5ciOpHnioNrl7hZUZdrKPYTW8ZGzeigTEQmThN1n53X1+vci57slZG7ySOZZmhd5SfFDcvQYIxGu4TGvcBJcAD8dKMi0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786384151; c=relaxed/simple;
	bh=VCTbwWqXH9cFfjCXKR0gSianYDN40Ae7UmpPlk85nY8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ubmYQ1qNSwQaGwqSJrm3oUD3DQyVXUHfbBqIml7uB1g7a4h+Llat4FBvQNBMmjmgt4RizhCCfNk0DVmImVrWSvQTaMmC56c+NaIITlrYDwej3beJeRLikQAh7DLl8Ci7wESnIy6ACHuC6V9hWZBJpUkqgQKJCdu/G0U5PLg2DFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iBgEcy3t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iBgEcy3t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 090F41F000E9;
	Mon, 10 Aug 2026 17:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786384150;
	bh=sxyf0WMpGR52iPlz+44fqbmgrVPayKILK+o1SOWoDcQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iBgEcy3tlu+aImA0hUB02Aj/hgxecU4MKVmsUW5HX30u2Wt8+53qpOkRi/qlTBZKP
	 NP8OQ9LMml3Tr3J1Cpekk0rJ1bQehdVvLBrZMLaXysnBwB8Px8BbHGUpJJAKmlWbdc
	 x+Ix0ia8M34WO3kyX+PdqQTBUkAVbk1W9czX/QlRUuxPoqwqvEFbJEQ7/25EhWBlHx
	 9yIoOAw0XdUiLzrKuocW1D1e4p1A2E9ulkjlWoJhGIqQRllzthisgBwds4qqbmwbzV
	 P+O86QEmvB/6CB43wYDShZJy4H6JAYU2Km7wSJJyoV+Yh08jpV8BnhlFVN9KhAyHn2
	 sCtUUGh4HgW4g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/7] arm64: dts: qcom: Add LeEco Le2
Reply-To: sashiko-reviews@lists.linux.dev
To: "Adam Skladowski" <a39.skl@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260810-next-patches-v1-5-79a779d76173@gmail.com>
References: <20260810-next-patches-v1-0-79a779d76173@gmail.com>
 <20260810-next-patches-v1-5-79a779d76173@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 17:49:09 +0000
Message-Id: <20260810174910.090F41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Touchscreen and USB nodes are missing `pinctrl` properties, `reset=
-gpios`, and use invalid downstream interrupt flags.
- [High] The eMMC controller (`sdhc_1`) lacks required `non-removable` and =
`bus-width =3D <8>` properties.
- [Medium] Missing `no-map` property in the `cont_splash_mem` reserved-memo=
ry region.
- [Medium] Unimplemented features claimed in the commit message (Volume Dow=
n key and WLED).
- [Low] Attempting to delete a non-existent device tree node breaks the bui=
ld.
- [Low] The `ramoops` node has a `reg` property but lacks a unit address in=
 its node name.
--

--- Patch [5]: [PATCH 5/7] arm64: dts: qcom: Add LeEco Le2 ---
commit d23816b713fe6e13030690c43966d4d9b18f3739
Author: Adam Skladowski <a39.skl@gmail.com>

arm64: dts: qcom: Add LeEco Le2

This patch adds a devicetree for the LeEco Le2 smartphone based on the MSM8=
976
SoC. It claims support for peripherals such as I2C, Power/Volume keys,
regulators, WLED, WCNSS, and GPU.

> Supported functionality as of this initial submission:
> * I2C peripherals (Touchscreen,Audio amp, Haptics, Extcon, Led)
> * Power Button, Volume Keys

[Severity: Medium]
The commit message lists Volume Keys, but only the Volume Up key is defined
in the patch. Was the Volume Down key inadvertently omitted?

> * Regulators (PM8950)
> * WLED (PMI8950)

[Severity: Medium]
The commit message lists WLED, but the pmi8950_wled node below lacks
a status =3D "okay" property to enable it. Does the WLED function work as i=
s?

[ ... ]
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/msm8976-leeco-s2.dts
[ ... ]
> +	reserved-memory {
> +
> +		ramoops {
> +			compatible =3D "ramoops";
> +			no-map;
> +			reg =3D <0 0x9ff00000 0 0x100000>;

[Severity: Low]
Does this node need a unit address in its name to match the reg property
(e.g., ramoops@9ff00000)? Without it, the device tree compiler will generate
a build warning.

> +			record-size =3D <0x10000>;
> +			console-size =3D <0x60000>;
> +			ftrace-size =3D <0x10000>;
> +			pmsg-size =3D <0x20000>;
> +			ecc-size =3D <16>;
> +		};
> +
> +		/delete-node/ memory@83000000;

[Severity: Low]
Could this /delete-node/ cause a fatal dtc build failure?

The memory@83000000 node does not appear to exist in the included
msm8976.dtsi or PMIC include files.

> +
> +		cont_splash_mem: memory@82000000 {
> +			reg =3D <0x0 0x82000000 0x0 0x2800000>;
> +		};

[Severity: Medium]
Should the cont_splash_mem node include the no-map property?

Without it, the kernel maps the region as standard cacheable RAM, which can
cause speculative data aborts, caching issues, or visual corruption if the
bootloader leaves the display controller scanning out from this memory.

[ ... ]
> +&blsp1_i2c4 {
> +	status =3D "okay";
> +
> +	rmi4-i2c-dev@4b {
> +		reg =3D <0x4b>;
> +		compatible =3D "syna,rmi4-i2c";
> +		interrupts-extended =3D <&tlmm 65 0x2008>;

[Severity: High]
Does this use an invalid downstream interrupt flag?=20

0x2008 is usually a downstream wakeup flag that the upstream kernel masks,
meaning it won't be recognized as a wakeup source.

Also, are the pinctrl-names, pinctrl-0, and reset-gpios properties missing
here?=20

Without pinctrl, the interrupt pin (gpio65) lacks a pull-up, which can cause
an interrupt storm, and without reset-gpios, the controller might not probe
properly. The ts_int_default and ts_reset_active pinctrl states defined bel=
ow
appear to be unused.

> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
[ ... ]
> +&blsp2_i2c2 {
> +	status =3D "okay";
[ ... ]
> +	tiusb320: tusb320@47 {
> +		compatible =3D "ti,tusb320";
> +		reg =3D <0x47>;
> +		interrupts-extended =3D <&tlmm 21 IRQ_TYPE_EDGE_RISING>;
> +	};

[Severity: High]
Is a pinctrl configuration missing for this interrupt pin?

[ ... ]
> +&sdhc_1 {
> +	vmmc-supply =3D <&pm8950_l8>;
> +	vqmmc-supply =3D <&pm8950_l5>;
> +
> +	status =3D "okay";
> +};

[Severity: High]
Should this eMMC controller node include the non-removable and bus-width =
=3D <8>
properties?

Because it is not marked as non-removable, the MMC core may treat it as a
hot-pluggable SD card and poll for Card Detect, causing boot delays. Missing
the bus-width property can also degrade storage throughput by restricting it
to 4-bit or 1-bit mode.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810-next-patch=
es-v1-0-79a779d76173@gmail.com?part=3D5
