Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309E92E7631
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 21:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783546507; cv=none; b=S3EbZryD6k3L0vrXIfzgO/1matRaa4iQcDGQv4VO0Y+I1ximgx5BP/DkSsvhEZB/z3amFuX1vihmce4DT4DkPoUCHO3s3pYw/dv0KbIi6ogFalwYx2Lp+tUj7WdNBkJ+HVyEom6ADvm5QgLL+MjfjHBU/EUkvn6+Unq1BsX2ymQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783546507; c=relaxed/simple;
	bh=LfmuX+WN09XuZkXevbvH07EHQVuWqmXIU1hJwpJ8Oh8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SLyedpucQit3vrcjHHidU6DYeQdIuHQx6/qcX5TtU0HIFY9OKWHER1BFXOa1ABKCMBf44fQh2FpSllsPRK5qpQ8LT7x2OLgnhZrpBEOF0mlTU1iigndWnNOPrailY4mJaNKXyG8X5Dwyf57u1HCKDpHyMSrbH+ES77a7Ks4dYRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XuYOPvHN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XuYOPvHN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C574D1F000E9;
	Wed,  8 Jul 2026 21:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783546506;
	bh=G9EXypEJy40h/+n6oSbEOhxBQsT7I7BUgf6bsn/3RO8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XuYOPvHNBzMtyZedog1tuthmccRlL4JoWRYtjmAJ3/7cWLxNpP1rbYpBQfTym0IOb
	 CssuGvoAyLdF/NCphOngKQtMNbRVQkZJK7F+iGvo0LDY6EisUOUq65jDJ5kUiU1T4e
	 /TI0fngsKL4wBjeiRaOIdZcTHE+uiRCii2wVWc3F1zsA5qPbARCc0578cRJBv4LDAL
	 rom0gh2IBn4kUIqsGLoZReVnlVxpfV4bSz6NXDotQV+SwF0ae0hOlyGGSgnBSIVP86
	 /HzBQT56IyuQ7eFynd9OFoxIwaQY6CGuiNdGpJrMAH06g8sYVXHShtPX7ZBWDKy2px
	 Ax08CssYvBhAg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 2/3] arm64: dts: ti: Add support for Variscite
 VAR-SOM-AM62
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <36179bc7e043c95838354174963cdb27d5383620.1783545241.git.stefano.r@variscite.com>
References: <cover.1783545241.git.stefano.r@variscite.com>
 <36179bc7e043c95838354174963cdb27d5383620.1783545241.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 21:35:05 +0000
Message-Id: <20260708213505.C574D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] The `reg_vdd_mmc2` (wifi_power) regulator is missing its `gpio` pr=
operty and incorrectly configures Wi-Fi/BT enable pins as floating inputs.
- [High] Race condition in Ethernet PHY initialization due to incorrect pin=
mux placement.
- [Medium] Blind copy-paste of WM8904 codec hardware configuration from bin=
dings.
- [Low] Usage of the incorrect `AM62PX_MCU_IOPAD` macro instead of `AM62X_M=
CU_IOPAD` in an AM625 device tree.
- [Low] Copy-paste artifact in the OPP table comment referencing the TI `am=
625-sk` evaluation board.
--

--- Patch [2]: [PATCH v1 2/3] arm64: dts: ti: Add support for Variscite VAR=
-SOM-AM62 ---
commit f91b9416e264c64f84899f5bbd68c1deb9597b14
Author: Stefano Radaelli <stefano.r@variscite.com>

arm64: dts: ti: Add support for Variscite VAR-SOM-AM62

This commit adds device tree support for the Variscite VAR-SOM-AM62 system
on module. It enables default SOM-specific peripherals like MMC, Ethernet,
Audio, and Wi-Fi.

Link: https://variscite.com/system-on-module-som/ti-sitara-am62x/var-som-am=
62/

