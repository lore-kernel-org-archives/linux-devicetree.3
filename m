Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794511543;
	b=NIGUs3wuluuUeBJ6REl8RncP1XmgCN6R6fPiEuQzqROITxE6VcqYmRZ/s/YtdXHee8uH
	 Lp7oC8dOcemFJE8ZSSoC0/V6Qjpq8/hbNjz5QeeHJWjeXdYyzDVoGwyXJyKmwvuA2HooL
	 jFqoqpdFhciIKrS6gvgyBF77h8u0Akf3iHMTAaCcKqmn5TsoFRJLAaomZ1qMDvv4v8z1X
	 KJwSTjAhbyG43S/ZQMa6MAkhm4G7R2LRgIewc3X8Kw3GndnwnP9LfKf7MHsee7aY1WY/J
	 9W+vyw3UtEWgc8yGSkmJ9a6VGTdUrx5u7a7KmiQoyH3UznQloDDcTsYDPBQZZiL5Pew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794511543;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Q4vhxB9pxT/lU3L9aTka1/HJCMl9rGDHoPT+lQ+7FN4=;
	b=LtpsaAJjf/ZhtuJs0uSEBMWLr2/p9Fnllct1lWednVe5M5QaJS1UW6rQrtPr8B1GO7zc
	 BSZyrdWT9j2EObTbX+rmWPaCEZMsDFngLrR+lnxQPZXdfva1i1fk602r+gogVa7kDCRDy
	 HOdUUdPi4RceaUEzk1BT4d3oUIhGULclSBhchb4J2j6b1Z7mmyOyP6luujmUocKkD96f0
	 bMsaudwrh3Uu5pZ9qE5Jc1SnIbGVdZkThSHccmR+dm6aIX4sHSYB24eFM+NdCdrp9x+Ta
	 ximAEgR3zXQIoOSgFCOytC3EhK5HJbXTz5vYp8NStNzYaSZphpKnD7rEqVPgtGj+Ksw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Qwo/ANfa";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B82606A321
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 19:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qwo/ANfa
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D447A1F000C4;
	Thu, 12 Nov 2026 19:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794511543;
	bh=Q4vhxB9pxT/lU3L9aTka1/HJCMl9rGDHoPT+lQ+7FN4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Qwo/ANfasCelIXFVDQJWHl39lC7T367LWYpvR1pMk4YWb0zHyeDrZZd8DRP7UW14i
	 o6F8xUu+puJyHafLThkw3F9m6oS2YM1nLOUWKB2QcaREWNlVrSbfrTS7iS2Mmc8v+l
	 d4xJN4sRskqmM7371IPKC5K9a+m4R5hK72sRPDjDYogQbil18iR2h9s2f/aNDPiZM4
	 v5k9DQ5adhKAb9xC7Mt8v0TJnTs1cF1YUNJagLhgw0J4edtL5w0LLp3KvRHdOUCkos
	 UECvJE5uVBEuquy+Y0buXt034j6hU6XaxxXSbXWGIinzpKkWOwcABkjuvBM6FNLTcD
	 smzABFENfybYg==
Message-ID: <sashiko-outbox-211760@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] arm64: dts: renesas: r9a08g046: Add SDHI nodes for
 RZ/G3L SoC and SDHI1 pincontrol on SMARC EVK
Reply-To: sashiko-reviews@lists.linux.dev
To: "Biju Das" <biju.das.au@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20261112-sdhi_rzg3l-v1-1-ca30b209615d@bp.renesas.com>
References: <20261112-sdhi_rzg3l-v1-0-ca30b209615d@bp.renesas.com>
 <20261112-sdhi_rzg3l-v1-1-ca30b209615d@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 19:25:42 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential
issues to consider:
- [High] arm64: dts: renesas: r9a08g046: undocumented SDHI compatible,
  clocks, and resets
- [Medium] arm64: dts: renesas: r9a08g046l48-smarc: sdhi1 left enabled
  when RZ_BOOT_MODE3=3D0
- [Medium] arm64: dts: renesas: r9a08g046l48-smarc: missing pull-up and
  no-op UHS pinconf
- [Medium] arm64: dts: renesas: r9a08g046: SDHI power-source not wired
  in pinctrl-rzg2l
--

commit c182c80f2e51018770e032cd10fb901dca56ea0e
Author: Biju Das <biju.das.jz@bp.renesas.com>

arm64: dts: renesas: r9a08g046: Add SDHI nodes for RZ/G3L SoC and SDHI1 pin=
control on SMARC EVK

This commit adds device tree nodes for the three SDHI controllers on the
RZ/G3L SoC (r9a08g046) and configures SDHI1 pinmux and voltage regulator
nodes on the RZ/G3L SMARC EVK board.

> diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot=
/dts/renesas/r9a08g046.dtsi
> index c63a857f0e5b0..3665ccbdd91be 100644
> --- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> @@ -762,9 +762,80 @@ dmac: dma-controller@11820000 {
>  			dma-channels =3D <16>;
>  		};
> =20
> +		sdhi0: mmc@11c00000 {
> +			compatible =3D "renesas,sdhi-r9a08g046";
> +			reg =3D <0x0 0x11c00000 0 0x10000>;
> +			interrupts =3D <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&cpg CPG_MOD R9A08G046_SDHI0_IMCLK>,
> +				 <&cpg CPG_MOD R9A08G046_SDHI0_CLK_HS>,
> +				 <&cpg CPG_MOD R9A08G046_SDHI0_IMCLK2>,
> +				 <&cpg CPG_MOD R9A08G046_SDHI0_IACLKM>,
> +				 <&cpg CPG_MOD R9A08G046_SDHI0_IACLKS>;
> +			clock-names =3D "core", "clkh", "cd", "aclkm", "aclks";
> +			max-frequency =3D <150000000>;
> +			resets =3D <&cpg R9A08G046_SDHI0_IXRST>,
> +				 <&cpg R9A08G046_SDHI0_IXRSTAXIM>,
> +				 <&cpg R9A08G046_SDHI0_IXRSTAXIS>;
> +			reset-names =3D "rst", "axim", "axis";
> +			power-domains =3D <&cpg>;
> +			status =3D "disabled";
> +		};

[Severity: High]
Can sdhi0, sdhi1, and sdhi2 bind to the Renesas SDHI driver or pass
dtbs_check with these properties?

"renesas,sdhi-r9a08g046" has no fallback compatible string and is not prese=
nt
in renesas_sdhi_internal_dmac_of_match or
Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml.  The binding schema
also restricts clocks and clock-names to at most 4 entries, restricts resets
to 1 entry without reset-names, and only permits the vqmmc-regulator child
node (added under sdhi1 and sdhi2 below) for "renesas,sdhi-r9a09g057".  In
addition, renesas_sdhi_probe() only requests a single unnamed reset via
devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev, NULL),
leaving the axim and axis resets unmanaged.

> diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts b/arch/ar=
m64/boot/dts/renesas/r9a08g046l48-smarc.dts
> index 5289efd1a430a..0b6b7e109200f 100644
> --- a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
> @@ -14,6 +14,7 @@
>  #define SW_GPIO4		1
>  #define SW_I3C_EN		0
>  #define SW_SER0_PMOD		1
> +#define SW_SDIO_M2E		0
> =20
>  #define PMOD_GPIO4		0
>  #define PMOD_GPIO6		0
> @@ -38,6 +39,7 @@ / {
>  	aliases {
>  		i2c2 =3D &i2c2;
>  		i2c3 =3D &i2c3;
> +		mmc1 =3D &sdhi1;
>  		serial0 =3D &rsci2;
>  		serial1 =3D &rsci3;
>  		serial2 =3D &rsci1;

[ ... ]

> @@ -175,6 +190,68 @@ scif0_pins: scif0 {
>  		power-source =3D <1800>;
>  	};
> =20
> +#if RZ_BOOT_MODE3
> +	sd1-pwr-en-hog {
> +		gpio-hog;
> +		gpios =3D <RZG3L_GPIO(J, 2) GPIO_ACTIVE_HIGH>;
> +		output-high;
> +		line-name =3D "sd1_pwr_en";
> +	};
> +#endif
> +
> +	sdhi1_pins: sd1 {
> +		sd1-cd {
> +			pinmux =3D <RZG3L_PORT_PINMUX(J, 0, 8)>; /* SD1_CD */
> +		};
> +
> +		sd1-clk {
> +			pinmux =3D <RZG3L_PORT_PINMUX(G, 0, 1)>; /* SD1_CLK */
> +			power-source =3D <3300>;
> +		};
> +
> +		sd1-cmd {
> +			pinmux =3D <RZG3L_PORT_PINMUX(G, 1, 1)>; /* SD1_CMD */
> +			input-enable;
> +			power-source =3D <3300>;
> +			bias-pull-up;
> +		};
> +
> +		sd1-data {
> +			pinmux =3D <RZG3L_PORT_PINMUX(G, 2, 1)>, /* SD1_DAT0 */
> +				 <RZG3L_PORT_PINMUX(G, 3, 1)>, /* SD1_DAT1 */
> +				 <RZG3L_PORT_PINMUX(G, 4, 1)>, /* SD1_DAT2 */
> +				 <RZG3L_PORT_PINMUX(G, 5, 1)>; /* SD1_DAT3 */
> +			input-enable;
> +			power-source =3D <3300>;
> +		};
> +	};
> +
> +	sdhi1_uhs_pins: sd1-uhs {
> +		sd1-cd {
> +			pinmux =3D <RZG3L_PORT_PINMUX(J, 0, 8)>; /* SD1_CD */
> +		};
> +
> +		sd1-clk {
> +			pinmux =3D <RZG3L_PORT_PINMUX(G, 0, 1)>; /* SD1_CLK */
> +			power-source =3D <1800>;
> +		};
> +
> +		sd1-cmd {
> +			pinmux =3D <RZG3L_PORT_PINMUX(G, 1, 1)>; /* SD1_CMD */
> +			input-enable;
> +			power-source =3D <1800>;
> +		};

[Severity: Medium]
Should sd1-cmd in sdhi1_uhs_pins also keep bias-pull-up like sd1-cmd in
sdhi1_pins?  Also, neither sdhi1_pins nor sdhi1_uhs_pins specifies
drive-strength-microamp on the PG0..PG5 pins, where PIN_CFG_SOFT_PS only
uses power-source to select the drive-strength table.

> +
> +		sd1-data {
> +			pinmux =3D <RZG3L_PORT_PINMUX(G, 2, 1)>, /* SD1_DAT0 */
> +				 <RZG3L_PORT_PINMUX(G, 3, 1)>, /* SD1_DAT1 */
> +				 <RZG3L_PORT_PINMUX(G, 4, 1)>, /* SD1_DAT2 */
> +				 <RZG3L_PORT_PINMUX(G, 5, 1)>; /* SD1_DAT3 */
> +			input-enable;
> +			power-source =3D <1800>;
> +		};
> +	};

[Severity: Medium]
Does setting power-source on PG0..PG5 in sdhi1_pins and sdhi1_uhs_pins
actually program the SD_CH1_POC register during signal voltage switching?

In drivers/pinctrl/renesas/pinctrl-rzg2l.c, r9a08g046_variable_pin_cfg
configures RZG3L_PG pins 0..5 (and RZG3L_PH pins 0..5 for SD2) with
RZG3L_MPXED_PIN_FUNCS(B), which sets PIN_CFG_SOFT_PS rather than
PIN_CFG_IO_VMC_SD1:

drivers/pinctrl/renesas/pinctrl-rzg2l.c:rzg2l_set_power_source() {
    ...
	if (caps & PIN_CFG_SOFT_PS) {
		pctrl->settings[pin].power_source =3D ps;
		return 0;
	}
    ...
}

Because rzg2l_set_power_source() returns early when PIN_CFG_SOFT_PS is set,
switching between sdhi1_pins and sdhi1_uhs_pins never writes to the SD_CH
register at .sd_ch =3D 0x3004.  Similarly, rzg3l_dedicated_pins defines the
SD0_* pins with neither PIN_CFG_IO_VMC_SD0 nor PIN_CFG_SOFT_PS, so applying
power-source on SD0 pins in commit "arm64: dts: renesas: rzg3l-smarc-som:
Enable SD/eMMC on SDHI0" fails with -EINVAL in rzg2l_caps_to_pwr_reg().

[ ... ]

> @@ -230,6 +307,17 @@ &scif0 {
>  	pinctrl-names =3D "default";
>  };
> =20
> +#if RZ_BOOT_MODE3
> +&sdhi1 {
> +	pinctrl-0 =3D <&sdhi1_pins>;
> +	pinctrl-1 =3D <&sdhi1_uhs_pins>;
> +	pinctrl-names =3D "default", "state_uhs";
> +
> +	vmmc-supply =3D <&reg_3p3v>;
> +	vqmmc-supply =3D <&vqmmc_sd1_pvdd>;
> +};
> +#endif

[Severity: Medium]
Does &sdhi1 remain enabled without pinctrl or regulators when RZ_BOOT_MODE3
is 0?

renesas-smarc2.dtsi unconditionally sets status =3D "okay" on &sdhi1, and m=
mc1
=3D &sdhi1 in /aliases above is also outside #if RZ_BOOT_MODE3.  When
RZ_BOOT_MODE3 is set to 0 (routing PJ0..PJ3 to JTAG instead of SD1 CD, IOVS,
and PWEN), &sdhi1 lacks an #else branch setting status =3D "disabled" and w=
ill
probe without pinctrl, sd1-pwr-en-hog, vmmc-supply, or vqmmc-supply.  Also,
SW_SDIO_M2E is defined at the top of the file but never used.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112-sdhi_rzg3l=
-v1-0-ca30b209615d@bp.renesas.com?part=3D1
