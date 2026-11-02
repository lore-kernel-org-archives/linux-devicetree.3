Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793640395;
	b=Lf3c2WoUkJdQdfbLfR9GPNKPP45lsNGlK6vvsVcv9KPpj6hyXYspmR1zItg8zbtUPQL2
	 ++qTcloh/crsJnjPNVoKn9dAx68UiYLw4oozTisg1aiiwaq+vfeC1x3gw0N1B/4tcyyNF
	 SnRF6KBy3D+ztNQwQFuRLTSb+x5Qq0nCLqpWV7rKdWiuW3Hw7pEAXJauCyvSezefiaSZz
	 Uckr0g27JMQiNOyStgdbOFMxjlhkWY/X9SgB6ZBTS4+5ilmCYhTQkbQ4DoS5rt27i7f2h
	 5k2RcPWw95Zd3pXWeDgGWU+k1fUebnWRhI2Kx8riXChqckalSXFtApXX+4jBEsM3vlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793640395;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=4NFkZvh8yZZeBj4T/8Z9wX+JIuuWvwfXpvvZHK5Pf80=;
	b=AL6kNGh6oI71qPgs3kYb/becpdBrNb8B3JT79How55moZjWk5Kpyts10z6oJqRwVT+JL
	 78OS6E748Uj35Lxxi40RMLaqZUQs9xmslUpMGd7ua/QDgcn1beS9WQpYx+/l5tA7Pfup0
	 vtIbiosMtfHjlL+GIloBRPUc1/77e1GDPR69ME7eJ93Mkq+mb9KtOljKhep3vM2PU39RT
	 hhrFu4QDSeniJlunDcpjDbnprRZ2VWji5spHlvwmEzxzGNAo5aw7USA1RKUGEexhkQp7h
	 d2/rsacSvuWIQZxntQZkS/NquctcQJX1uoDK/Mk46yL/RQ4xYgxMomGlPECs79KHhmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="H/+titWU";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88CB8606A329
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 17:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H/+titWU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB7951F00A23;
	Mon,  2 Nov 2026 17:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793640395;
	bh=4NFkZvh8yZZeBj4T/8Z9wX+JIuuWvwfXpvvZHK5Pf80=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H/+titWUYYJCiu67xwJio1ey7qLzuC3jUY7kAF5wmUyGPtwWoHVcM8oO4XeAoHtS/
	 q2/OYgAcViqoJVkH3ez6C4Ny2MeaGTIcZO7IiNZMmYtjEe0loNmwdQRLWGxZ89laZx
	 c/4rKMH6rrTerlJ6tLq3DT0TjpTRdAQAk6JFYWfjHhBP9jPz3rtOzLr0hDaCjKDK6Y
	 sTtl2aMljPhHygkKee6ootAtCJlBDZZ3e+11jGkfM/14oC9iyCvtUjeLiVtlODjM9J
	 qd6jWUsloL84iEi+E3wCqRiNP2wXUW/n2ULlK9ttPYuVviYdcUBF1GU4iR8XSiF8Gx
	 tjOF0Qy1tJnqg==
Message-ID: <sashiko-outbox-193831@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 6/6] arm64: dts: rockchip: fix modem power supply on
 Photonicat
Reply-To: sashiko-reviews@lists.linux.dev
To: "Coia Prant" <coiaprant@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261102171838.2958552-7-coiaprant@gmail.com>
References: <20261102171838.2958552-1-coiaprant@gmail.com>
 <20261102171838.2958552-7-coiaprant@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 17:26:34 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] arm64: dts: rockchip: vbat min/max microvolt mismatch fails probe
- [Medium] arm64: dts: rockchip: vcc3v4_rf vin-supply change has no runtime=
 effect
- [Medium] arm64: dts: rockchip: vcc5v0_usb30_otg0 leaves regulator_5v_out =
unused
--

commit e4c4248e8e73884f2860befcec1dafef98cd711c
Author: Coia Prant <coiaprant@gmail.com>

arm64: dts: rockchip: fix modem power supply on Photonicat

This commit changes the vin-supply of the vcc3v4_rf regulator from vccin_5v
to vcc_syson in the Ariaboard Photonicat RK3568 device tree to match the
hardware schematic and keep the M.2 5G modem powered on battery.

Link: https://github.com/photonicat/photonicat-hardware/blob/main/Photonica=
t_rk3568_sch_20221116.pdf (Page 18)

> diff --git a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts b/arch/ar=
m64/boot/dts/rockchip/rk3568-photonicat.dts
> index 4d362f665031c..6a51f97395741 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
> @@ -169,7 +169,7 @@ vcc3v4_rf: regulator-vcc3v4-rf {
>  		regulator-name =3D "vcc3v4_rf";
>  		regulator-min-microvolt =3D <3400000>;
>  		regulator-max-microvolt =3D <3400000>;
> -		vin-supply =3D <&vccin_5v>;
> +		vin-supply =3D <&vcc_syson>;
>  	};

