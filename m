Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C393BED31
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 09:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780048453; cv=none; b=a+Zk2ODTJ5j9IQUBSXrPNPGWDCtoIAiKpjgAhFgEB3liHnulfHxK7V+2YQQoCajeILFXjkblurj6M9Wg5PKkFdyxbIb/f6rnHy8GVpU2j5SvzR1BesGrOjIUhTFUvIFqjhOV0VpeNO83YPXciK8nVSzWQpX5pNw3JYLGV0HTJGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780048453; c=relaxed/simple;
	bh=sc0NLdHeRtQVhCUdF1YZQD1r7mlgwU0OR/nGIbLaEeA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=joeBS1zLUztTDkzV2+QFeo1LMTDaTU0awtXzvvtIzybV5UZZ0BBqfRpg+HCLzKRIJftyG4Yx0+snp3tsem/hQ158Lt0CpZwAx/EdqSDfyHaAt5g9gbE/WOshhjTGP4FX4Wbzkd9PCaYp0ZXI4o8VPNtvrUQTEQTkuYOZdXKdAf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YcSJKzYo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YcSJKzYo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDF341F00893;
	Fri, 29 May 2026 09:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780048450;
	bh=HNV+lvDUshqL+6Hgs8KAyNBDnGVARP82jiQKZAsMvLM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YcSJKzYoQtTxv8r9FK3I46rsYC6wHptcLjBW0A6J7L42so6idtlmT3RGUB7wleqBE
	 6wRdHKmOqQk1fEqy70XIr0bsU7xAKEKVb6DkQQK30QdVQ3/2nP9cEKcmRn5EsB5dM8
	 Oz2CP7ftl2wdr+mJAFZ8SAqr4dxagO80XTPH91q6kmFo69K/3j9lKOb5pJJ7FvxYLi
	 wBtrzqjSqO0rRIyst4eRpXEWMuVn2UjuZySCv0ApYET/DCSGP9E5H9okeCpMGotAVW
	 faSIsqadn3h3WeDvIt6tXtO9CcPh4rhlWvshXnTuRRXIhtdwnIiBPxoxm0szjkE2YU
	 +SB2UaNo9hzWA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 14/15] arm64: dts: ti: k3-am62p-j722s-common-main:
 Add support for DSS
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tomi Valkeinen" <tomi.valkeinen@ideasonboard.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260529-beagley-ai-display-v3-14-7fefdc5d1adf@ideasonboard.com>
References: <20260529-beagley-ai-display-v3-14-7fefdc5d1adf@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 09:54:10 +0000
Message-Id: <20260529095410.BDF341F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Missing mandatory 'ports' node in DSS, OLDI, and DSI device tree no=
des, which will result in `dtbs_check` validation errors.
--

commit 7bb631a767248ada86413965c03c2ef928272cc6
Author: Jayesh Choudhary <j-choudhary@ti.com>

arm64: dts: ti: k3-am62p-j722s-common-main: Add support for DSS

This commit adds device tree nodes for the Display Subsystem (DSS), OLDI,
and DSI blocks on TI's AM62P and J722S SoCs to
k3-am62p-j722s-common-main.dtsi. It configures the DSS nodes with their
required memory regions, clocks, and power domains, and maps the OLDI
blocks as child nodes of the DSS instances.

> diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi b/arc=
h/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
> index f130c7cb998d7..9f584e49ef583 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
[ ... ]
> @@ -1111,6 +1116,113 @@ dphy0: phy@30110000 {
>  		status =3D "disabled";
>  	};
> =20
> +	dss0: dss@30200000 {
> +		compatible =3D "ti,am62p-dss";
> +		reg =3D <0x00 0x30200000 0x00 0x1000>, /* common */
> +		      <0x00 0x30202000 0x00 0x1000>, /* vidl1 */
> +		      <0x00 0x30206000 0x00 0x1000>, /* vid */
> +		      <0x00 0x30207000 0x00 0x1000>, /* ovr1 */
> +		      <0x00 0x30208000 0x00 0x1000>, /* ovr2 */
> +		      <0x00 0x3020a000 0x00 0x1000>, /* vp1: Used for OLDI */
> +		      <0x00 0x3020b000 0x00 0x1000>, /* vp2: Used as DPI */
> +		      <0x00 0x30201000 0x00 0x1000>; /* common1 */
> +		reg-names =3D "common", "vidl1", "vid",
> +			    "ovr1", "ovr2", "vp1", "vp2", "common1";
> +		power-domains =3D <&k3_pds 186 TI_SCI_PD_EXCLUSIVE>;	/* DSS0 */
> +		clocks =3D <&k3_clks 186 6>,
> +			 <&dss0_vp1_clk>,
> +			 <&k3_clks 186 2>;
> +		clock-names =3D "fck", "vp1", "vp2";
> +		interrupts =3D <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
> +		ti,dpi-io-ctrl =3D <&main_conf 0x8300>;
> +		status =3D "disabled";
> +

[Severity: Low]
Will this node cause dtbs_check validation errors? The device tree bindings
for DSS (ti,am65x-dss.yaml) explicitly require the ports property to be
present. Since dtbs_check validates nodes even when status is disabled,
any board including this file without defining the ports might produce
warnings.

> +		oldi-transmitters {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			dss0_oldi0: oldi@0 {
> +				reg =3D <0>;
> +				clocks =3D <&k3_clks 186 0>;
> +				clock-names =3D "serial";
> +				ti,oldi-io-ctrl =3D <&dss_oldi_io_ctrl>;
> +				status =3D "disabled";
> +				power-domains =3D <&k3_pds 243 TI_SCI_PD_EXCLUSIVE>; /* OLDI0_VD */
> +			};

[Severity: Low]
Similarly, will these OLDI nodes trigger validation warnings due to a missi=
ng
ports property required by the OLDI binding schemas?

[ ... ]
> +	dsi0: dsi@30500000 {
> +		compatible =3D "ti,j721e-dsi";
> +		reg =3D <0x0 0x30500000 0x0 0x100000>, <0x0 0x30270000 0x0 0x100>;
> +		clocks =3D <&k3_clks 231 2>, <&k3_clks 231 5>;
> +		clock-names =3D "dsi_p_clk", "dsi_sys_clk";
> +		power-domains =3D <&k3_pds 231 TI_SCI_PD_EXCLUSIVE>;
> +		interrupt-parent =3D <&gic500>;
> +		interrupts =3D <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
> +		phys =3D <&dphy_tx0>;
> +		phy-names =3D "dphy";
> +		status =3D "disabled";
> +	};

[Severity: Low]
Will the omission of the ports property here result in dtbs_check warnings
against the cdns,dsi.yaml schema?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529-beagley-ai=
-display-v3-0-7fefdc5d1adf@ideasonboard.com?part=3D14
