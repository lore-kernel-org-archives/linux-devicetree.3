Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07CE51AED7
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 15:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790867209; cv=none; b=exwMO2MLuUP32coC9oMntsRdnN+TiSbktLFY1G4XtiqSxDjKFgBxj4N5+RU5fDvU126HvZEWMtrm+ONN8BacyClPKzTA+BUX19COhNtk4l0FJaKmWZMht0ZgPvr1A7p+ibaZvlRqejrfe5AsCDUG2D2MZp4b9XALWASWjNvNF7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790867209; c=relaxed/simple;
	bh=QTQqjgBJj/hc/KVh57BtX3f6BfxDqPYlDWM0K03+w24=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RxtY7vHNwQj4NjmYFHPhB2uLxJqzPmIV7+eIWQLIvBVXiYx30KJjSn5GRdtKcWE4BF0Xsk/yvpQwp1NxppOL+Jw/4wZryDspLmbUaXpDZtPhLqJPfe7zefiKGyYEr551ifUfK9we4XDSe4ImfRMWZqrgmmpRpHAkpNzaSEGrvGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y+n/FR4C; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y+n/FR4C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18F431F000FF;
	Thu,  1 Oct 2026 15:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790867207;
	bh=HmYWqHBNEN8hU5s/OvNq16qz+yijmgkjOgw1OkyY1Ys=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Y+n/FR4CZQ1C1VfQeKSZ1cMnk1KIZ+OqGeP4RHTNdHkvY6XN18xbZIdWlQ7Nx+9g/
	 Kn2x+YGc5pA9ZEQzgsNBagbnYUjkOSZIryGejQMcHRZxV8dgQTUxDZK5ievVLXviDG
	 rn8PvPzxEFoK6l5Og5uKN6TFBffVEkfhazzamhfl2YxUt31uiJb7EtXN2l4oit82LE
	 xc+gEIziuKgIwBw/QMjQjmo5HxcqYxpjjOdYyD/mR10OYBWvNDyNp4h81px7Rr+k7V
	 AqM11KvRZFUlywZTs/aNosc0iRk5D1aulXlhqu8x9kl8NWEsbIVvMzrVMrUwjluzUl
	 8+Ox+lbYGks1A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8650-valve-deckard: Add initial
 support of camera sensors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vladimir Zapolskiy" <vladimir.zapolskiy@linaro.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261001145206.2442665-1-vladimir.zapolskiy@linaro.org>
References: <20261001145206.2442665-1-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 01 Oct 2026 15:06:46 +0000
Message-Id: <20261001150647.18F431F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] dt: pinctrl states grouped incorrectly under pinctrl-0
- [High] dt: out-of-bounds reset-gpios index for og01a1b sensor
- [Medium] dt: invalid data-lanes enum value for og01a1b sensor
--

commit 80cdd7bb4552bb56ef59eb14b62e12c079117298
Author: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

arm64: dts: qcom: sm8650-valve-deckard: Add initial support of camera senso=
rs

This commit adds initial device tree support for camera sensors on the Valve
Steam Frame device. It enables CAMSS and adds descriptions for pairs of
OmniVision OV6211 and OG01A1B monochrome sensors.

> diff --git a/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts b/arch/arm=
64/boot/dts/qcom/sm8650-valve-deckard.dts
> index d25a09e162dd3..3b2503c3c5413 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts

[ ... ]

> +&cci0_i2c1 {
> +	sensor@60 {
> +		compatible =3D "ovti,ov6211";
> +		reg =3D <0x60>;
> +		clocks =3D <&camcc CAM_CC_MCLK4_CLK>;
> +		assigned-clocks =3D <&camcc CAM_CC_MCLK4_CLK>;
> +		assigned-clock-rates =3D <24000000>;
> +		pinctrl-0 =3D <&cam4_default>, <&cam4_sleep>;
> +		pinctrl-names =3D "default", "sleep";

[Severity: High]
Does this correctly map the sleep state for the camera pins?

Assigning both the default and sleep state phandles to pinctrl-0 while
defining pinctrl-names as "default", "sleep" breaks pin control behavior.
The pinctrl subsystem expects index 1 to map to pinctrl-1.

Due to this misconfiguration, the kernel may mistakenly apply both default =
and
sleep states sequentially when setting the default state, leaving the pins =
in
the sleep configuration. Furthermore, it will fail to find the required
pinctrl-1 property when attempting to transition to sleep later.

[ ... ]

> +&cci2_i2c0 {
> +	sensor@36 {
> +		compatible =3D "ovti,og01a1b";
> +		reg =3D <0x36>;
> +		clocks =3D <&camcc CAM_CC_MCLK0_CLK>;
> +		assigned-clocks =3D <&camcc CAM_CC_MCLK0_CLK>;
> +		assigned-clock-rates =3D <19200000>;
> +		reset-gpios =3D <&pm8550vs_e_gpios 4 GPIO_ACTIVE_LOW>;
> +		pinctrl-0 =3D <&cam0_default>, <&cam0_sleep>;
> +		pinctrl-names =3D "default", "sleep";

[Severity: High]
Will this experience the same pinctrl mapping issue described above for
the ovti,ov6211 sensor?

> +		avdd-supply =3D <&vreg_l3m_2p8>;
> +		dovdd-supply =3D <&vreg_cam_front_right_1p8>;
> +		dvdd-supply =3D <&vreg_cam_front_right_1p2>;
> +
> +		port {
> +			cam_front_right: endpoint {
> +				data-lanes =3D <0 1>;

[Severity: Medium]
Is the value <0 1> for data-lanes intentional?

The device tree schema for the ovti,og01a1b sensor only permits the enum
values of 1 and 2. This configuration will lead to a dtbs_check validation
error, and could cause driver configuration issues if the PHY driver strict=
ly
expects 1-based physical lane indexing.

> +				link-frequencies =3D /bits/ 64 <500000000>;
> +				remote-endpoint =3D <&csiphy1_ep>;
> +			};
> +		};
> +	};
> +
> +	sensor@60 {
> +		compatible =3D "ovti,og01a1b";
> +		reg =3D <0x60>;
> +		clocks =3D <&camcc CAM_CC_MCLK1_CLK>;
> +		assigned-clocks =3D <&camcc CAM_CC_MCLK1_CLK>;
> +		assigned-clock-rates =3D <19200000>;
> +		reset-gpios =3D <&pm8550vs_e_gpios 6 GPIO_ACTIVE_LOW>;

[Severity: High]
Could this out-of-bounds index cause a probe failure?

The pm8550vs PMIC only supports 6 GPIOs (indices 0 through 5). Referencing
index 6 guarantees an out-of-bounds error during the GPIO lookup, which will
cause the sensor driver to fail to request its reset pin during probe.

> +		pinctrl-0 =3D <&cam1_default>, <&cam1_sleep>;
> +		pinctrl-names =3D "default", "sleep";

[Severity: High]
As noted above, shouldn't the sleep state be mapped to pinctrl-1?

> +		avdd-supply =3D <&vreg_l3n_2p8>;
> +		dovdd-supply =3D <&vreg_cam_front_left_1p8>;
> +		dvdd-supply =3D <&vreg_cam_front_left_1p2>;
> +
> +		port {
> +			cam_front_left: endpoint {
> +				data-lanes =3D <0 1>;

[Severity: Medium]
Does this data-lanes configuration also need to be updated to use 1-based
physical lane indexing to satisfy the ovti,og01a1b schema?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261001145206.2442=
665-1-vladimir.zapolskiy@linaro.org?part=3D1
