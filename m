Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D4D3F39C9
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 12:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781526804; cv=none; b=g/Qhv1oWe+15PIzyNkCHVNhl0o75Vx9xvgNHyYQQJ9xpbo8x063SswtzdDTc8rLkk04WxLNg1aUV3ngGha9oeh/EHj0ww6owMqb4M2sKGmjLbeValNPqCO9exZYBRz10q55stuozUMiD7247/jwTz09Kh+Do5hpk822uNtQoUGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781526804; c=relaxed/simple;
	bh=Bz2JE69nnVWGp4Rmv+iABZq95m3jGVNoEgPKuxox8Ng=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eK2R4BP4gy4eFHVMvf4j5cs9WKvfdjsxrVx3EKGqkPOfoYkCLHB7+oFpV4Uupe4tF+xmYuef+ZB+w7xqrui3It0Ip338d762SqJMDwtcYbBM9aY7Scpi1BNrhU37/n4ICm76RGIC3F/8/DUc5KYl2SpWOO0hDbjObJdOWJzIIDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QqCFSMoY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QqCFSMoY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABB4A1F00A3A;
	Mon, 15 Jun 2026 12:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781526795;
	bh=O2aTFB/DrFHIDNcN7rIAyBFwnTk+4PEAzhJSXzX8mnE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QqCFSMoYTA/aF66uDc2wzbz08gDpSxgXvtp32TSqXDI1MiVnHT5rTi/L0abgJkxpR
	 oN80bdDNtcmYr/tNjvoSBL8cmU0wUivtO4PykQoghXELG57ZKHwNP9nf4rDFpsuUPS
	 rRoxN2i7TZoUAlsls1bJdxbxOT4+FaHO7IAgvXUdkT6AfHbfeK676rmZYXgxs8qegG
	 RrA7gJ+smX4vhb6mZUVtT9ptlbTJAwayU/hfT0pT/xwFVDVgrSO8Oazh5KPJB21FWd
	 awgKuM5BWpAuHzSfxxGoI1N+qeG/g+LUDlMbxBsaNnqV9lXCEAL1D+QesSPN9i+dQH
	 mBr3qsXe/afOg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/7] riscv: dts: eswin: eic7700: add pinctrl support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pinkesh Vaghela" <pinkesh.vaghela@einfochips.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260615122016.1110206-4-pinkesh.vaghela@einfochips.com>
References: <20260615122016.1110206-4-pinkesh.vaghela@einfochips.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2026 12:33:15 +0000
Message-Id: <20260615123315.ABB4A1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Dead Code / Missing Pinctrl Hogs
- [High] Invalid Pin Mux Function / Copy-Paste Error
- [High] Missing GPIO to Pinctrl Mapping
- [Low] Device Tree Standard Compliance
--

commit 7180be18ad292ee17c6b942dc71e252ce0fdbeef
Author: Yulin Lu <luyulin@eswincomputing.com>

riscv: dts: eswin: eic7700: add pinctrl support

Add pinctrl node and related pin configuration for EIC7700 SoC.

> diff --git a/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts b/=
arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
> index 1fb92f0e7c550..e7bb96e149585 100644
> --- a/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
> +++ b/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
> @@ -18,6 +19,15 @@ aliases {
>  	chosen {
>  		stdout-path =3D "serial0:115200n8";
>  	};
> +
> +	vcc_1v8: vcc1v8 {
> +		 compatible =3D "regulator-fixed";

[Severity: Low]
Should this node be named using the generic regulator-* pattern (such as
regulator-1v8) to avoid dtbs_check warnings for deprecated names?

There is also an extra leading space on the properties within this node
that deviates from standard spacing.

> +		 regulator-name =3D "vcc1v8";
> +		 regulator-always-on;
> +		 regulator-boot-on;
> +		 regulator-min-microvolt =3D <1800000>;
> +		 regulator-max-microvolt =3D <1800000>;
> +	 };
>  };

[ ... ]

> @@ -25,6 +35,105 @@ &xtal {
>  	clock-output-names =3D "xtal24m";
>  };
> =20
> +&gpio0_pins {
> +	bias-disable;
> +	input-enable;
> +};

[Severity: High]
Will these pin configuration overrides be silently ignored by the pinctrl
core during boot?

Since these pin definitions are not referenced by a pinctrl-0 property in
an active device node, and are not configured as pinctrl hogs in the provid=
er,
the intended hardware states for these pins will not be programmed.

[ ... ]

> diff --git a/arch/riscv/boot/dts/eswin/eic7700-pinctrl.dtsi b/arch/riscv/=
boot/dts/eswin/eic7700-pinctrl.dtsi
> new file mode 100644
> index 0000000000000..7293df146aa7b
> --- /dev/null
> +++ b/arch/riscv/boot/dts/eswin/eic7700-pinctrl.dtsi
> @@ -0,0 +1,888 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)

[ ... ]

> +		hdmi_pins: hdmi-pins {
> +			pins =3D "hdmi_scl", "hdmi_sda", "hdmi_cec";
> +			function =3D "hdmi";
> +		};
> +
> +		rgmii0_pins: rgmii0-pins {
> +			pins =3D "rgmii0_clk_125", "rgmii0_txen", "rgmii0_txclk", "rgmii0_txd=
0",
> +			       "rgmii0_txd1", "rgmii0_txd2", "rgmii0_txd3", "rgmii0_rxclk",
> +			       "rgmii0_rxdv", "rgmii0_rxd0", "rgmii0_rxd1", "rgmii0_rxd2",
> +			       "rgmii0_rxd3", "rgmii0_mdc", "rgmii0_mdio", "rgmii0_intb";
> +			function =3D "hdmi";
> +		};

[Severity: High]
Is the hdmi function correct for this network pin group?

It appears that rgmii0, rgmii1, and the i2s pin groups that follow all use
the hdmi function. This will prevent the pin controller from routing these
pins properly, likely leading to driver probe failures when peripherals
attempt to request them.

[ ... ]

> diff --git a/arch/riscv/boot/dts/eswin/eic7700.dtsi b/arch/riscv/boot/dts=
/eswin/eic7700.dtsi
> index a7ebb11159580..8798c50f7584d 100644
> --- a/arch/riscv/boot/dts/eswin/eic7700.dtsi
> +++ b/arch/riscv/boot/dts/eswin/eic7700.dtsi
> @@ -349,6 +349,11 @@ gpioD: gpio-port@3 {
>  			};
>  		};
> =20
> +		pinctrl: pinctrl@51600080 {
> +			compatible =3D "eswin,eic7700-pinctrl";
> +			reg =3D <0x0 0x51600080 0x0 0x1fff80>;
> +		};
> +

[Severity: High]
Should the existing gpio controller nodes (gpioA, gpioB, gpioC, and gpioD)
be updated with a gpio-ranges property mapping to this new pinctrl provider?

Without gpio-ranges, the GPIO subsystem cannot translate GPIO offsets into
pinctrl pins. The pinctrl core's .gpio_request_enable callback will not be
invoked when a software component requests a GPIO dynamically, preventing
the multiplexer from automatically switching the pin to GPIO mode.

>  		clk: clock-controller@51828000 {
>  			compatible =3D "eswin,eic7700-clock";

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260615122016.1110=
206-1-pinkesh.vaghela@einfochips.com?part=3D3
