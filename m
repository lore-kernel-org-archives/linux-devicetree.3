Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793962824;
	b=dd9NuHtAws5IdU9FDGciT4uory1CAC4PyBVLNeIyb68XktHcCp3AocCy/7OE4G+hSYyh
	 nWY/Eg/2+P52YOYrSJ+1g2/x58b6XdPEZR1dRe78NVl4PxG6HXvouPR1aq/CjUt1xgEKZ
	 OjdDpcd2U58xYKzJEx3MbY2iT7moyTzqCzK0IkgXEq6UnDwigzgrTmAgxsEF19y7yF+eI
	 8j4Eb7XnllkqtmGDNyUGUzULqoYE6Dl8GJVlkQzVy/qGrc6qqgzE7L+8UHGNEgpwUU1Tu
	 iUA7qcKLGigwGN4Z/Bki1E89gESJ0cuxrwINPb5YsKs0ypBi9gaZ8o2dwJnWAHa2NBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793962824;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=hwHd99ywMgYwfJC1nFZNiGjzvWRJKWtVA7N0uQzzsGY=;
	b=Nvp3oUICLjIQov6F3wKtKAKy+zC1ZpcyqfKyHJyY5Snq714AAsH3sBdh7zcQTOBrgfCj
	 SLkUgXmVR+vETXhTHam1tjy+JC6Qbd4tXCTyZCQ6xIHEsRvYWCRZFJodcMk/Jk/s5USvE
	 dTLz/5pk2eCNUnl+2r2bB/I/O+x61rdqhwbbpVpjFHAcMNKkvb2Ncq8iquvRVLlXwqGwV
	 9qo7bqbODnyY0B27gcVvEwJQgVD+AeR/zXM873sC7YxztyPZZ2OZ2hXoMBZDKLHoQ5yA5
	 0lGkJEWKdu5xd9tlFRKLjP3e3hcyvc1CgLFSkInimGEYFWtOK8L/8Du4HGPsx33Xj0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bkXh24YF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F35F606A32D
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 11:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bkXh24YF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C64B41F0089F;
	Fri,  6 Nov 2026 11:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793962824;
	bh=hwHd99ywMgYwfJC1nFZNiGjzvWRJKWtVA7N0uQzzsGY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bkXh24YFsYWI3AYpdeunIZ8hrEcnswsYlNowlcu6cYloJVAk8w6aQMQ7GpRKor8yL
	 btjxAIpK2k/khTYn7nImZzjzv9orRJHXhNAaxPg2JPmOjC7vrJKbd2nL6imlrd1yhF
	 etbuWTm5zLTEMJaBHAjV8FRdYRblPtyH6nSHB8Ygml0bb8Hg1kCTaIW35YQuGdLDBc
	 Mb+JOjZqFMOjqAcH44DjbyZnZCuwXbeg/etZS1rlOwcSgsSHU9u5hmjvoYiegsyDtO
	 70nJOAsU5n1Enwc9hpZONtmgYVOcyA3YLrI7EJyyZy2NXSLpCpwGf5wfto2dtqUYb/
	 DzriljvgI/pqA==
Message-ID: <sashiko-outbox-201263@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 10/10] arm64: dts: amlogic: add the Amediatech X98Q
Reply-To: sashiko-reviews@lists.linux.dev
To: christian.koever-draxl@student.uibk.ac.at
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20261106104659.54656-11-christian.koever-draxl@student.uibk.ac.at>
References: <20261106104659.54656-1-christian.koever-draxl@student.uibk.ac.at>
 <20261106104659.54656-11-christian.koever-draxl@student.uibk.ac.at>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 11:00:23 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 5 potential
issues to consider:
- [High] arm64: dts: amlogic: unimplemented amlogic,core-phase-degrees
  in x98q sd node
- [Medium] arm64: dts: amlogic: invalid rc-x98q map and wakeup-source on
  x98q ir node
- [Medium] arm64: dts: amlogic: unimplemented amlogic,shared-antenna on
  x98q bluetooth
- [Medium] arm64: dts: amlogic: x98q enables S4 usb, ge2d, and thermal
  without drivers
- [Low] arm64: dts: amlogic: unused sd_3v3 regulator claiming GPIOD_4 in
  x98q dts
--

commit 3b50767a39ee59efef6457c4aa95bbf033834748
Author: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>

arm64: dts: amlogic: add the Amediatech X98Q

This commit adds the device tree for the Amediatech X98Q TV box based on
the Amlogic S905W2 SoC.

> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4-s905w2-x98q.dts b/arch/=
arm64/boot/dts/amlogic/meson-s4-s905w2-x98q.dts
> new file mode 100644
> index 0000000000000..388198756a3a2
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4-s905w2-x98q.dts

[ ... ]

> +	sd_3v3: regulator-sd-3v3 {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "SD_3V3";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		gpio =3D <&gpio GPIOD_4 GPIO_ACTIVE_LOW>;
> +		regulator-always-on;
> +	};

[Severity: Low]
Should &sd use &sd_3v3 for vmmc-supply, or is regulator-sd-3v3 unused on
this board?

regulator-sd-3v3 claims GPIOD_4 and drives it low at boot via
regulator-always-on, but &sd below sets both vmmc-supply and vqmmc-supply
to &vddao_3v3, leaving &sd_3v3 unreferenced.

