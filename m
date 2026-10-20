Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792497379;
	b=PYD6HjaA02YTEv8zQq9dFLe3XXwY46NLiorJ2C0EA+kzb3DEyJmOTvP3tpGaq8QRQx5p
	 Y2HJT34q8MtLRlhCVZ53fP9MbKuafmfunXre+AXssJEYhUBEeUHo32fB3ycFo/ucpDVAI
	 xl7/u+DHrXMBwpM842nsDZxwd6bNa87QSh8XTohMypF5ca816NgABnl1LS+MxOYLt+/UE
	 iEhSUhswQeZKBE5IHAhKd0Wv1YQGAaJ4WoRqhIeGhWV/GfjmiQyQJnci9sHkxEl0rwAPT
	 a4QQXuL4xYbgNDdtGPXvw+TZ7P2L9GIPzb6lMkYRi/jabgC6GhZlU8Dl1wzETJ6XNjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792497379;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=iMOeaowHgkEoBNF7tNMSIapzHP3Ytd3E8zlE4qwPXtI=;
	b=3eoP2jDlARj81z0QbXTYxaXdh8qISVIGUvOFQX7PU17EYL0cvMr5IbehKmRB+ckx/9+d
	 8idbZ5o+CHlSD+f8jRjFudAV9Uv7g80NHgB0OAKnvWypWABLOLoxrcmzTFXwNpPPZW4h8
	 H5a5h6MCAFzVggbY0Mh8zczr7vFg4AAgKdO6Lvls3jd8tgJ0fqO8uQA9YVC/tuLPkLEnP
	 /8/ZvD0KD7X5pjDTMxNJPcYD1rzYGvLkQC6aQwtLqPh2UpyCubuvSGBB2QjcIx231srMM
	 nsKDyKqy1zTGTDDZjCWkK6EeYQjN4gUoUaoAy58uqIuH+Mm/veBNDHtnxILrflEKy8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g5w5OX+x;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070A1606A31C
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 11:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g5w5OX+x
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D4681F000C4;
	Tue, 20 Oct 2026 11:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792497378;
	bh=iMOeaowHgkEoBNF7tNMSIapzHP3Ytd3E8zlE4qwPXtI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=g5w5OX+xm0BuF4e0IhzlnTnJIgZ8sHzRAk80XT95LlXDBp9AwykMS9pr5rWzLxx08
	 aVxI7A2eTHHEk+0cPCRPMs5aLcK5xSUdrhHJP7rva/pSTk2JxthtdejAlIyRq4YWXX
	 ZH4jx8uiu73X8jGEMF0+eFEuAZlu/9EqzFNPafieRPmf63nEaQs3W2ksDYl+na6HCY
	 vfoEMkc9IR3E9I8yHlz+ZvtqjDQyows21w3q26xD46BMFEksPhcjcRl4yslkkxk5OT
	 ElM5T5reXGcQ8PvxJJblgFapAmI+9HZton2Llph7o0XqATnGMXbL31apixrGb8KIWI
	 c957KPbEV8Njg==
Message-ID: <sashiko-outbox-178911@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: rockchip: Add Axelera Embedded 111c
Reply-To: sashiko-reviews@lists.linux.dev
To: "Patrick Barsanti" <patrick.barsanti@amarulasolutions.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261020113717.189082-4-patrick.barsanti@amarulasolutions.com>
References: <20261020113717.189082-1-patrick.barsanti@amarulasolutions.com>
 <20261020113717.189082-4-patrick.barsanti@amarulasolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 11:56:17 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] arm64: dts: rockchip: rk3588-embedded-111c: invalid phy@ node names=
 in mdio
- [Low] arm64: dts: rockchip: unreferenced vcc3v3_m2 and pcie avdd regulato=
rs in 111c
--

commit 057af7753f22c58a1c6fea7ae240d761d88b6fe7
Author: Patrick Barsanti <patrick.barsanti@amarulasolutions.com>

arm64: dts: rockchip: Add Axelera Embedded 111c

This commit adds a minimal device tree for the RK3588-based Axelera Embedded
111c board featuring an on-board Axelera AI Metis AIPU.

Link: https://axelera.ai/axelera-products/embedded/111c

> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-embedded-111c.dts b/arch=
/arm64/boot/dts/rockchip/rk3588-embedded-111c.dts
> new file mode 100644
> index 0000000000000..a964b46e5c120
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-embedded-111c.dts
> @@ -0,0 +1,816 @@

[ ... ]

