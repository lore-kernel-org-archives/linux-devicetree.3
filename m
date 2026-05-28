Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6021E285CB4
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 13:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779976750; cv=none; b=jdyx3YiPEPUh5d3yyU/hMM5NFWNSsdDfbujQOvlv1tdJp+NUobm2G4j64qCIUKcIxr0FGmY05HOKtJz3kbX9M8irSC0QrVV4BLBWkCPG9kETOKh4M6H8yF5X6E5BN9Fai/kbeC9fU7/Wtq0ehaYqTxTrMAguATMDbLyMlDaVR98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779976750; c=relaxed/simple;
	bh=lNm08rhB0P37zDKY3MHl8O/5ILyJpI3S/X8/gA7eptY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uP/VIZMfS+TPw2pbNp054py0x0mn0yXUdhyDeRoB8kF/100dNX1Cr7avAa5RsdJap/FJ5+P7zGw8+SI8xqspFymqVPtNurRRTJBa5OK0YHmTfoUXc/0qayMvZ4Fme3n5gxLg2IWddKrefLkb4GQHAApE3/2ptHVywTsPy2A7Khs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DSTgD5sm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DSTgD5sm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF7BA1F000E9;
	Thu, 28 May 2026 13:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779976749;
	bh=pprix7YZvjrDODTkNGexqYZmlOFIi9eG7FSx12U8XaA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DSTgD5smVnAL70srcKIhEjPiTxcT1NzT8S5pMh+FWtcF4vucJcefPpXhmGdK46AE7
	 dg8y9qkYhsLbZsjzrwRgMRqaL3qUtguawC4+LT22X2WTTwzIf1yxhBeCyAa7nLcyi/
	 1ge+BR+A3So+x2jrVktJQebw8arx4me50LHh4M9cdOE6hFLQ805UlMWo81nsDrP1ET
	 6/6Zz5dXyQcF51iEHCjDTlpMjEiHC48ZmXxQYgF+W2P1bd/3PWCe0OzbSUofxcHVpk
	 TOxBC+U/F32xQL5E8JpxPWWq+0mxrrzqaZ7Yi67wN5eBg40B31MArWKaV8G6vkqZY3
	 yIO1E8WnId+7g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] arm64: dts: ti: k3-am62l: Add HDMI & DSI support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Swamil Jain" <s-jain1@ti.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260528133529.3476499-1-s-jain1@ti.com>
References: <20260528133529.3476499-1-s-jain1@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 28 May 2026 13:59:08 +0000
Message-Id: <20260528135908.DF7BA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The `dpi_pins_default` pinctrl is incorrectly assigned to the ex=
ternal `sii9022` I2C bridge node instead of the SoC's `dss` node.
- [Low] The `dsi0` node is missing the required `ports` subnode, which will=
 cause a device tree schema validation failure.
--

commit 205ed087663eaf8418e9736e84ff4238caf076de
Author: Devarsh Thakkar <devarsht@ti.com>

arm64: dts: ti: k3-am62l: Add HDMI & DSI support

Adds DSS, DSI, DPHY, and HDMI bridge nodes to enable DPI-to-HDMI output on
AM62L. The DSI functionality is added but kept disabled, as it shares a
video port with DPI output.

> diff --git a/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi b/arch/arm64/boot/=
dts/ti/k3-am62l-main.dtsi
> index 80615ca1e01a2..1d255c9138db9 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi

[ ... ]

> @@ -584,4 +584,51 @@ scmi_shmem: sram@0 {
> +	dsi0: dsi@30500000 {
> +		compatible =3D "ti,j721e-dsi";
> +		reg =3D <0x0 0x30500000 0x0 0x100000>, <0x0 0x30270000 0x0 0x100>;
> +		clocks =3D <&scmi_clk 155>, <&scmi_clk 158>;
> +		clock-names =3D "dsi_p_clk", "dsi_sys_clk";
> +		power-domains =3D <&scmi_pds 38>;
> +		interrupt-parent =3D <&gic500>;
> +		interrupts =3D <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
> +		phys =3D <&dphy_tx0>;
> +		phy-names =3D "dphy";
> +		status =3D "disabled";
> +	};

[Severity: Low]
Does this node need a ports subnode to comply with the device tree schema?

The ti,j721e-dsi compatible string binds to the Cadence DSI schema which
strictly requires the ports property and its port@1 subnode for the DPI
input. Even though status is disabled, omitting the required properties in
the skeleton dtsi might cause dtbs_check to report schema validation errors
during compilation.

>  };

> diff --git a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts b/arch/arm64/boot/d=
ts/ti/k3-am62l3-evm.dts
> index a1af4571a815d..9b04fa6d2cba6 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts

[ ... ]

> @@ -192,6 +204,38 @@ exp2: gpio@23 {
>  		bootph-all;
>  	};
> =20
> +	sii9022: bridge-hdmi@3b {
> +		compatible =3D "sil,sii9022";
> +		reg =3D <0x3b>;
> +		interrupt-parent =3D <&exp1>;
> +		interrupts =3D <20 IRQ_TYPE_EDGE_FALLING>;
> +		#sound-dai-cells =3D <0>;
> +		sil,i2s-data-lanes =3D < 0 >;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&dpi_pins_default>;

[Severity: Medium]
Should these pinctrl properties be placed in the dss node instead of here?

The dpi_pins_default node configures VOUT0 pins which are driven by the
AM62L internal Display Subsystem (DSS). Placing this pinmux in the external
sii9022 bridge node seems to create a dependency where the SoC's video
output pins are only multiplexed when the external I2C device driver loads.

If the bridge driver fails to probe or is unbound, the pins might remain
unconfigured or floating, even if the DSS attempts to use them.

> +		bootph-all;
> +
> +		ports {

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260528133529.3476=
499-1-s-jain1@ti.com?part=3D1