> diff --git a/arch/arm64/boot/dts/ti/k3-am625-var-som.dtsi b/arch/arm64/bo=
ot/dts/ti/k3-am625-var-som.dtsi
> new file mode 100644
> index 0000000000000..95dd96fe4c66d
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-am625-var-som.dtsi
> @@ -0,0 +1,491 @@
[ ... ]
> +	opp-table {
> +		/* Add 1.4GHz OPP for am625-sk board. Requires VDD_CORE to be at 0.85V=
 */
> +		opp-1400000000 {
> +			opp-hz =3D /bits/ 64 <1400000000>;

[Severity: Low]
Is this comment leftover from a copy-paste? It references the am625-sk
evaluation board rather than the var-som board.

> [ ... ]
> +	reg_3v3_phy: regulator-3v3-phy {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "On-module +V3.3_PHY";
> +		gpios =3D <&main_gpio0 45 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		regulator-always-on;
> +	};

[Severity: High]
Can this cause a race condition during Ethernet PHY initialization?

The PHY regulator reg_3v3_phy is set to always-on and asserts GPIO 45
in software. However, the physical pinmux for power (GPIO0_45) and reset
(GPIO0_46) is tied to the Ethernet MAC (cpsw3g) later in the file:

	pinctrl_rgmii1: main-rgmii1-default-pins {
		bootph-all;
		pinctrl-single,pins =3D <
			...
			AM62X_IOPAD(0x00bc, PIN_INPUT, 7) /* (V24) VOUT0_DATA1.GPIO0_46 */
			AM62X_IOPAD(0x00b8, PIN_INPUT, 7) /* (U22) VOUT0_DATA0.GPIO0_45 */
		>;
	};

When the MAC probes, it applies the pinmux, causing the PHY to receive power
instantly. Since the PHY lacks a phy-supply link to this regulator, there i=
s a
risk of a 0ms power-on delay before the MAC registers the MDIO bus and prob=
es
the PHY, violating its power-on and reset timing requirements.

> +
> +	reg_vdd_mmc2: regulator-vdd-wifi {
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_vdd_mmc2>;
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "wifi_power";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		regulator-always-on;
> +	};

[Severity: High]
Does this regulator fail to power on the Wi-Fi/BT module?

This wifi_power fixed regulator applies pinctrl_vdd_mmc2 but lacks a
gpio =3D <...> property, so it acts as a dummy software regulator without
actively toggling any pins.

Furthermore, in pinctrl_vdd_mmc2 further down:

	pinctrl_vdd_mmc2: main-vdd-mmc2-default-pins {
		pinctrl-single,pins =3D <
			AM62X_IOPAD(0x00d8, PIN_INPUT, 7) /* (V21) VOUT0_DATA8.GPIO0_53 */
			AM62X_IOPAD(0x00dc, PIN_INPUT, 7) /* (W21) VOUT0_DATA9.GPIO0_54 */
			AM62X_IOPAD(0x00f0, PIN_INPUT, 7) /* (Y22) VOUT0_DATA14.GPIO0_59 */
			AM62X_IOPAD(0x00f4, PIN_INPUT, 7) /* (AA21) VOUT0_DATA15.GPIO0_60 */
		>;
	};

These four GPIOs are configured as PIN_INPUT (floating). If any of these are
hardware enable pins (like WL_EN), won't they remain unasserted and leave t=
he
module powered off?

> [ ... ]
> +	wm8904: audio-codec@1a {
> +		compatible =3D "wlf,wm8904";
> [ ... ]
> +		wlf,drc-cfg-regs =3D /bits/ 16 <0x01af 0x3248 0x0000 0x0000>,
> +				   /bits/ 16 <0x04af 0x324b 0x0010 0x0408>,
> +				   /bits/ 16 <0x04af 0x324b 0x0028 0x0704>,
> +				   /bits/ 16 <0x04af 0x324b 0x0018 0x078c>,
> +				   /bits/ 16 <0x04af 0x324b 0x0010 0x050e>;
> +		/* GPIO1 =3D DMIC_CLK, don't touch others */
> +		wlf,gpio-cfg =3D <0x0018>, <0xffff>, <0xffff>, <0xffff>;
> +	};

[Severity: Medium]
Are these DRC and GPIO configurations intended for this specific board?

This looks like a verbatim copy-paste from the device tree bindings example=
. It
forces GPIO1 to be driven as an output clock (wlf,gpio-cfg =3D <0x0018>). C=
ould
this cause electrical contention if GPIO1 is wired differently on the
VAR-SOM-AM62?

> [ ... ]
> +&mcu_pmx0 {
> +	pinctrl_wkup_clkout0: wkup-clkout0-default-pins {
> +		pinctrl-single,pins =3D <
> +			AM62PX_MCU_IOPAD(0x0084, PIN_OUTPUT, 0) /* (F13) WKUP_CLKOUT0 */
> +		>;
> +	};
> +};

[Severity: Low]
Should this use the AM62X_MCU_IOPAD macro instead of AM62PX_MCU_IOPAD?

The device tree is for an AM625, but this uses a macro intended for the AM6=
2P
SoC family.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783545241.gi=
t.stefano.r@variscite.com?part=3D2