[ ... ]

> +&ir {
> +	pinctrl-0 =3D <&remote_pins>;
> +	pinctrl-names =3D "default";
> +	linux,rc-map-name =3D "rc-x98q";
> +	wakeup-source;
> +	status =3D "okay";
> +};

[Severity: Medium]
Are "rc-x98q" and wakeup-source supported on &ir?

"rc-x98q" is not in Documentation/devicetree/bindings/media/rc.yaml or
drivers/media/rc/keymaps/.  At probe, rc_prepare_rx_device() falls back to
RC_MAP_EMPTY (RC_PROTO_UNKNOWN) and passes that to
meson_ir_hw_decoder_init(), which returns early without setting
IR_DEC_REG1_ENABLE when RC_PROTO_BIT_NEC is not set, leaving the hardware
IR decoder disabled until reconfigured from userspace.

In addition, Documentation/devicetree/bindings/media/amlogic,meson6-ir.yaml
sets unevaluatedProperties: false and does not allow wakeup-source, and
drivers/media/rc/meson-ir.c does not configure wakeup support and disables
IR_DEC_REG1_ENABLE in meson_ir_suspend().

[ ... ]

> +&sd {
> +	pinctrl-0 =3D <&sdcard_pins>;
> +	pinctrl-1 =3D <&sdcard_clk_gate_pins>;
> +	pinctrl-names =3D "default", "clk-gate";
> +	bus-width =3D <4>;
> +	cap-sd-highspeed;
> +	/* Fails CRC at 50 MHz with the default 180 degree phase */
> +	amlogic,core-phase-degrees =3D <270>;
> +	max-frequency =3D <50000000>;

[Severity: High]
Does amlogic,core-phase-degrees have any effect in mainline?

Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml sets
unevaluatedProperties: false and does not define
amlogic,core-phase-degrees, so dtbs_check fails.  At runtime,
meson_mmc_clk_init() in drivers/mmc/host/meson-gx-mmc.c unconditionally
programs CLK_PHASE_180 and never parses this property, leaving the SD
controller at the 180-degree phase where 50 MHz high-speed transfers fail
with CRC errors.

[ ... ]

> +&uart_a {
> +	pinctrl-0 =3D <&uart_a_pins>, <&uart_a_cts_rts_pins>;
> +	pinctrl-names =3D "default";
> +	uart-has-rtscts;
> +	status =3D "okay";
> +
> +	/* Bluetooth half of the Amlogic W1 combo chip */
> +	bluetooth {
> +		compatible =3D "amlogic,w155s2-bt";
> +		clocks =3D <&sdio_32k>;
> +		enable-gpios =3D <&gpio GPIOX_17 GPIO_ACTIVE_HIGH>;
> +		vddio-supply =3D <&vddio_ao1v8>;
> +		firmware-name =3D "amlogic/aml_w1_bt_uart.bin";
> +		amlogic,shared-antenna;
> +	};
> +};

[Severity: Medium]
Is amlogic,shared-antenna supported by the binding or driver for
amlogic,w155s2-bt?

Documentation/devicetree/bindings/net/bluetooth/amlogic,w155s2-bt.yaml
sets additionalProperties: false and does not define
amlogic,shared-antenna.  In drivers/bluetooth/hci_aml.c, aml_parse_dt()
does not read this property and aml_setup() passes
amldev->aml_dev_data->is_coex (false for data_w155s2) to aml_config_rf(),
configuring AML_RF_ANT_DOUBLE instead of AML_RF_ANT_SINGLE.

[ ... ]

> +&usb {
> +	status =3D "okay";
> +};
> +
> +&usb2_phy0 {
> +	status =3D "okay";
> +};
> +
> +&usb2_phy1 {
> +	status =3D "okay";
> +};

[Severity: Medium]
Can &usb, &ge2d, or GPU thermal throttling probe with the compatibles in
meson-s4.dtsi?

In arch/arm64/boot/dts/amlogic/meson-s4.dtsi, usb2_phy0 and usb2_phy1 use
compatible =3D "amlogic,s4-usb2-phy" without an "amlogic,g12a-usb2-phy"
fallback, while drivers/phy/amlogic/phy-meson-g12a-usb2.c only matches
"amlogic,g12a-usb2-phy" and "amlogic,a1-usb2-phy", causing
dwc3_meson_g12a_probe() to defer indefinitely in dwc3_meson_g12a_get_phys().
Also, usb2_phy0 and usb2_phy1 are already enabled in meson-s4.dtsi, so the
status overrides here are redundant.

Similarly, &ge2d uses "amlogic,s4-ge2d" without an "amlogic,axg-ge2d"
fallback (drivers/media/platform/amlogic/meson-ge2d/ge2d.c only matches
"amlogic,axg-ge2d"), and cpu_temp uses "amlogic,s4-thermal" without an
"amlogic,t7-thermal" fallback (drivers/thermal/amlogic_thermal.c only
matches "amlogic,t7-thermal"), so neither GE2D nor GPU thermal throttling
binds a driver despite being listed as supported in the commit message.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106104659.5465=
6-1-christian.koever-draxl@student.uibk.ac.at?part=3D10
