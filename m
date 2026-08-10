Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0B1386C1E
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 17:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786382966; cv=none; b=V36D96iGK25qMPsLAO5dlNOEPJzWYOsC4mxjmtax6vNfnxSom7JUAnH5Dz7WoVTF/KFbbyIGMAtjN5t+Ev9O7kpe2wCAERIVejOPPi0s4i6pcWP1A8wHyVPMr2C26At/lQ3JxZimeVJPU6EyZOs/8j5ajWXa5qkrYC73QS9gUc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786382966; c=relaxed/simple;
	bh=Ox3BQxy33rzGehWh2cUhEUbBpbMJt7u13m3lAb7l4Is=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=npdrLQU8hCpggMncm6//vUjitGLKpMkdquStdOpmTrIjLM/0QWXUQ9VZDLC2IjAGdC71ak1q93+HAgNdJ5Gwt10GhCtR2n/Zwqso6/ECj/7A46y42/LvzdvcrYPiWakQPdBW6OWQp5AZrA2PAq8KmCxpUSsRTw1rzZcwPi4ekcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aMJd3ZqY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aMJd3ZqY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D1DC1F000E9;
	Mon, 10 Aug 2026 17:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786382965;
	bh=lde1Wn/rjdG1fctVL0DBCM8zAY7q5tacJPoWEQujYGI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aMJd3ZqY6UID/wH5Ib8lDB2jMDCRRCB4FDNxuGP7ZU00dDaV+nw7/7R75u0hzi7tM
	 NApS3l6dBmEvvkDoLbSdVyGQP1CoHQRYmuSt6TEo78LwZUFT/R/K0aaqQdkm/PyGg+
	 GOAqfQ4odCuhcOd1IeEZfsxCf4OsaADepCM3UrfficNhnYsY5svltliiS0le8YBZ43
	 b/nj04U3phV6/4Sn+9yk9X0gf54t0Dam9/mZTU7t9ITelt7YVjxoQGJa8ngrkRk5mI
	 1DcpbfYo7WrYjgSIZwjlXG+uQyZdETFz26iGE5wpnkrD+BGCdooKMXZn28Dg5reX10
	 vYzXeWVnVYLLw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/7] arm64: dts: qcom: Add Motorola One
Reply-To: sashiko-reviews@lists.linux.dev
To: "Adam Skladowski" <a39.skl@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260810-next-patches-v1-3-79a779d76173@gmail.com>
References: <20260810-next-patches-v1-0-79a779d76173@gmail.com>
 <20260810-next-patches-v1-3-79a779d76173@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 17:29:23 +0000
Message-Id: <20260810172925.3D1DC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Missing `vdd_l23-supply` parent supply linkage for the PM8953 L23 =
regulator.
- [High] Missing `vcc-supply` for the Novatek touchscreen.
- [High] The `fcs,fusb302` device specifies an incorrect interrupt polarity=
 (`IRQ_TYPE_EDGE_RISING`) for its INT_N pin.
- [Medium] Mismatch between the configured Audio Front End (AFE) DAI, physi=
cal GPIO pin functions, and unused pinctrl nodes for the MI2S interface.
- [Low] Misleading node name `pn533@28` for an NXP NCI compatible device.
--

--- Patch [3]: [PATCH 3/7] arm64: dts: qcom: Add Motorola One ---
commit 3b67d53db687653cc242076136d9090f07f776ff
Author: Adam Skladowski <a39.skl@gmail.com>

arm64: dts: qcom: Add Motorola One

Add a devicetree for the Motorola One smartphone, which is based
on the Jacala/MSM8953 SoC.

> diff --git a/arch/arm64/boot/dts/qcom/msm8953-motorola-deen.dts b/arch/ar=
m64/boot/dts/qcom/msm8953-motorola-deen.dts
> new file mode 100644
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/msm8953-motorola-deen.dts

[ ... ]

