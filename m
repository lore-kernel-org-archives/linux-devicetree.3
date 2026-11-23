Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795443173;
	b=CAH7Ut8WfyiJy3dle+NUlDXcNDNifas1r6RxK+sJEfN6oBZ6UAcG/d173erLYZqG33pG
	 egDNMmeMEHsgO4v4/ocFgLn8pvmbpkB4OH2/C+vW+ulx8OihZqa34hQo/Ze87g+ZnsBEm
	 5oGMoLblGb7m5f0nSi3cawe0CTx7XIcNWuF1+KfJzHC7pZXUXd2KACA0AgXO9z5i0aDay
	 6uKV3wNpT1J2xLK9MwFFV0BgTogm9PZrRlb7ktZKNmnh3UtL6l6CgfBFsNFqZZvWXo12n
	 +Nf5aZmxlSY8Qu7+zQzEhVxD2zjjbpToPqx7n6EtUmtx2jjO5dtFHZXwBvXJxOADp+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795443173;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Sly6HbECsdtUzTot5hhXzyOBpGBPokjf1cNdOHqS8ak=;
	b=wRs3uJ3gS2VlvPxQtVuZ+IRFcsGAVYy4UAoiKS0RPv6prk/jzX3jbl3iph6wEzoBwkw3
	 g06JUeDE6QHz4KEa8n5Ru7VpX8Xy/+2Q3GUnktfiwMUMdG6GW0zzzmDlIfJoafi5TwxUf
	 ECst2sRJ0bMkDIEHMG24rAXjfgsrUgkthqO44T+ZiJOtJxIdWUMeSeiIYilv87XMkKYtK
	 cjp/fSxVXlJhMGE3VrWpX295rSGJLXF9bWC9M20fXJ1lLJ2u0rkgRsGAUQ5rtHQZdbG5s
	 XyFOOoTpyONzEqEO7vn/P+tx4bo8Jde2L9Vt2t8hAS53LCjVtmGrPQZn7GvyGqj3SWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R6XY0zGf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9BB606A31A
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 14:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R6XY0zGf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10FDA1F000D0;
	Mon, 23 Nov 2026 14:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795443173;
	bh=Sly6HbECsdtUzTot5hhXzyOBpGBPokjf1cNdOHqS8ak=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=R6XY0zGfsm8g2mD2RadnL9hxv2qiVCMAoRCiFbgbnXUNFwQkBwntHRbyna+gUkGc5
	 uIsBXxQGqIwVXd3VYUG2ZXjJ53lchA21ujjKo3RBoX2cE5+W7/DOM7aNaI48XFuzWg
	 FVBuJs99yl6u3NHdJqJ1A7F69iew8Uo9cs+ZMMO0uunATgtBFOImeJ6N7B2M5ja9zK
	 cCaxEi7y0L6ZBBxtzQmUHY7te/9ZGaiOo0TUsChVrqYUEfrrJIU+QG++Fto2NTeTnU
	 reEQleBl08OfqJRDrRiQPQjkh2HwtgmhBiEPTwCFyD7ICsgBrvW70rhOnjfC4CdUCh
	 twVMmpXsYpscA==
Message-ID: <sashiko-outbox-229381@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] arm64: dts: renesas: r9a08g046: Add SDHI nodes
 for RZ/G3L SoC and SDHI1 pincontrol on SMARC EVK
Reply-To: sashiko-reviews@lists.linux.dev
To: "Biju Das" <biju.das.au@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20261123-sdhi_rzg3l-v2-1-bad3a6358849@bp.renesas.com>
References: <20261123-sdhi_rzg3l-v2-0-bad3a6358849@bp.renesas.com>
 <20261123-sdhi_rzg3l-v2-1-bad3a6358849@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 14:12:50 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] arm64: dts: renesas: r9a08g046: undocumented SDHI compatible,
  clocks, and resets
- [Medium] arm64: dts: renesas: r9a08g046l48-smarc: syntax error in
  sdhi1 #else branch
--

commit 527fb6eb84a5c0b07ad82e70e9460e0c1834eaeb
Author: Biju Das <biju.das.jz@bp.renesas.com>

arm64: dts: renesas: r9a08g046: Add SDHI nodes for RZ/G3L SoC and SDHI1 pin=
control on SMARC EVK

This commit adds the SDHI0, SDHI1, and SDHI2 controller nodes to the
RZ/G3L SoC dtsi and configures SDHI1 pin control and regulators on the
RZ/G3L SMARC EVK board.

> diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot=
/dts/renesas/r9a08g046.dtsi
> index bb69e5e3528d0..b710f47d3f030 100644
> --- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> @@ -1068,9 +1068,80 @@ dmac: dma-controller@11820000 {
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
> +
>  		sdhi1: mmc@11c10000 {
> +			compatible =3D "renesas,sdhi-r9a08g046";
>  			reg =3D <0x0 0x11c10000 0 0x10000>;
> -			/* placeholder */
> +			interrupts =3D <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&cpg CPG_MOD R9A08G046_SDHI1_IMCLK>,
> +				 <&cpg CPG_MOD R9A08G046_SDHI1_CLK_HS>,
> +				 <&cpg CPG_MOD R9A08G046_SDHI1_IMCLK2>,
> +				 <&cpg CPG_MOD R9A08G046_SDHI1_IACLKM>,
> +				 <&cpg CPG_MOD R9A08G046_SDHI1_IACLKS>;
> +			clock-names =3D "core", "clkh", "cd", "aclkm", "aclks";
> +			max-frequency =3D <150000000>;
> +			resets =3D <&cpg R9A08G046_SDHI1_IXRST>,
> +				 <&cpg R9A08G046_SDHI1_IXRSTAXIM>,
> +				 <&cpg R9A08G046_SDHI1_IXRSTAXIS>;
> +			reset-names =3D "rst", "axim", "axis";
> +			power-domains =3D <&cpg>;
> +			status =3D "disabled";
> +
> +			sdhi1_vqmmc: vqmmc-regulator {
> +				regulator-name =3D "SDHI1-VQMMC";
> +				regulator-min-microvolt =3D <1800000>;
> +				regulator-max-microvolt =3D <3300000>;
> +				regulator-ramp-delay =3D <1200>;
> +				status =3D "disabled";
> +			};
> +		};
> +
> +		sdhi2: mmc@11c20000 {
> +			compatible =3D "renesas,sdhi-r9a08g046";
> +			reg =3D <0x0 0x11c20000 0 0x10000>;
> +			interrupts =3D <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&cpg CPG_MOD R9A08G046_SDHI2_IMCLK>,
> +				 <&cpg CPG_MOD R9A08G046_SDHI2_CLK_HS>,
> +				 <&cpg CPG_MOD R9A08G046_SDHI2_IMCLK2>,
> +				 <&cpg CPG_MOD R9A08G046_SDHI2_IACLKM>,
> +				 <&cpg CPG_MOD R9A08G046_SDHI2_IACLKS>;
> +			clock-names =3D "core", "clkh", "cd", "aclkm", "aclks";
> +			max-frequency =3D <150000000>;
> +			resets =3D <&cpg R9A08G046_SDHI2_IXRST>,
> +				 <&cpg R9A08G046_SDHI2_IXRSTAXIM>,
> +				 <&cpg R9A08G046_SDHI2_IXRSTAXIS>;
> +			reset-names =3D "rst", "axim", "axis";
> +			power-domains =3D <&cpg>;
> +			status =3D "disabled";
> +
> +			sdhi2_vqmmc: vqmmc-regulator {
> +				regulator-name =3D "SDHI2-VQMMC";
> +				regulator-min-microvolt =3D <1800000>;
> +				regulator-max-microvolt =3D <3300000>;
> +				regulator-ramp-delay =3D <1200>;
> +				status =3D "disabled";
> +			};
>  		};

[Severity: High]
Are the prerequisite binding and driver changes for "renesas,sdhi-r9a08g046"
missing from this tree?

Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml does not list
"renesas,sdhi-r9a08g046", limits clocks to 4 items and resets to 1 item
without reset-names, and only allows vqmmc-regulator for
"renesas,sdhi-r9a09g057", so dtbs_check fails on these nodes.  In addition,
renesas_sdhi_internal_dmac_of_match[] has no entry for
"renesas,sdhi-r9a08g046" (and the nodes have no fallback compatible), and
renesas_sdhi_probe() only requests a single unnamed reset, leaving the
controllers unbound and their axim and axis resets unmanaged.

> diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts b/arch/ar=
m64/boot/dts/renesas/r9a08g046l48-smarc.dts
> index 517747aef36ef..e9b7b3280615c 100644
> --- a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
[ ... ]
> @@ -312,6 +389,19 @@ &scif0 {
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
> +#else
> +	status =3D "disabled";
> +#endif

[Severity: Medium]
Does building with RZ_BOOT_MODE3 set to 0 fail with a dtc syntax error?
Both "&sdhi1 {" and its closing "};" are inside the #if RZ_BOOT_MODE3
branch, which leaves "status =3D "disabled";" in the #else branch outside of
any node block.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123-sdhi_rzg3l=
-v2-0-bad3a6358849@bp.renesas.com?part=3D1
