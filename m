Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339061E1DE5
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 13:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781013463; cv=none; b=mfQyRLI3wx3eLxUGX2DD79bmx6XM1NNvgUIbC9mXEbkef1SP26pg69WTMLuD9d6cecguH9qNxK4bLJqSQo/gdHI8Ms0sAaJ+C8oOhzswLBCu6uB/ZfaS4lPb6716BPyvYDW+OGRzHSsL2nXdDdZHt9qfF6+8eA2TfjwiEQL3Pqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781013463; c=relaxed/simple;
	bh=Fn98qs1rmwUnRqB7koH6wMenygGQNr1Aq/VBOxqJNvI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rUvb7x8efFg7q38rXATRqdYX0c7GtMBryG3eIxnOTWLwlDY/iXAkLmdpX05Y7qG7VsHsPpRo08jMQUuqf8d72les9YwYReD8pKDQJJHJqHBQhVSwq2jGpVffy2mnvdnaOkFkZF5x/4HsepECv+VU7Jzqsr18fmqbk+U44dzmhEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g9xFYFwD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g9xFYFwD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F8901F00893;
	Tue,  9 Jun 2026 13:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781013461;
	bh=i+G16XblBaC/yX3OX/rRLaCm7kn5fN2UpHrTtk72C3A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=g9xFYFwDL70WXQ4+ih3NdEMgvV8W+teKop3nB7NGJorQPxv/gKTABVH9REws1imY5
	 /O7c9gCr29f2QQRTDHMGEfhF+w0C9cEoz0WQyak9+aMsy/urgJtXJlQWtPWGVNg5zr
	 bipw0PHHiXVpzX1GAse3qzeAGWwcB2CvyyY8AEmYHmzgwvKDWWBUWCRymqW84P9AcT
	 ROBxBgfATtIyjY3PgSN+NqJSeUZr4yFu+B+ofvJbxA0eGkqtkIRSCQOmbQ5xtyL6ez
	 WMggIzjvmFQoMsawHdGXG6WYGX1sWZvWMwtFIAXda30cm67hyUMBSE8g7vq8b2Dip7
	 11MqYHEN0W13Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/5] arm64: dts: renesas: r9a09g077: Add DU node
Reply-To: sashiko-reviews@lists.linux.dev
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com, robh@kernel.org
In-Reply-To: <20260609125353.401124-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260609125353.401124-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2026 13:57:40 +0000
Message-Id: <20260609135741.9F8901F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The `du` node is missing the `resets` property, which will cause t=
he DRM driver to unconditionally abort probing.
- [High] The `du` node references an unregistered clock module ID (`<&cpg C=
PG_MOD 1204>`), which will fail to resolve during probe.
- [Low] The device tree macro `R9A09G077_LCDC_CLKD` is referenced in the `c=
locks` property of the `du` node, but it is undeclared, causing a dtc synta=
x error.
--

commit b1b9bb2b4166cd4bcef17245d412315735a742e6
Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

arm64: dts: renesas: r9a09g077: Add DU node

Add Display Unit (DU) node to SoC DTSI.

> diff --git a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi b/arch/arm64/boot=
/dts/renesas/r9a09g077.dtsi
> index 29ecd0189ce72..32a3fb1187000 100644
> --- a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
> @@ -1269,6 +1269,30 @@ sdhi1_vqmmc: vqmmc-regulator {
>  			};
>  		};
> =20
> +		du: display@920c0000 {
> +			compatible =3D "renesas,r9a09g077-du";
> +			reg =3D <0 0x920c0000 0 0x10000>;

[Severity: High]
Are we missing the resets property for the du node here?

The rzg2l-du DRM driver unconditionally calls devm_reset_control_get_shared=
()
during rzg2l_du_crtc_create(). Because the resets property is absent in this
node, the call will fail and return -ENOENT. This breaks the driver probe
and prevents the display from initializing.

> +			interrupts =3D <GIC_SPI 781 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&cpg CPG_CORE R9A09G077_CLK_PCLKAH>,
> +				 <&cpg CPG_MOD 1204>,

[Severity: High]
Does this reference an unregistered clock module ID?

The module clock ID 1204 does not appear to be registered in the CPG driver=
's
module clock array (r9a09g077_mod_clks). When the display drivers attempt to
acquire this clock, the clock framework will fail to resolve it and return
-ENOENT, which will prevent the display pipeline from initializing.

> +				 <&cpg CPG_CORE R9A09G077_LCDC_CLKD>;

[Severity: Low]
Is the device tree macro R9A09G077_LCDC_CLKD declared?

It seems this identifier is referenced in the clocks property but is never
defined in the bindings header. The C preprocessor will leave the identifier
unexpanded, causing dtc to encounter a raw string where it expects a cell
integer value. This throws a syntax error and fails the device tree
compilation.

> +			clock-names =3D "aclk", "pclk", "vclk";
> +			power-domains =3D <&cpg>;
> +			renesas,vsps =3D <&vspd 0>;
> +			status =3D "disabled";

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609125353.4011=
24-1-prabhakar.mahadev-lad.rj@bp.renesas.com?part=3D2
