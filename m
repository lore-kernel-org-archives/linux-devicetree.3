Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8C621C16A
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 14:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781532566; cv=none; b=rkC3G0tvVlMcls7WosmwHwGLcgBFg4zXK9DS2Dx5xWEvsamfVIgNQRQlP7d43mN/VGHCOaZZ0DAGTdEbJiPb4XVgLFSOvs/+ugrImoH8jmG7pFawPOcXM0/Q53xsxDtzxfKgXOY/6XuQEyrHiRAh/SRk0081OGBI+DH5nziNKqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781532566; c=relaxed/simple;
	bh=Frk4+Wa6ICwJO6U3L+yEDrxuRATHO+hFpYbWTfKJHG4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oT0J7XI5e1oQzqbNAhSBGzaTyfmM9vZkhur7ELLjGL6ACBqDxzq7YAR4jq6Yk9Dh+tJXkK45ntoqeo1IAesVxLCb43r8mNkp4so3FenyTFuy7gSkrABAGgq9pkDCpjHTYCb4wqZ1Hi79/vlauscQQDx2EQlC9veGQr855uUXpl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m0WUc4SE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m0WUc4SE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20B501F000E9;
	Mon, 15 Jun 2026 14:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781532565;
	bh=EBTaAU50xaIFvr9WTvUe1h070BZzYsK/QExc1tn70+0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=m0WUc4SE+IgIp5ddA952cK/1g0+Eduh3HiccVHqBD5SqAVizDXQeXpY4SXAao3sTl
	 H0BQJ4Sj8RsG9f0zq2XAOzcDuZPCV8HaVt4qx3TWf4xtdYYVa5+hFu3+TncZYgTL16
	 TIyVeOfaVRPLS2/3a4kR9p3OtNkMvWxBIB6x2wHk/hWcOCKyTzmx0RHIkdE05mQksp
	 LFK86/v9pKGN7Y61B2wpakJuN1tE9jCmIh++/n1ida972sHTPIwj6WV1g8nh6Aw5a5
	 JqiUIfJQ8gto27y+260NzvFuYeRMe9yBBgBBfQF0MhHs1VZrRaAvnC0J0LyG6+ma/F
	 YiiAW7a6Fo5Zg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/5] arm64: dts: renesas: r9a09g087: Add VSPD and
 FCPVD nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: wsa+renesas@sang-engineering.com, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260615115455.1412098-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260615115455.1412098-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2026 14:09:24 +0000
Message-Id: <20260615140925.20B501F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Missing strictly required 'resets' property in vspd and fcpvd node=
s prevents driver probing.
- [Low] Undeclared clock macro `R9A09G087_LCDC_CLKD` causes dtc compilation=
 failure.
- [Low] Undocumented compatibles 'renesas,r9a09g087-fcpvd' and 'renesas,r9a=
09g087-vsp2' trigger cascading schema validation failures.
--

commit bbd19abf3f870d8f56a21516f41a6bb33f488901
Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

arm64: dts: renesas: r9a09g087: Add VSPD and FCPVD nodes
   =20
Add VSPD and FCPVD nodes to RZ/N2H SoC DTSI.

> diff --git a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi b/arch/arm64/boot=
/dts/renesas/r9a09g087.dtsi
> index f697e9698ed39..cb2eabe3242e0 100644
> --- a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
> @@ -1271,6 +1271,28 @@ sdhi1_vqmmc: vqmmc-regulator {
>  				status =3D "disabled";
>  			};
>  		};
> +
> +		fcpvd: fcp@920d0000 {
> +			compatible =3D "renesas,r9a09g087-fcpvd", "renesas,fcpv";

[Severity: Low]
Are these new compatible strings documented in the bindings?

If renesas,r9a09g087-fcpvd is missing from the renesas,fcp.yaml schema,
dtbs_check might fall back to default rules (such as enforcing a single item
for clocks) and trigger cascading validation failures for the rest of this
node.

> +			reg =3D <0 0x920d0000 0 0x10000>;

[Severity: High]
Does this hardware block require a resets property to function?

The device tree binding schemas strictly require a resets property for fcpv.
Without it, driver initialization might fail or be unable to reset the hard=
ware.

> +			clocks =3D <&cpg CPG_CORE R9A09G087_CLK_PCLKAH>,
> +				 <&cpg CPG_MOD 1204>,
> +				 <&cpg CPG_CORE R9A09G087_LCDC_CLKD>;

[Severity: Low]
Could this cause a compilation failure when building the device tree?

The R9A09G087_LCDC_CLKD macro does not appear to be defined in the clock
bindings header or elsewhere in the kernel tree. This usually results in a =
dtc
undeclared identifier error during compilation.

> +			clock-names =3D "aclk", "pclk", "vclk";
> +			power-domains =3D <&cpg>;
> +		};
> +
> +		vspd: vsp@920e0000 {
> +			compatible =3D "renesas,r9a09g087-vsp2", "renesas,r9a07g044-vsp2";

[Severity: Low]
Is renesas,r9a09g087-vsp2 documented in the renesas,vsp1.yaml schema?

Like the fcpvd node, an undocumented compatible string here might cause
dtbs_check validation failures.

> +			reg =3D <0 0x920e0000 0 0x8000>;
> +			interrupts =3D <GIC_SPI 780 IRQ_TYPE_LEVEL_HIGH>;

[Severity: High]
Will the vsp1 driver fail to probe here?

Looking at drivers/media/platform/renesas/vsp1/vsp1_drv.c, vsp1_probe() cal=
ls
devm_reset_control_get_shared() unconditionally. This will return -ENOENT if
the resets property is omitted from the device tree node.=20

Does this node need a resets property to prevent the probe from aborting?

> +			clocks =3D <&cpg CPG_CORE R9A09G087_CLK_PCLKAH>,
> +				 <&cpg CPG_MOD 1204>,
> +				 <&cpg CPG_CORE R9A09G087_LCDC_CLKD>;

[Severity: Low]
Will this also fail to compile due to the undeclared R9A09G087_LCDC_CLKD
identifier?

> +			clock-names =3D "aclk", "pclk", "vclk";
> +			power-domains =3D <&cpg>;
> +			renesas,fcp =3D <&fcpvd>;
> +		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260615115455.1412=
098-1-prabhakar.mahadev-lad.rj@bp.renesas.com?part=3D3
