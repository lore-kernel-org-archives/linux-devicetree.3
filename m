Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7AB45D5E3
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 16:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787588040; cv=none; b=Qszo/Jh9YoEvL8eSu01uaVo7VtHX2USiH8H2+Ah44P5AkXOyoZcJWO8ZtDy4TLPTmN1FO5VvIl/Ln8+XF0u2S40B7BMPSlrJ0XSQASPJh2IdQnHDMiFhq6DS9tZ00W01cOovPaCaR/OZ4pI/8PaA277M9Nv2AyN3wZxSDyFbXh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787588040; c=relaxed/simple;
	bh=vqjuBEnaYQ/pQ8TiYiRsmVTkuRbe0aNzE+94oLLo+xo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OVtZC4/Ck99JQmW8A/EOu9l3i9Ki61H3FwWCpYZ6KCagChs55i64uhPqVB78IH0WQieSioWapAr/MbV5k48dorHuTgOSAxRj8zOf4B/ZVP5MRESZmlw3sEc1yxEbB35pI+8dlHx/sHKToUqIvY6zLfJ9SEWUqjFB30lPfYuauDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l/e5WVZH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l/e5WVZH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBA301F000E9;
	Mon, 24 Aug 2026 16:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787588038;
	bh=Sh2q4t0UDNxCcMMgTEKhHJM6MnAERQcf9Ta25pEAzH4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=l/e5WVZHSoWWfN2dtYU7w+3kjSvNeqEDxkk3xGDQUeyuwGQGde0sS7ebDVrj7LAYZ
	 U49cK6DwA+9i7IeTOlEXM1/wjvgF/MWfukOirRb3RLEOhUmUkjxYw5oBD1NS8lT/rk
	 ZUIYsxqCc6RvPMWpPS1rZuB2taFZUrOvywFzpclRRy8piWO3TebOgtBVDO3OpvERqw
	 eD9xLLrzYG8yVaZcEckal29tMz2aJdT8RlqRmVkUSlIXWSLy0ryzIfvm++IsT0LuFk
	 BVILuJNhsiMMOMxYMQ1eBQQlw2Hu1oFns8VoO6VL2+7LVAO1NWGBf4K9WAVfBERwRh
	 gr99LT5Wb1Flg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 3/4] arm64: dts: qcom: add basic devicetree for
 Ayaneo Pocket DS gaming console
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexandre Hamamdjian" <azkali.limited@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260824-pocketds-v6-3-370161574ca2@gmail.com>
References: <20260824-pocketds-v6-0-370161574ca2@gmail.com>
 <20260824-pocketds-v6-3-370161574ca2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 16:13:57 +0000
Message-Id: <20260824161357.EBA301F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The PWM fan control pin is actively driven HIGH during system su=
spend while the fan's power supply is disabled, causing leakage current and=
 potentially running the fan at 100% duty cycle if back-powered.
- [Low] PCIe child nodes have unit addresses that do not match the first ad=
dress cell of their 'reg' property.
--

--- Patch [3]: [PATCH v6 3/4] arm64: dts: qcom: add basic devicetree for Ay=
aneo Pocket DS gaming console ---
commit 44774ff01d05ab46cbf94f40052649086f920bb4
Author: Teguh Sobirin <teguh@sobir.in>

arm64: dts: qcom: add basic devicetree for Ayaneo Pocket DS gaming console

Adds initial Device Tree for the Ayaneo Pocket DS gaming console based
on the QCS8550 platform, wiring up core peripherals, USB-C/DP, microSD,=20
WiFi/BT, and gaming controls.

> diff --git a/arch/arm64/boot/dts/qcom/qcs8550-ayaneo-pocket-ds.dts b/arch=
/arm64/boot/dts/qcom/qcs8550-ayaneo-pocket-ds.dts
> new file mode 100644
> index 0000000000000..09b1c86cc3d35
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/qcs8550-ayaneo-pocket-ds.dts

[ ... ]

> +	vdd_fan_5v0: vdd-fan-5v0-regulator {
> +		compatible =3D "regulator-fixed";
> +
> +		regulator-name =3D "vdd_fan_5v0";
> +		regulator-min-microvolt =3D <5000000>;
> +		regulator-max-microvolt =3D <5000000>;
> +
> +		gpios =3D <&tlmm 31 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 =3D <&fan_pwr_active>;
> +		pinctrl-names =3D "default";
> +
> +		regulator-state-mem {
> +			regulator-off-in-suspend;
> +		};
> +	};

[ ... ]

> +&pm8550_gpios {

[ ... ]

> +	fan_pwm_sleep: fan-pwm-sleep-state {
> +		pins =3D "gpio9";
> +		function =3D "normal";
> +		output-high;

[Severity: Medium]
Does driving this pin high during suspend create a leakage path? Since
vdd_fan_5v0 is configured with regulator-off-in-suspend, actively driving
the control pin into an unpowered fan controller might cause back-powering.

> +		bias-disable;
> +		power-source =3D <0>;
> +		qcom,drive-strength =3D <3>; /* PMIC_GPIO_STRENGTH_LOW */
> +	};

[ ... ]

> +&pcie0_port0 {
> +	wifi@0 {
> +		compatible =3D "pci17cb,1107";
> +		reg =3D <0x10000 0x0 0x0 0x0 0x0>;

[Severity: Low]
Should the node name match the unit address in the reg property? It looks
like this should be wifi@10000 to avoid dtc validation warnings.

> +
> +		vddrfacmn-supply =3D <&vreg_pmu_rfa_cmn>;
> +		vddaon-supply =3D <&vreg_pmu_aon_0p59>;

[ ... ]

> +&pcie1_port0 {
> +	/* Renesas =CE=BCPD720201 PCIe USB3.0 HOST CONTROLLER */
> +	usb-controller@0 {
> +		compatible =3D "pci1912,0014";
> +		reg =3D <0x10000 0x0 0x0 0x0 0x0>;

[Severity: Low]
Should this node also be named usb-controller@10000 to match the first
address cell in the reg property?

> +
> +		avdd33-supply =3D <&upd720201_avdd33_reg>;
> +		vdd10-supply =3D <&upd720201_vdd10_reg>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824-pocketds-v=
6-0-370161574ca2@gmail.com?part=3D3
