Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794655774;
	b=a8OWugh+1hHzOTCVvSeErtsDGdayYsvA0Eq29OxXVLdznrIXdk6S09dBY9V1dkBBd2xI
	 jBbhJE0gb0ptOPHNj6vCCZ2cy9P6AtjzQYyEPQOyCLYg0UxynWSv/xgjvsqLjb7CfEDT3
	 NXbVzcyZbErx7RRC0oW4NqcYzNaA1AsBq7fjYahlS8bKE6bQFCBpnV0njy0+/5Sc4WOeb
	 byKTrIngzE2Y7wMtkO30njuYdM6XMe0oXLtYdpQs6s7kIdpI/eFnA5g5W/eM74gHoDmhB
	 Q4chvYXBa2e7uvQu3Dln8A/iQqmQvW7/Be4DYls71DZ+DG+yupTlWpNYhGSGfVwwMJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794655774;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=JEZdxlSQY4NvZeWc+8D53sIOwsfMqTkPqohO9UR/lLQ=;
	b=A5N9C8rMgnZdX0OzN32knEceJV4RWOxPCGdPQayK7jHwsujG045BSu5qjxeMZWuRgTrr
	 riK1IdArZYdFck7EgOsGu6fR/VxGq9f78LvHmE2xa7ZOoziZnM786E0wDMAX7HGhYK1e0
	 Uw2YEfMyVxECmullp7gYYbGrHVhTu8wg2GMEEXfONY5gzFaDPw1+/ID3QDWdDD7Li2F8z
	 O9JfoAMTkj3gwpv3ea6nJHCz9Bd2GWAYfG7UZlaik3a15RTfX5NpZcX/DkKqkrKlsvWCR
	 abbHrl7H+RKHXQ1RlJlLDkMzJstTiMIYHRiTLzpYwBNTpU3ygfIPK7ExB2Se3yYvOdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XUsCjxO5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EED4606A338
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 11:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XUsCjxO5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 187461F000C6;
	Sat, 14 Nov 2026 11:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794655774;
	bh=JEZdxlSQY4NvZeWc+8D53sIOwsfMqTkPqohO9UR/lLQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XUsCjxO5npq1Nbkd67wWWvg6mUCyKm1yVI7gX12bEO/xjm+YwxjqAElEawTAndlxG
	 RfWhRlWSqgGLx1YNyUs9LfHr5kkUMR6+op+30G8TnYbzvlmHTjIRMu43OmA/194dgs
	 7erwQE5XMkro5KwXf5OsnEkMsUSPxesdjIW1RADjOPZs/nsXdGqth/HSdg64wKgKgc
	 s4uuU8LlNFtXSmGTWvdXAG1jYULewJfJnA8pjJofNwYoEe35vUry5aURzLRT4nYQqy
	 XHzYupNMZ/9e7qfL+zLJqgP+53H/wME5EeA8Unfs04curspzGgVQA4MTfqh/EyNWjb
	 MX2x33bSGWJpQ==
Message-ID: <sashiko-outbox-214405@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: lemans: Add LeMans Draco EVK
 board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gopikishan Thawre" <gopikishan.thawre@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261113-lemans-draco-final-changes-bringup-v2-3-3ae8cd1c9932@oss.qualcomm.com>
References: <20261113-lemans-draco-final-changes-bringup-v2-0-3ae8cd1c9932@oss.qualcomm.com>
 <20261113-lemans-draco-final-changes-bringup-v2-3-3ae8cd1c9932@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2026 11:29:33 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [High] arm64: dts: qcom: wrong deprecated phy-supply on serdes0 and
  serdes1
- [High] arm64: dts: qcom: missing enable-active-high on DP power
  regulators
- [Low] arm64: dts: qcom: Makefile entries for lemans-draco-evk out of
  order
--

commit 262a58ee1d4a0c406732397254080c92d772bece
Author: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>

arm64: dts: qcom: lemans: Add LeMans Draco EVK board

This commit adds the device tree for the LeMans Draco EVK platform on top
of the LeMans Draco EVK SoM.

> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom=
/Makefile
> index 4e714251d5e6b..f1713d53af5f6 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -50,6 +50,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+=3D ipq9650-rdp488.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D kaanapali-mtp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D kaanapali-qrd.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D lemans-evk.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+=3D lemans-draco-evk.dtb
> +
> +lemans-draco-evk-el2-dtbs :=3D lemans-draco-evk.dtb lemans-el2.dtbo
> +
> +dtb-$(CONFIG_ARCH_QCOM)	+=3D lemans-draco-evk-el2.dtb
> =20
>  lemans-evk-camera-csi1-imx577-dtbs	:=3D lemans-evk.dtb lemans-evk-camera=
-csi1-imx577.dtbo
>  lemans-evk-camera-dtbs	:=3D lemans-evk.dtb lemans-evk-camera.dtbo

[Severity: Low]
This isn't a bug, but the lemans-draco-evk.dtb and lemans-draco-evk-el2.dtb
entries sort alphabetically before lemans-evk.dtb.

> diff --git a/arch/arm64/boot/dts/qcom/lemans-draco-evk.dts b/arch/arm64/b=
oot/dts/qcom/lemans-draco-evk.dts
> new file mode 100644
> index 0000000000000..6dfbc8e2d8ff6
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/lemans-draco-evk.dts

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
Are vreg_dp0_pwr through vreg_dp3_pwr missing the enable-active-high
property?

For regulator-fixed nodes, of_gpio_set_polarity_by_property() ignores
GPIO_ACTIVE_HIGH in the gpio specifier and forces OF_GPIO_ACTIVE_LOW unless
enable-active-high is present, which will invert the enable polarity on
expander1 pins 7-10 and turn off power to DP0-DP3 when enabled.

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
Should serdes0 and serdes1 specify vdda-0p9-supply =3D <&vreg_l4a> and
vdda-1p2-supply =3D <&vreg_l1c> instead of the deprecated phy-supply?

In drivers/phy/qualcomm/phy-qcom-sgmii-eth.c, qcom_dwmac_sgmii_phy_probe()
only requests the vdda-0p9 and vdda-1p2 supplies:

drivers/phy/qualcomm/phy-qcom-sgmii-eth.c:
	static const struct regulator_bulk_data qcom_dwmac_sgmii_phy_vregs[] =3D {
		{ .supply =3D "vdda-0p9", .init_load_uA =3D 46000 },
		{ .supply =3D "vdda-1p2", .init_load_uA =3D 15000 },
	};

With only phy-supply specified in the DT, the regulator framework
substitutes dummy regulators for vdda-0p9 and vdda-1p2, leaving the 0.9V
and 1.2V SerDes rails unvoted when ethernet0 or ethernet1 powers on the PHY
and causing SerDes calibration to fail.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113-lemans-dra=
co-final-changes-bringup-v2-0-3ae8cd1c9932@oss.qualcomm.com?part=3D3