> +	pcie20_avdd0v85: regulator-pcie20-avdd0v85 {
> +		compatible =3D "regulator-fixed";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt =3D <850000>;
> +		regulator-max-microvolt =3D <850000>;
> +		regulator-name =3D "pcie20_avdd0v85";
> +		vin-supply =3D <&vdda_0v85_s0>;
> +	};
> +
> +	pcie20_avdd1v8: regulator-pcie20-avdd1v8 {
> +		compatible =3D "regulator-fixed";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt =3D <1800000>;
> +		regulator-max-microvolt =3D <1800000>;
> +		regulator-name =3D "pcie20_avdd1v8";
> +		vin-supply =3D <&vcca_1v8_s0>;
> +	};
> +
> +	pcie30_avdd0v75: regulator-pcie30-avdd0v75 {
> +		compatible =3D "regulator-fixed";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt =3D <750000>;
> +		regulator-max-microvolt =3D <750000>;
> +		regulator-name =3D "pcie30_avdd0v75";
> +		vin-supply =3D <&hdmi_vdda0v85_s0>;
> +	};
> +
> +	pcie30_avdd1v8: regulator-pcie30-avdd1v8 {
> +		compatible =3D "regulator-fixed";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt =3D <1800000>;
> +		regulator-max-microvolt =3D <1800000>;
> +		regulator-name =3D "pcie30_avdd1v8";
> +		vin-supply =3D <&vcca_1v8_s0>;
> +	};

[ ... ]

> +	vcc3v3_m2: regulator-vcc3v3-m2 {
> +		compatible =3D "regulator-fixed";
> +		enable-active-high;
> +		gpio =3D <&gpio0 RK_PC4 GPIO_ACTIVE_HIGH>; /* PCIE_PWREN_H */
> +		pinctrl-0 =3D <&pcie_pwren_h>;
> +		pinctrl-names =3D "default";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		regulator-name =3D "3v_m2";
> +		vin-supply =3D <&vcc3v3_sus>;
> +	};
> +
> +	vcc3v3_sus: regulator-vcc3v3-sus {
> +		compatible =3D "regulator-fixed";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		regulator-name =3D "3vsus";
> +		vin-supply =3D <&vcc12v_dcin>;
> +	};

[Severity: Low]
The v2 changelog mentions dropping regulators that were defined but never
referenced along with their corresponding pinctrls.

However, vcc3v3_m2, its parent supply vcc3v3_sus, and the four
pcie20_avdd0v85, pcie20_avdd1v8, pcie30_avdd0v75, and pcie30_avdd1v8
regulators are not referenced anywhere in rk3588-embedded-111c.dts (the only
enabled PCIe controller is &pcie3x4, which uses vpcie3v3-supply =3D
<&vcc_1v8_pcie>).

Because vcc3v3_m2 specifies regulator-always-on and regulator-boot-on, the
fixed-regulator driver will still claim gpio0 RK_PC4 (using pinctrl
pcie_pwren_h) and drive it high at boot even though no M.2 PCIe controller =
is
enabled.

Should vcc3v3_m2 (along with pcie_pwren_h and vcc3v3_sus) and the unreferen=
ced
pcie20/pcie30 avdd regulators be dropped as well?

[ ... ]

> +&mdio0 {
> +	reset-gpios =3D <&gpio4 RK_PB3 GPIO_ACTIVE_LOW>; /* GMAC0_RST_N */
> +	reset-delay-us =3D <20000>;
> +	reset-post-delay-us =3D <100000>;
> +
> +	rgmii_phy0: phy@1 {
> +		compatible =3D "ethernet-phy-ieee802.3-c22";
> +		reg =3D <0x1>;
> +	};
> +};
> +
> +&mdio1 {
> +	reset-gpios =3D <&gpio3 RK_PB7 GPIO_ACTIVE_LOW>; /* GMAC1_RST_N */
> +	reset-delay-us =3D <20000>;
> +	reset-post-delay-us =3D <100000>;
> +
> +	rgmii_phy1: phy@3 {
> +		compatible =3D "ethernet-phy-ieee802.3-c22";
> +		reg =3D <0x3>;
> +	};
> +};

[Severity: Low]
Will make dtbs_check fail to match the rgmii_phy0 and rgmii_phy1 nodes agai=
nst
Documentation/devicetree/bindings/net/ethernet-phy.yaml?

In Documentation/devicetree/bindings/net/ethernet-phy.yaml, the select block
only matches nodes whose name matches "^ethernet-phy(@[a-f0-9]+)?$":

select:
  properties:
    $nodename:
      pattern: "^ethernet-phy(@[a-f0-9]+)?$"

  required:
    - $nodename

Because the nodes under &mdio0 and &mdio1 are named phy@1 and phy@3 with
compatible =3D "ethernet-phy-ieee802.3-c22", dtbs_check reports that no sch=
ema
matches that compatible string. Should these nodes be named ethernet-phy@1 =
and
ethernet-phy@3 instead?

[ ... ]

> +	pci {
> +		pcie_pwren_h: pcie-pwren-h {
> +			rockchip,pins =3D <0 RK_PC4 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};

[ ... ]

> +	};

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020113717.1890=
82-1-patrick.barsanti@amarulasolutions.com?part=3D3
