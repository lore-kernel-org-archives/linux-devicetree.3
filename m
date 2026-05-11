Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2AF2FE04E
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 22:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778537474; cv=none; b=GMg8akhRXj49wuwgAbIcfV29Xn7bV8wAsyI9MsuVsDGjLcKAYz9B3GK+EvK4LbQm3JjfHW2eYilNJSMJJHNRkKvSJiTyMdNTlnmHzbuAtPoaZaqdZPAIoXkJUr3ogXD283l7r2fXZpzgFhJROPBiTVlXb1F37bAtWOkuE+IuWfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778537474; c=relaxed/simple;
	bh=tb0gd4xppC6sVjyXQJTTIkOCidtU9XsrXTX34EGUcCg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZA+AirnO5UF6bHuoGblqvsNTM3YSBw12DUW+4tiuar7sMVh7d7b4qko//6FH+6Fd3u4MH38urMQ6F388zDiE2H4JKrTPtVH36HAcn6p7cJbXg7naug1s/wgMFosY7NeyAZJNPC9fUzc5hijGKeTa53O2zZ5eQvQTaZ2+re6VsXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZM9VJcyO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZM9VJcyO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58F12C2BCB0;
	Mon, 11 May 2026 22:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778537474;
	bh=tb0gd4xppC6sVjyXQJTTIkOCidtU9XsrXTX34EGUcCg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=ZM9VJcyOIDe7vdFY5N8puLW0f/d9IDt3zAGGhadwDr7z4fY71yY6Xapf/F70Q545n
	 9WO/kyks3a3wN/Oyydofz8EPUlqFgh4wYgogAa2hNVzF+PFU9r16hg22r0RhFQoEG/
	 RZqpHwsUwBMI7oqDeAeyVBGMYrB9AQCNcmas0ldkuuYkj97PCFaVYT9rbqQL4OYLlk
	 yJdc/XGAM0F2DXunMyOxolZEvC+ZOW8vB90RGfr1qAtSYDd4lS+RHPhyW5Hfehw6pq
	 1q39MgtaYUE61F09w2ozo+qrGT4TwXWr1RXKAb8l6yONj9OzGZ+gxMZrup5XUqjmHf
	 qYYBMu5sU9dEA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: add basic devicetree for Ayaneo
 Pocket DS gaming console
Reply-To: sashiko@lists.linux.dev
To: "Alexandre Hamamdjian via B4 Relay" <devnull+azkali.limited.gmail.com@kernel.org>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260510-pocketds-v1-2-cf05acec06af@gmail.com>
References: <20260510-pocketds-v1-2-cf05acec06af@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 11 May 2026 22:11:13 +0000
Message-Id: <20260511221114.58F12C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:
- [High] Missing `compatible` string on the primary display panel.
- [High] Missing `cooling-maps` for fan thermal trip points.
- [Medium] PCIe peripheral power and enable signals are hardcoded via pinct=
rl.
- [Medium] Conflicting `output-low` pinctrl state for a regulator-managed G=
PIO.
- [Medium] Missing `pinctrl-1` property in the `pwm_fan` node.
- [Low] Inclusion of undocumented, downstream-specific devicetree property =
`rocknix-u-boot-dt-id`.
- [Low] Leading spaces in `vph_pwr` regulator name.
- [Low] Orphaned pinctrl nodes for a missing secondary display.
--

commit a48e1f08f4a1d52011fe6aeaf547a479fe5b3a94
Author: Teguh Sobirin <teguh@sobir.in>
arm64: dts: qcom: add basic devicetree for Ayaneo Pocket DS gaming console

This commit adds initial device tree support for the Ayaneo Pocket DS
gaming console based on the Qualcomm QCS8550 platform.

> diff --git a/arch/arm64/boot/dts/qcom/qcs8550-ayaneo-pocket-common.dtsi b=
/arch/arm64/boot/dts/qcom/qcs8550-ayaneo-pocket-common.dtsi
> new file mode 100644
> index 0000000000000..8d215a9d31d54
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/qcs8550-ayaneo-pocket-common.dtsi

[ ... ]

