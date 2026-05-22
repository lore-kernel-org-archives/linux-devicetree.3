Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624DC402B97
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 13:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779457976; cv=none; b=ujFD+rb3BsAOM7MuHcqsUtQEYV0hohqQyXxDGaLKf/mpVheTwGE50JOD1eEV9q/NyDhYoSvxb1D0ceEGSnaY2kwSSxCJmo9eskGEvSSSQuV/ECn4vTyAKZW/x38gac990rJnZZszdACyogT7q/AtxS1HqGlfPV8Tpuvi0D38rHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779457976; c=relaxed/simple;
	bh=SNKYtJz7zKpE7dbPIGo0KdHBYR4vxKhqDTVgo+2Ulqg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TAxIOQaqoUCI67RE1kRgpShdPyeZiAhBl5XJ5jbBtGtcYvRIFVIQg26PGyOg4wgMYo9WDY5J1SlbsLa7tQlsNXJUm2hzaccD9xKJMMDdfLf7IjrNOuRtnHz6c4C6S09y/XKNzYJ90qPPmdfBtQA/5xgtqR/9dMUfeyWtHONTJ9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gnuubqyb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gnuubqyb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AF5D1F000E9;
	Fri, 22 May 2026 13:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779457969;
	bh=D0VR8duU3oq1IsXzgJE7IEJGxVxEN4FwhvMG1ETzWdE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GnuubqybhOJvcW1lAlUFeXV2zBBZVpO1M+qmUIf5izLOldAv4JyvbWQViYWCnjeAX
	 rHGqZ+KXHAyxgOKA4hw4L0+nGe94uzCCiKaEmuHvWaim3vUbXZEgM2zCRWsAPhOwDW
	 gD1EPjk+Rv6iyw0M1ykYCtShWaAqoXEACWdbQuEDt/Z0bmZOBaFTScbNRsDTYk81FM
	 p6L0X0gm7YigBjNrXxSwz7rwiJIWay/I+iBwYYnlRRVTlhU5dUwUD9eOJGL0KNNKD/
	 sqyRPWfkjNwSYeE9batlFJgK5aJoR1MoD34J3tb6+yIBed/UMHd5tuxaraM3dE0zFb
	 m3OOm+JbokZIQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 01/11] arm64: dts: ti: k3-am62-verdin: Add Toradex
 DSI to LVDS adapter with 10.1" display
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vitor Soares" <ivitro@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260522132014.226721-14-ivitro@gmail.com>
References: <20260522132014.226721-14-ivitro@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 22 May 2026 13:52:48 +0000
Message-Id: <20260522135249.2AF5D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] Nodes use specific device or misleading names instead of the requir=
ed generic class names.
- [Low] The fixed regulator node 'regulator-3v3-lvds-bridge' is missing the=
 strictly required 'regulator-name' property.
--

commit 8eb886986d19e2608d6989dd557b140a93c31c32
Author: Vitor Soares <vitor.soares@toradex.com>

arm64: dts: ti: k3-am62-verdin: Add Toradex DSI to LVDS adapter with 10.1" =
display

This commit adds a device tree overlay for the Toradex DSI to LVDS Adapter
connected to a 10.1" capacitive touch display. It configures the SN65DSI84
bridge, an LVDS panel, and an Atmel MaxTouch controller on the Verdin DSI_1
interface.

Link: https://developer.toradex.com/hardware/accessories/add-ons/dsi-lvds-a=
dapter
Link: https://developer.toradex.com/hardware/accessories/displays/capacitiv=
e-touch-display-101inch-lvds

[ ... ]
> diff --git a/arch/arm64/boot/dts/ti/k3-am625-verdin-dsi-to-lvds-panel-cap=
-touch-10inch.dtso b/arch/arm64/boot/dts/ti/k3-am625-verdin-dsi-to-lvds-pan=
el-cap-touch-10inch.dtso
> new file mode 100644
> index 0000000000000..0e873f2ccf65a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-am625-verdin-dsi-to-lvds-panel-cap-touch-=
10inch.dtso
> @@ -0,0 +1,123 @@
[ ... ]
> +&{/} {
> +	backlight_pwm3: backlight-pwm3 {

[Severity: Low]
Should this node use a generic name like 'backlight' instead of
'backlight-pwm3' to comply with the Devicetree Specification recommendation=
s?

Using non-generic names might cause schema validation warnings during
dtbs_check.

> +		compatible =3D "pwm-backlight";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_i2s_2_d_out_gpio>;
> +		brightness-levels =3D <0 45 63 88 119 158 203 255>;
> +		default-brightness-level =3D <4>;
> +		/* Verdin I2S_2_D_OUT as GPIO (SODIMM 46) */
> +		enable-gpios =3D <&main_gpio0 34 GPIO_ACTIVE_HIGH>;
> +		power-supply =3D <&reg_3v3>;
> +		/* Verdin PWM_3_DSI (SODIMM 19) */
> +		pwms =3D <&epwm1 0 6666667 PWM_POLARITY_INVERTED>;
> +	};
> +
> +	panel-lvds-bridge {

[Severity: Low]
Does this node name deviate from the Devicetree Specification recommendatio=
ns?

Using a generic name like 'panel' is usually preferred and helps avoid
schema validation warnings.

> +		compatible =3D "logictechno,lt170410-2whc";
> +		backlight =3D <&backlight_pwm3>;
> +		power-supply =3D <&reg_3v3_lvds_bridge>;
> +
> +		port {
> +			panel_lvds_bridge_in: endpoint {
> +				remote-endpoint =3D <&dsi_lvds_bridge_out>;
> +			};
> +		};
> +	};
> +
> +	reg_3v3_lvds_bridge: regulator-3v3-lvds-bridge {
> +		compatible =3D "regulator-fixed";
> +		regulator-max-microvolt =3D <3300000>;
> +		regulator-min-microvolt =3D <3300000>;

[Severity: Low]
Is the 'regulator-name' property missing here?

According to the fixed regulator bindings in
Documentation/devicetree/bindings/regulator/fixed-regulator.yaml, this
property is mandatory when the compatible string is "regulator-fixed".
Omitting it will cause dtbs_check errors.

> +	};
> +};
[ ... ]
> +/* Verdin I2C_1 */
> +&main_i2c1 {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +
> +	bridge@2c {
> +		compatible =3D "ti,sn65dsi84";
[ ... ]
> +		};
> +	};
> +
> +	touch@4a {

[Severity: Low]
Could we use the generic class name 'touchscreen@4a' here instead of
'touch@4a' to align with standard device tree conventions?

> +		compatible =3D "atmel,maxtouch";
> +		reg =3D <0x4a>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_dsi1_int>, <&pinctrl_i2s_2_bclk_gpio>;
> +		/* Verdin GPIO_9_DSI (SODIMM 17) - TOUCH_INT# */
> +		interrupt-parent =3D <&main_gpio1>;
> +		interrupts =3D <49 IRQ_TYPE_EDGE_FALLING>;
> +		/* Verdin I2S_2_BCLK (SODIMM 42) - TOUCH_RESET# */
> +		reset-gpios =3D <&main_gpio0 35 GPIO_ACTIVE_LOW>;
> +	};
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522132014.2267=
21-13-ivitro@gmail.com?part=3D1