> +&i2c_1 {
> +	status =3D "disabled";
> +
> +	typec-portc@22 {
> +		compatible =3D "fcs,fusb302";
> +		reg =3D <0x22>;
> +		interrupts-extended =3D <&tlmm 9 IRQ_TYPE_EDGE_RISING>;

[Severity: High]
The FUSB302 INT_N pin is an active-low open-drain output, but this interrupt
is configured as IRQ_TYPE_EDGE_RISING.

Will the host miss interrupts since the FUSB302 holds the line low until
cleared, causing a deadlock while the host waits for a rising edge?

Does this regression break Type-C functionality like PD negotiation and
role swapping?

[ ... ]

> +&i2c_3 {
> +	status =3D "okay";
> +
> +	touchscreen@62 {
> +		compatible =3D "novatek,nt36672a-ts";
> +		reg =3D <0x62>;
> +
> +		interrupts-extended =3D <&tlmm 65 IRQ_TYPE_EDGE_RISING>;
> +		reset-gpios =3D <&tlmm 64 GPIO_ACTIVE_LOW>;
> +
> +		iovcc-supply =3D <&pm8953_l6>;

[Severity: High]
Does the novatek,nt36672a-ts driver also require a vcc-supply to be
specified here?

Omitting it means devm_regulator_bulk_get() might fall back to a dummy
regulator, preventing the physical analog power rail from being enabled.
Does this cause a regression where touchscreen initialization fails?

> +
> +		pinctrl-0 =3D <&ts_reset_default &ts_int_default>;

[ ... ]

> +&i2c_5 {
> +	status =3D "okay";
> +
> +	npc100: pn533@28 {
> +		compatible =3D "nxp,nxp-nci-i2c";

[Severity: Low]
Since the compatible string specifies a generic nxp,nxp-nci-i2c controller,
should this node be named with a generic device class like nfc@28 instead of
a specific chip name like pn533@28 to avoid a naming regression?

> +
> +		reg =3D <0x28>;

[ ... ]

> +&q6afedai {
> +	dai@22 {
> +		reg =3D <QUATERNARY_MI2S_RX>;
> +		qcom,sd-lines =3D <0>;
> +	};

[Severity: Medium]
Is the Audio Front End configured correctly here?

This q6afedai node specifies QUATERNARY_MI2S_RX, but the mi2s_sec_act pinct=
rl
states added below configure pins 135-138 with the sec_mi2s function.

Could this interface mismatch cause an audio regression on this port?

[ ... ]

> +&rpm_requests {
> +	regulators {
> +		compatible =3D "qcom,rpm-pm8953-regulators";
> +		vdd_s1-supply =3D <&vph_pwr>;
[ ... ]
> +		vdd_l8_l11_l12_l13_l14_l15-supply =3D <&vph_pwr>;
> +		vdd_l9_l10_l17_l18_l22-supply =3D <&vph_pwr>;
> +
> +		pm8953_s1: s1 {

[Severity: High]
Is there a missing vdd_l23-supply linkage in this parent supply mapping blo=
ck?

Without mapping vdd_l23-supply to pm8953_s3, the regulator framework is
unaware of the dependency. If the system disables L1, L2, and L3, the PMIC
core might power down S3, starving L23 of its input voltage.

Does this regression lead to a hardware brownout?

[ ... ]

> +		pm8953_l22: l22 {
> +			regulator-always-on;
> +			regulator-min-microvolt =3D <2800000>;
> +			regulator-max-microvolt =3D <2850000>;
> +		};
> +
> +		pm8953_l23: l23 {
> +			regulator-min-microvolt =3D <975000>;
> +			regulator-max-microvolt =3D <1225000>;
> +		};

[ ... ]

> +&tlmm {
> +	gpio-reserved-ranges =3D <96 4>, <111 1>, <126 1>;
[ ... ]
> +	mi2s_sec_act: mi2s-quat-active-state {
> +		pins =3D "gpio135", "gpio136", "gpio137", "gpio138";
> +		function =3D "sec_mi2s";
> +		drive-strength =3D <8>;
> +	};

[Severity: Medium]
These secondary MI2S pinctrl states appear to be unreferenced dead code.
Should they be tied to the DAI node above to prevent a configuration
regression?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810-next-patch=
es-v1-0-79a779d76173@gmail.com?part=3D3
