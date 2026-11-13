Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794571005;
	b=FRsZJtFhdH78eBpdstza8K/PFRLrTMaVnfErs8LEaVstY5kKbPkYrOYdC2YdQKpgJEfx
	 OYx5YBX4L4X44y6+6m9nwoLBleVhTRHgz3hH6BKUk42HR9WdDiJG55pRy8pVsP27N2mys
	 0iPLkTSrTs3Gv6EaPBJNcwECbnvV1Z3Wib9QN1+Uo7MzROYCe6lhf9Q0DyysluGQw1cb6
	 fV7epO+AQatsKocI0i7iobVYFH78vhY4IgnHKClK/Q621fQhJuftf7VONehVlJl/gO/Su
	 wbYkYLGxYe2gnk+USre60Yjdyq1FXdYLgzDPxVtK8xZwdNFCW/0l3DzVm8Bx8CtBSyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794571005;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=5KwK31Ng8QnfwAg7caXBAsQ3OcRhwnyhl60tKubaJqc=;
	b=NEQm2cherY+p1RF6Jyz6snZzArAT1JWWHyuO7yvHxHRw/qNoJrYG4bnNjHcQwqmCnR3F
	 c08tO7LlEMDaTMzP8RSdYCPMDtf8SHemhgRskTUFmZ75tyFjd3qHZ2ORfKC09my1pTBLH
	 5RD5byoXrhuxuOmJlGHaUTsaTNkmMjeFnQ1BuQbFncGlxX0gWnYY0G1qsN9oSN0Z/s8Al
	 brN34FUHBVXzw8YFzUfaOuPjyuCcj89kK4wdxd3z1OvjV3qz1d6Tv5qp832T15rR10emd
	 iVRH0o8RyP1LXW4H28ARX97IFhsriLdDCGP7MI5zQDPgoMaonPODiUriVrzXeDt4SXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="E/v2gyHz";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30BA7606A321
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 11:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E/v2gyHz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85AEE1F000C4;
	Fri, 13 Nov 2026 11:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794571004;
	bh=5KwK31Ng8QnfwAg7caXBAsQ3OcRhwnyhl60tKubaJqc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=E/v2gyHzovGaMNDyIVmtmSaSgWs29RkikjMTn1dZJ7IlfXZDYRJUXJcGX3SWzeDKC
	 TGg64VYApx8illiLzHC9ph4bUNqfjNV76G6ArZfg/63wdzyH+CVRJf6s2qzGuEryt0
	 MhonxVjbndbNSXxbr0nFOOi21ZtRRP8diLT9oTcxK2JcemKFh76WuOlSbSrd24vwDE
	 6LJ4Sj9qr7331KULOwy2PxAIyCaMdU0/WxBQ4QJICD/QVIKcPctjQLgmjwH1FQ5gyg
	 b+n1XtNqk2fqhn2wiIP692LIubA/QtW1N+5Z4b+0Hs9TQzncpKTPsbCv6l10uNuX8L
	 foUoFKR+6XKjQ==
Message-ID: <sashiko-outbox-212744@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: rockchip: Add Axelera Embedded 111c
Reply-To: sashiko-reviews@lists.linux.dev
To: "Patrick Barsanti" <patrick.barsanti@amarulasolutions.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261113113808.1779860-4-patrick.barsanti@amarulasolutions.com>
References: <20261113113808.1779860-1-patrick.barsanti@amarulasolutions.com>
 <20261113113808.1779860-4-patrick.barsanti@amarulasolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 11:56:44 +0000
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
- [High] arm64: dts: rockchip: missing domain-supply on pd_gpu in 111c
- [Medium] arm64: dts: rockchip: tsadc left disabled in 111c with active
  OPPs
- [Low] arm64: dts: rockchip: invalid phy@ node names in 111c mdio nodes
- [Low] arm64: dts: rockchip: unreferenced vcc3v3_m2 and pcie avdd
  regulators in 111c
--

commit 607ecf41e5900d1d5b78865cbefcac07bdaf3309
Author: Patrick Barsanti <patrick.barsanti@amarulasolutions.com>

arm64: dts: rockchip: Add Axelera Embedded 111c

This commit adds the initial device tree for the RK3588-based Axelera
Embedded 111c board.

Link: https://axelera.ai/axelera-products/embedded/111c

> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-axelera-embedded-111c.dt=
s b/arch/arm64/boot/dts/rockchip/rk3588-axelera-embedded-111c.dts
> new file mode 100644
> index 0000000000000..0d760ee0f4e61
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-axelera-embedded-111c.dts
> @@ -0,0 +1,810 @@

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
Are vcc3v3_m2, vcc3v3_sus, pcie20_avdd0v85, pcie20_avdd1v8,
pcie30_avdd0v75, and pcie30_avdd1v8 still needed here?  None of these
regulators (nor the pcie_pwren_h pinctrl group) are referenced anywhere in
this device tree, and vcc3v3_m2 unconditionally claims GPIO0_C4 and drives
the M.2 power rail high at boot even though only &pcie3x4 (supplied by
vcc_1v8_pcie) is enabled.

[ ... ]

> +&gpu {
> +	mali-supply =3D <&vdd_gpu_s0>;
> +	status =3D "okay";
> +};

[Severity: High]
Does &pd_gpu also need domain-supply =3D <&vdd_gpu_s0>?

In drivers/pmdomain/rockchip/pm-domains.c, RK3588_PD_GPU sets
need_regulator =3D true so rockchip_pd_regulator_enable() looks up
domain-supply before powering on the hardware domain.  Because vdd_gpu_s0
is only regulator-boot-on, if panthor probes as a module after unused
regulators are disabled or if the GPU domain is cycled across runtime PM,
genpd will substitute a dummy regulator and power on RK3588_PD_GPU while
vdd_gpu_s0 is off, hanging the system as described in f94500eb7328
("arm64: dts: rockchip: Add GPU power domain regulator dependency for
RK3588").

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
Should phy@1 and phy@3 be named ethernet-phy@1 and ethernet-phy@3?
Documentation/devicetree/bindings/net/ethernet-phy.yaml selects nodes by
matching $nodename against ^ethernet-phy(@[a-f0-9]+)?$, so make dtbs_check
fails to match these nodes against the binding.

[ ... ]

> +&saradc {
> +	vref-supply =3D <&vcca_1v8_s0>;
> +	status =3D "okay";
> +};

[Severity: Medium]
Should &tsadc also be enabled here?

This board enables CPU and GPU voltage supplies with rk3588.dtsi OPPs,
allowing DVFS scaling up to the maximum turbo frequencies, while &tsadc
remains disabled by default in rk3588-base.dtsi.  Without &tsadc enabled,
all seven SoC thermal zones and hardware over-temperature shutdown remain
inactive.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113113808.1779=
860-1-patrick.barsanti@amarulasolutions.com?part=3D3