[Severity: Medium]
Does reparenting vcc3v4_rf from vccin_5v to vcc_syson actually change the
hardware power state when running on battery, as described in the commit
message?

In arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts, vccin_5v, vcc_sysin,
and vcc_syson are all regulator-fixed nodes marked regulator-always-on and
regulator-boot-on with no GPIO, clock, or power-domain control, and vcc_sys=
on
chains directly back to vccin_5v:

	vccin_5v: regulator-vccin-5v {
		compatible =3D "regulator-fixed";
		regulator-name =3D "vccin_5v";
		regulator-always-on;
		regulator-boot-on;
		regulator-min-microvolt =3D <5000000>;
		regulator-max-microvolt =3D <5000000>;
	};

	vcc_sysin: regulator-vcc-sysin {
		compatible =3D "regulator-fixed";
		regulator-name =3D "vcc_sysin";
		regulator-always-on;
		regulator-boot-on;
		regulator-min-microvolt =3D <5000000>;
		regulator-max-microvolt =3D <5000000>;
		vin-supply =3D <&vccin_5v>;
	};

	vcc_syson: regulator-vcc-syson {
		compatible =3D "regulator-fixed";
		regulator-name =3D "vcc_syson";
		regulator-always-on;
		regulator-boot-on;
		regulator-min-microvolt =3D <5000000>;
		regulator-max-microvolt =3D <5000000>;
		vin-supply =3D <&vcc_sysin>;
	};

In reg_fixed_voltage_probe() in drivers/regulator/fixed.c, a fixed regulator
without a GPIO, clock, or PM domain uses empty fixed_voltage_ops and perfor=
ms
no hardware switching.

Should the commit message clarify that this only updates the DT supply
hierarchy to match the schematic, or is there a controllable switch or boost
regulator needed to power the modem on battery?

> =20
>  	vcc5v0_usb30_otg0: regulator-vcc5v0-usb30-otg0 {

[Severity: High]
In commit cf017fdefcec ("arm64: dts: rockchip: fix USB OTG power on Photoni=
cat
in battery mode") earlier in this series, vcc5v0_usb30_otg0 was updated to
depend on regulator_5v_boost, which in turn depends on the newly added vbat
fixed regulator:

	regulator_5v_boost: regulator-5v-boost {
		...
		vin-supply =3D <&vbat>;
	};
	...
	vbat: regulator-vbat {
		compatible =3D "regulator-fixed";
		regulator-name =3D "vbat";
		regulator-min-microvolt =3D <3400000>;
		regulator-max-microvolt =3D <4200000>;
		regulator-always-on;
		regulator-boot-on;
	};

However, reg_fixed_voltage_probe() -> of_get_fixed_voltage_config() in
drivers/regulator/fixed.c requires regulator-min-microvolt and
regulator-max-microvolt to be equal for a regulator-fixed node:

	if (init_data->constraints.min_uV =3D=3D init_data->constraints.max_uV) {
		config->microvolts =3D init_data->constraints.min_uV;
	} else {
		dev_err(dev,
			 "Fixed regulator specified with variable voltages\n");
		return ERR_PTR(-EINVAL);
	}

Won't vbat fail to probe with -EINVAL, causing regulator_5v_boost,
regulator_5v_out, vcc5v0_usb30_otg0, and the consumer USB2 OTG PHY nodes
(usb2phy0_otg and usb2phy1_otg) to permanently defer with -EPROBE_DEFER?

[Severity: Medium]
Also in arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts, the comment abo=
ve
regulator_5v_out states that 5V_OUT supplies VCC5V0_USB30_OTG0:

	/*
	 * ...
	 * 5V_OUT supplies:
	 * - VCC5V0_USB30_OTG0 (USB VBUS via U12 load switch)
	 * - VCC5V_HDMI (HDMI 5V via D5000)
	 * - J53 expansion header (Pin 1)
	 */
	regulator_5v_out: regulator-5v-out {
		compatible =3D "regulator-fixed";
		regulator-name =3D "5v_out";
		regulator-min-microvolt =3D <5000000>;
		regulator-max-microvolt =3D <5000000>;
		vin-supply =3D <&regulator_5v_boost>;
	};

However, vcc5v0_usb30_otg0 sets vin-supply to regulator_5v_boost directly,
leaving regulator_5v_out completely unreferenced in the device tree:

	vcc5v0_usb30_otg0: regulator-vcc5v0-usb30-otg0 {
		...
		vin-supply =3D <&regulator_5v_boost>;
	};

Should vcc5v0_usb30_otg0 use vin-supply =3D <&regulator_5v_out> instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102171838.2958=
552-1-coiaprant@gmail.com?part=3D6
