Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC4517B50F
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 12:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781525667; cv=none; b=P62bWdOIeXOTY7UFFfpmzpsd9xuhafIeJ8irzN5XZiZVkbmkbeQdWIopfY5zCev5YxE8MI/MtPoUgmdOKfbAIbcMRbFErlVPCYTggxtgkDbuHFGMWE/gBDtlww8nNM7cqQZ/sZEsLI5uyBzcGuSN6FD/7S6RKTQErOH/etkob3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781525667; c=relaxed/simple;
	bh=daTQp8oOCNQI63DbiQHiSnMkxweiix6Wh0QAWTIqfag=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=s2z4sTxZ9453NdqS4NJSfKFO+iFxFWv/7xVOGvs/RFNlz8uzZgcXNWLpb6UDhSVyBb6734Jtre1DlOaX8nD1woupZZoE7WEv+vSNg5Ypcp7WENWIwKFOnmdsWpxAcmWlLN5WDwKb1CFEzyCGL/f1t1vPklvCfQf6MUO1sAkcO9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GyI5+q9i; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GyI5+q9i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9CFD1F000E9;
	Mon, 15 Jun 2026 12:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781525666;
	bh=CZQZQ8vF+ZGoqOdpc7RsCblgo9M/WT6c7e9ssNhjdaU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GyI5+q9iQ5mDF3OnW1C5WMWiuZ3z+71tlu+WPtYK2L561bmW45ETMDQvvNLMck57e
	 WBqMR6P64cVYdWiDNOBk7KQz+exDh2PNUmLco4nK7+ATPs6+8D+CTuB4azcyT3LmlH
	 2V9Uio++v8zZlWn7oKvYezWVmUvVSqO19Vq5Ef253rOIxOIHn7iFKhk3M3scUOnmaA
	 djU152l7AG14hNvwM//txZc9BaAa9SMGO3vI9bs+orGaS8pIi14kBN1+9531kMQhbE
	 pHj3QEmgZwLIyv9D8RyYQTeuD2te4/eEYDkQE7QjfM7ZkDh+1Yk6TrL4BRzrP6L/Xw
	 tPx82TcpQcLPA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/5] arm64: dts: renesas: r9a09g077: Add VSPD and
 FCPVD nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260615115455.1412098-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260615115455.1412098-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2026 12:14:24 +0000
Message-Id: <20260615121425.C9CFD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Missing required 'resets' property in VSP and FCP nodes causes DT =
binding violations and unconditional driver probe failure.
- [High] The device tree references an unregistered module clock `<&cpg CPG=
_MOD 1204>`.
- [Low] Undefined macro `R9A09G077_LCDC_CLKD` causes a fatal dtc compilatio=
n failure.
- [Low] Undocumented compatible strings used without updating the YAML bind=
ings.
--

commit 8127cbbf46c0b360f49e2126e2ac9941c9ebfa22
Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

arm64: dts: renesas: r9a09g077: Add VSPD and FCPVD nodes

Add VSPD and FCPVD nodes to RZ/T2H SoC DTSI.

> diff --git a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi b/arch/arm64/boot=
/dts/renesas/r9a09g077.dtsi
> index 3761551c96472..29ecd0189ce72 100644
> --- a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
> @@ -1268,6 +1268,28 @@ sdhi1_vqmmc: vqmmc-regulator {
>  				status =3D "disabled";
>  			};
>  		};
> +
> +		fcpvd: fcp@920d0000 {
> +			compatible =3D "renesas,r9a09g077-fcpvd", "renesas,fcpv";

[Severity: Low]
Are these compatible strings documented in the YAML bindings?

It seems renesas,r9a09g077-fcpvd is not added to renesas,fcp.yaml. This cou=
ld
cause dtbs_check to report unrecognized compatibles. Since it falls back
to generic renesas,fcpv constraints, it might enforce maxItems: 1 for clocks
and trigger further validation errors.

> +			reg =3D <0 0x920d0000 0 0x10000>;
> +			clocks =3D <&cpg CPG_CORE R9A09G077_CLK_PCLKAH>,
> +				 <&cpg CPG_MOD 1204>,

[Severity: High]
Is module clock 1204 registered in the clock driver?

Looking at drivers/clk/renesas/r9a09g077-cpg.c, 1204 doesn't appear to be
defined in the module clock array. This would cause the clock framework's
of_xlate function to return -ENOENT, preventing the PM domain from enabling
the clock and resulting in a fatal probe failure.

> +				 <&cpg CPG_CORE R9A09G077_LCDC_CLKD>;

[Severity: Low]
Is R9A09G077_LCDC_CLKD defined in the kernel tree?

It appears this macro isn't defined, which would leave the token unchanged =
by
the C preprocessor and cause a syntax error during device tree compilation.

> +			clock-names =3D "aclk", "pclk", "vclk";
> +			power-domains =3D <&cpg>;

[Severity: High]
Does this node need a resets property?

The device tree bindings for FCP require a resets property. Without it,
device initialization might be incomplete.

> +		};
> +
> +		vspd: vsp@920e0000 {
> +			compatible =3D "renesas,r9a09g077-vsp2", "renesas,r9a07g044-vsp2";

[Severity: Low]
Is the renesas,r9a09g077-vsp2 compatible string added to the bindings?

Without an update to renesas,vsp1.yaml, dtbs_check will report this as an
unrecognized compatible.

> +			reg =3D <0 0x920e0000 0 0x8000>;
> +			interrupts =3D <GIC_SPI 780 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&cpg CPG_CORE R9A09G077_CLK_PCLKAH>,
> +				 <&cpg CPG_MOD 1204>,

[Severity: High]
Would the unregistered CPG_MOD 1204 clock also cause probe failure for the
VSPD device here?

Similar to the fcpvd node, failing to acquire the clock will abort the prob=
e.

> +				 <&cpg CPG_CORE R9A09G077_LCDC_CLKD>;

[Severity: Low]
Could this undefined macro break dtc compilation here as well?

> +			clock-names =3D "aclk", "pclk", "vclk";
> +			power-domains =3D <&cpg>;

[Severity: High]
Does the vsp1 driver require a resets property to successfully probe?

Looking at drivers/media/platform/renesas/vsp1/vsp1_drv.c, vsp1_probe() cal=
ls
devm_reset_control_get_shared() without the optional flag. Because the rese=
ts
property is omitted here, this might return -ENOENT and immediately abort t=
he
probe via dev_err_probe().

> +			renesas,fcp =3D <&fcpvd>;
> +		};
>  	};
> =20
>  	stmmac_axi_setup: stmmac-axi-config {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260615115455.1412=
098-1-prabhakar.mahadev-lad.rj@bp.renesas.com?part=3D1
