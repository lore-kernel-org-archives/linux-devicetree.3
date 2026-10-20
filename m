Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792492112;
	b=zN2GPbDaXFKtYvRIeFseLzqIrXYF0c1760FMfYc0JSs2Y1eyPANUlwN25m9Iac1m0IQk
	 KfrmVxQAiRiT9zik9kzBBhRgrn7cEB/rRAt095UrWwHMiMr3Kb6dJ+L8km167Ui0MK4AL
	 h+045Z1HSIqDS3MXGzNaC6F4k5cPaqSoyFAPW+gMfF4PMikLe/qVZ2kwi+ZgWsbowJCTN
	 ffQfDopQKxRrrmO2rcibn6XfEouginyhzfIWh4E7IS6lu9pbvjvk8O5eeEWHkjlZjjbbV
	 01fgU/qaowhq2mAOPTYII9lXaKRSvNGe0GnIrDmBSIkcsshPcEWtb0Mr6mKM38kpmGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792492112;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=YqR7MwZN+7GqyhkmFEBhLZGUDiJIEuod5q81x+KLCcc=;
	b=oXk2m3+bn78fQGev1a1+wkCvCXQwddcHYs/f6nI4C3m6Q8NcL0ShYpGz83bbPC6BUfpG
	 pvD5PERPBt4kjW+Pft9x6VKHhVOV1i9Jh5Yz1BBrUJ8TqlZ/VCLUmXJAzz3kX7dl85EGE
	 l1RU3XjPS2srxftoyaHE6Rt4Eeid+xrUpU7fQUYtSN5g8MXR/Rj/c4Xb4FzaQGpwLiC8O
	 eKze6mrIGZ2q8NzLGN7hmAIAw9Ej5l3U20jYPcWGPDmDm6BnLqBCTAqRtIOEBUzpunWkN
	 sk5dwdXmFjYw/v6+IphN8ScccWf6/+OgYCPSeGXndUIibamT1LNaGnJ0wGAlJwMOeqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=btUhZyVz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77648606A31F
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 10:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=btUhZyVz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B53A11F000C6;
	Tue, 20 Oct 2026 10:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792492106;
	bh=YqR7MwZN+7GqyhkmFEBhLZGUDiJIEuod5q81x+KLCcc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=btUhZyVzplSVliDPWaQ7RgBgb4PM3fQUuVnegoky1Mx92+GSrzNQ13rZVTTWW+l8b
	 jwlF+XPpUU6oSGzUsJEcmgRnxK98jccp814JoRJkInXu/D0O4ydc9wq2xk+45lMyOz
	 VJTsLZGeb4siXRUn49cD1WDChvdoMJdpUDLCqJc2zBuBzc/zpJpQczqQKWMwlIOy0K
	 LjSrIWasy341fb/26DVXJjGMT8I5ITTwZJx7AMmgG3T522lL4yRtOtOM+nyjt/QCfa
	 lfoNR2fYqQmwZWUZsGIZ4/mHKC4AnwywSyEcmyymcussow3L8Dn8FRo3okNLCaoP5p
	 UkpWSi+GVjzOA==
Message-ID: <sashiko-outbox-178838@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: lemans: Add Draco EVK board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gopikishan Thawre" <gopikishan.thawre@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261019-lemans-draco-final-changes-bringup-v1-3-dcabe94f1074@oss.qualcomm.com>
References: <20261019-lemans-draco-final-changes-bringup-v1-0-dcabe94f1074@oss.qualcomm.com>
 <20261019-lemans-draco-final-changes-bringup-v1-3-dcabe94f1074@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 10:28:25 +0000
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
- [High] arm64: dts: qcom: wrong deprecated phy-supply on serdes0 and serde=
s1
- [High] arm64: dts: qcom: missing enable-active-high on DP power regulators
- [Low] arm64: dts: qcom: missing unit-address on hsgmii_phy0 and hsgmii_ph=
y1
--

commit 1c47953bff4f7712f8c14ac2bdb120d7a18d16d2
Author: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>

arm64: dts: qcom: lemans: Add Draco EVK board

This commit adds the device tree for the LeMans Draco EVK platform, combini=
ng
the LeMans Draco EVK SoM and Draco carrier board with board-specific
peripherals including GPIO expanders, EEPROM, DisplayPort, Ethernet, TPM, a=
nd
fan controller.

> diff --git a/arch/arm64/boot/dts/qcom/lemans-draco-evk.dts b/arch/arm64/b=
oot/dts/qcom/lemans-draco-evk.dts
> new file mode 100644
> index 0000000000000..5238157ad0029
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/lemans-draco-evk.dts
> @@ -0,0 +1,543 @@

[ ... ]

