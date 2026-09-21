Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1559443498F
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 08:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789978437; cv=none; b=Lc6be15X//JR+DcjH/nbcbQN5fITxR5H1NjIjTkCDFPnBzEp2rQTSaL9MuzZQ/2MW6tcTjzzIRBCN4mZ4v6wYO3KriPHURGeZ6lIKLWCNhf7Yu8zPPgfLdEQCmyqkuHcjrvZDGTVGJhCDXvkerjhDoWL27+dCt3geUAG7qlbtWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789978437; c=relaxed/simple;
	bh=hq1hrRc8fNxJg7Se70rDgteQ01doEvi0ZNVeg8yWWUU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aKZbDOIFkJvioiuFIrcI9mBx1lauSzn+wRerrbgbJC88IWIob9U13EJOORDZyCIxLT+bw4tl5ZXv2NNOvOoAz88nWu08GS33bWqi9oNDB8ZRodNhpqGetOdVNlvG18jxRgw6wVWVhIQsV1NFSuCY0ZkSn0Irq0k0S96arRjWRPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dIHtaix/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dIHtaix/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B4951F00893;
	Mon, 21 Sep 2026 08:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789978435;
	bh=kmLTRNY1kc2se1JCA9fEugMVStcIxV4+UhGwHWOQnwo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dIHtaix/nXCu2qX9GynTmq3EQFPMc4tQtf2tl+VArguVtyLE+vbrx/JdNNb7xIY25
	 tQ9eQI1Em3gSTQ77xsmzIOhA0u4iApHYk/+8TwcjM23ZGfQtynLHXOlOassCHnArpB
	 IN14WIvm4m10MfgbUwZ/QERrfQD0KWLmlhQIfvN4/DA1BK8j4TlCp10ss88ehXLCKh
	 phRW6kqQXMzpx8J0XV4U0XDEwSqm9pIM4ZGSxamw4S/2kpm7G96tRFTyDNjf4DhscI
	 zihoiYtucIssNEMNPNcaUaGi2LhaVhSgbrwC2yJ9uIoX71bFr2d+UVufH7JIeQtU9r
	 X+Nm0MQAmI7Vw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: amlogic: add T7 peripheral nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xianwei Zhao" <xianwei.zhao@amlogic.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260920-t7-node-new-v1-3-e6e0840c1b0b@amlogic.com>
References: <20260920-t7-node-new-v1-0-e6e0840c1b0b@amlogic.com>
 <20260920-t7-node-new-v1-3-e6e0840c1b0b@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 08:13:54 +0000
Message-Id: <20260921081355.1B4951F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Medium] dt: i2c2 node is unconditionally enabled in SoC dtsi
- [Low] dt: ethernet-phy node name violates schema (uses underscore)
- [Low] dt: fixed regulators define enable-active-high without gpio
- [Low] dt: new UART nodes omit mandatory clocks properties
--

commit 6fa9620003d2e99adee0e1cd106450b9d0aabb2d
Author: Xianwei Zhao <xianwei.zhao@amlogic.com>

arm64: dts: amlogic: add T7 peripheral nodes

Add device tree descriptions for the peripherals on the Amlogic T7
SoC and the T7 A311D2 AN400 board.

Add support for the T7 Ethernet controller, SPI controllers, I2C
controllers, UARTs, pinctrl groups, regulators, and reserved memory.
Also enable the Ethernet controller on the AN400 board.

> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts b/ar=
ch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts
> index ca7536f772ff1..dfd82148179b0 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts

[ ... ]

> +	vddao_3v3: regulator-vddao-3v3 {
> +		vin-supply =3D <&dc_in>;
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "VDDAO_3V3";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		startup-delay-us =3D <70000>;
> +		enable-active-high;

[Severity: Low]
Does this regulator actually need the enable-active-high property? Without
specifying a gpio, this property will not have a functional effect.

> +		regulator-boot-on;
> +		regulator-always-on;
> +	};

[ ... ]

> +	vdd_ddr: regulator-vdd-ddr {
> +		vin-supply =3D <&dc_in>;
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "VDD_DDR";
> +		regulator-min-microvolt =3D <800000>;
> +		regulator-max-microvolt =3D <800000>;
> +		startup-delay-us =3D <70000>;
> +		enable-active-high;

[Severity: Low]
Similar to vddao_3v3 above, does this regulator need enable-active-high
without a gpio property?

> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
>  };

[ ... ]

> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boo=
t/dts/amlogic/amlogic-t7.dtsi
> index 8f3f1c0579a0f..a4ca3be358429 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi

[ ... ]

> +			uart_b: serial@7a000 {
> +				compatible =3D "amlogic,t7-uart", "amlogic,meson-s4-uart";
> +				reg =3D <0x0 0x7a000 0x0 0x18>;
> +				interrupts =3D <GIC_SPI 169 IRQ_TYPE_EDGE_RISING>;
> +				status =3D "disabled";
> +			};

[Severity: Low]
Is this node missing its clocks and clock-names properties? Omitting them h=
ere
might force board files to duplicate the clock configurations.

[ ... ]

> +				int_mdio: mdio@1 {
> +					reg =3D <1>;
> +					#address-cells =3D <1>;
> +					#size-cells =3D <0>;
> +
> +					internal_ephy: ethernet_phy@8 {

[Severity: Low]
Could this node be named ethernet-phy@8 instead? Using an underscore violat=
es
the mdio.yaml schema, which expects names matching ^ethernet-phy(@[a-f0-9]+=
)?$.

> +						compatible =3D "ethernet-phy-id0180.3301",
> +							     "ethernet-phy-ieee802.3-c22";
> +						interrupts =3D <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>;
> +						reg =3D <8>;
> +						max-speed =3D <100>;
> +					};
> +				};
> +			};

[ ... ]

> +			i2c2: i2c@6a000 {
> +				compatible =3D "amlogic,t7-i2c", "amlogic,meson-axg-i2c";
> +				reg =3D <0x0 0x6a000 0x0 0x48>;
> +				interrupts =3D <GIC_SPI 162 IRQ_TYPE_EDGE_RISING>;
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +				clocks =3D <&clkc_periphs CLKID_SYS_I2C_M_C>;
> +				status =3D "okay";

[Severity: Medium]
Should this node be set to status =3D "disabled" by default? Enabling it
unconditionally in the SoC dtsi might lead to probe failures or hardware
conflicts on boards that do not use this controller.

> +			};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260920-t7-node-ne=
w-v1-0-e6e0840c1b0b@amlogic.com?part=3D3