> +	thermal-zones {
> +		cpuss0-thermal {
> +			polling-delay =3D <200>;
> +			trips {
> +				cpuss0_fan0: trip-point2 {
> +					temperature =3D <40000>;
> +					hysteresis =3D <3000>;
> +					type =3D "passive";
> +					};

Should these thermal zones include a cooling-maps block? Without it, the
passive trip points don't seem to bind to the pwm_fan cooling device, meani=
ng
the thermal framework won't automatically scale the fan based on temperatur=
e.

[ ... ]

> +	vph_pwr: regulator-vph-pwr {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "  vph_pwr";

This isn't a bug, but there are leading spaces in the regulator name. Will
this cause formatting issues in sysfs or break userspace tools that parse t=
he
regulator tree?

> +		regulator-min-microvolt =3D <3700000>;
> +		regulator-max-microvolt =3D <3700000>;
> +
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +
> +	pwm_fan: pwm-fan {
> +		compatible =3D "pwm-fan";
> +
> +		pinctrl-names =3D "default", "sleep";
> +		pinctrl-0 =3D <&fan_pwm_active>, <&fan_int>;

Should this node include a pinctrl-1 property? The sleep state is declared =
in
pinctrl-names, but the corresponding configuration is missing, which might
cause the pinctrl framework to fail during power management transitions.

> +
> +		fan-supply =3D <&vdd_fan_5v0>;
> +		pwms =3D <&pm8550_pwm 3 40000>;

[ ... ]

> +	fan_pwr_active: fan-pwr-active-state {
> +		pins =3D "gpio31";
> +		function =3D "gpio";
> +		drive-strength =3D <2>;
> +		bias-disable;
> +		output-low;
> +	};

Does the output-low property here conflict with the regulator subsystem? Th=
is
state is used by the vdd_fan_5v0 fixed regulator, which already manages the
GPIO's output direction and logic level natively.

[ ... ]

> +&mdss_dsi0 {
> +	vdda-supply =3D <&vreg_l3e_1p2>;
> +	status =3D "okay";
> +
> +	display_panel: panel@0 {
> +		reg =3D <0>;
> +
> +		pinctrl-0 =3D <&sde_dsi_active>, <&sde_te_active>;

Is this panel missing a compatible string? Without it, the DRM panel driver
will not be able to probe and bind to the hardware, rendering the primary
display non-functional.

> +		pinctrl-1 =3D <&sde_dsi_suspend>, <&sde_te_suspend>;
> +		pinctrl-names =3D "default", "sleep";
> +	};
> +};

[ ... ]

> +&pcie1 {
> +	wake-gpios =3D <&tlmm 99 GPIO_ACTIVE_HIGH>;
> +	perst-gpios =3D <&tlmm 97 GPIO_ACTIVE_LOW>;
> +
> +	pinctrl-0 =3D <&pcie1_default_state>, <&upd720201_active>, <&gamepad_pw=
r_en>;

Is it intended to manage the downstream USB controller and gamepad enable
GPIOs directly at the PCIe host level?

Hardcoding them here bypasses the proper device-specific power management a=
nd
might break suspend/resume sequencing since the peripherals will remain
unconditionally powered while the PCIe controller is active.

> +	pinctrl-names =3D "default";
> +
> +	status =3D "okay";
> +};

[ ... ]

> diff --git a/arch/arm64/boot/dts/qcom/qcs8550-ayaneo-pocketds.dts b/arch/=
arm64/boot/dts/qcom/qcs8550-ayaneo-pocketds.dts
> new file mode 100644
> index 0000000000000..723b027fa73bd
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/qcs8550-ayaneo-pocketds.dts

[ ... ]

> +/ {
> +	model =3D "AYANEO Pocket DS";
> +	compatible =3D "ayaneo,pocketds", "qcom,sm8550";
> +	rocknix-u-boot-dt-id =3D "u-boot-pocket-ds";

Is this downstream-specific property intended to be upstreamed? Devicetrees
usually describe hardware topology rather than downstream OS or bootloader
identifiers.

> +
> +	tca6424_vcc: regulator-tca6424-vcc {

[ ... ]

> +&tlmm {
> +	gpio-reserved-ranges =3D <32 4>;
> +	panel_pwr_active: panel-pwr-active-state {
> +		pins =3D "gpio152", "gpio153";
> +		function =3D "gpio";
> +		drive-strength =3D <8>;
> +		bias-disable;
> +		output-high;
> +	};
> +
> +	sde_dsi1_active: sde-dsi1-active-state {
> +		pins =3D "gpio137";
> +		function =3D "gpio";
> +		drive-strength =3D <8>;
> +		bias-disable;
> +		output-high;
> +	};
> +
> +	sde_dsi1_suspend: sde-dsi1-suspend-state {
> +		pins =3D "gpio137";
> +		function =3D "gpio";
> +		drive-strength =3D <2>;
> +		bias-pull-down;
> +	};

Are these pinctrl states needed? They appear to be orphaned since the
secondary display node (&mdss_dsi1) is not defined in this devicetree.

> +
> +	ts_rst_default: ts-rst-default-state {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260510-pocketds-v=
1-0-cf05acec06af@gmail.com?part=3D2