> +	vreg_dp0_pwr: regulator-dp0-pwr {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "VREG_DP0_PWR_3P3";
> +
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +
> +		gpio =3D <&expander1 7 GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	vreg_dp1_pwr: regulator-dp1-pwr {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "VREG_DP1_PWR_3P3";
> +
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +
> +		gpio =3D <&expander1 8 GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	vreg_dp2_pwr: regulator-dp2-pwr {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "VREG_DP2_PWR_3P3";
> +
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +
> +		gpio =3D <&expander1 9 GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	vreg_dp3_pwr: regulator-dp3-pwr {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "VREG_DP3_PWR_3P3";
> +
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +
> +		gpio =3D <&expander1 10 GPIO_ACTIVE_HIGH>;
> +	};

[Severity: High]
Should vreg_dp0_pwr, vreg_dp1_pwr, vreg_dp2_pwr, and vreg_dp3_pwr include t=
he
enable-active-high property?

When reg_fixed_voltage_probe() requests the gpio descriptor for a
regulator-fixed node, the call chain:

  of_find_gpio()
    -> of_gpio_try_fixup_polarity()
      -> of_gpio_set_polarity_by_property()
        -> of_gpio_quirk_polarity()

in drivers/gpio/gpiolib-of.c ignores the GPIO_ACTIVE_HIGH phandle flag and
checks only for the presence of enable-active-high:

	/*
	 * The regulator GPIO handles are specified such that the
	 * presence or absence of "enable-active-high" solely controls
	 * the polarity of the GPIO line. Any phandle flags must
	 * be actively ignored.
	 */
#if IS_ENABLED(CONFIG_REGULATOR_FIXED_VOLTAGE)
	{ "regulator-fixed",   "gpios",        "enable-active-high" },
	{ "regulator-fixed",   "gpio",         "enable-active-high" },

Without enable-active-high, of_gpio_quirk_polarity() overrides the polarity=
 to
active-low, inverting the enable signal on all four DisplayPort 3.3V power
regulators.

[ ... ]

> +&ethernet0 {
> +	phy-handle =3D <&hsgmii_phy0>;
> +	phy-mode =3D "2500base-x";
> +
> +	pinctrl-0 =3D <&ethernet0_default>;
> +	pinctrl-names =3D "default";
> +
> +	snps,mtl-rx-config =3D <&mtl_rx_setup>;
> +	snps,mtl-tx-config =3D <&mtl_tx_setup>;
> +
> +	nvmem-cells =3D <&mac_addr0>;
> +	nvmem-cell-names =3D "mac-address";
> +
> +	status =3D "okay";
> +
> +	mdio {
> +		compatible =3D "snps,dwmac-mdio";
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		hsgmii_phy0: ethernet-phy {
> +			compatible =3D "ethernet-phy-id004d.d101";
> +			reg =3D <0x1c>;
> +			reset-gpios =3D <&pmm8654au_2_gpios 8 GPIO_ACTIVE_LOW>;
> +			reset-assert-us =3D <11000>;
> +			reset-deassert-us =3D <70000>;
> +		};
> +	};

[ ... ]

> +&ethernet1 {
> +	phy-handle =3D <&hsgmii_phy1>;
> +	phy-mode =3D "2500base-x";
> +
> +	pinctrl-0 =3D <&ethernet1_default>;
> +	pinctrl-names =3D "default";
> +
> +	snps,mtl-rx-config =3D <&mtl_rx_setup1>;
> +	snps,mtl-tx-config =3D <&mtl_tx_setup1>;
> +
> +	nvmem-cells =3D <&mac_addr1>;
> +	nvmem-cell-names =3D "mac-address";
> +
> +	status =3D "okay";
> +
> +	mdio {
> +		compatible =3D "snps,dwmac-mdio";
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		hsgmii_phy1: ethernet-phy {
> +			compatible =3D "ethernet-phy-id004d.d101";
> +			reg =3D <0x1c>;
> +			reset-gpios =3D <&pmm8654au_2_gpios 9 GPIO_ACTIVE_LOW>;
> +			reset-assert-us =3D <11000>;
> +			reset-deassert-us =3D <70000>;
> +		};
> +	};

[Severity: Low]
Should the hsgmii_phy0 and hsgmii_phy1 nodes be named ethernet-phy@1c inste=
ad
of ethernet-phy?

Both nodes define reg =3D <0x1c> under an mdio bus with #address-cells =3D =
<1>, so
omitting the unit-address triggers a check_unit_address_vs_reg() warning in
dtc ("node has a reg or ranges property, but no unit name") and fails
dtbs_check against Documentation/devicetree/bindings/net/mdio.yaml.

[ ... ]

> +&serdes0 {
> +	phy-supply =3D <&vreg_l5a>;
> +
> +	status =3D "okay";
> +};
> +
> +&serdes1 {
> +	phy-supply =3D <&vreg_l5a>;
> +
> +	status =3D "okay";
> +};

[Severity: High]
Does configuring serdes0 and serdes1 with phy-supply =3D <&vreg_l5a> leave =
the
SGMII PHY without its required 0.9V and 1.2V regulator votes?

In Documentation/devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml,
phy-supply is deprecated in favor of vdda-0p9-supply and vdda-1p2-supply. In
drivers/phy/qualcomm/phy-qcom-sgmii-eth.c, qcom_dwmac_sgmii_phy_probe() cal=
ls
devm_regulator_bulk_get_const() for qcom_dwmac_sgmii_phy_vregs[]:

	static const struct regulator_bulk_data qcom_dwmac_sgmii_phy_vregs[] =3D {
		{ .supply =3D "vdda-0p9", .init_load_uA =3D 46000 },
		{ .supply =3D "vdda-1p2", .init_load_uA =3D 15000 },
	};

The driver does not request phy-supply, so dummy regulators will be
substituted when qcom_dwmac_sgmii_phy_power_on() enables the bulk supplies
prior to qcom_dwmac_sgmii_phy_calibrate().

As updated for other LeMans boards in commits 4f81684a1d10, 457cf65a7997, a=
nd
0d567fb7def9, should serdes0 and serdes1 use:

	vdda-0p9-supply =3D <&vreg_l4a>;
	vdda-1p2-supply =3D <&vreg_l1c>;

instead of phy-supply =3D <&vreg_l5a>?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019-lemans-dra=
co-final-changes-bringup-v1-0-dcabe94f1074@oss.qualcomm.com?part=3D3
