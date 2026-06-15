Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFDD83E5A0D
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 12:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781525406; cv=none; b=jIcaUvGGNyJfMmY4RI7fLYDKUNEd/egs2g99eAl8mRb1lEAja5ltycEiM4wTFLDvOAE3hA05MGB7MqJca1r56xBMFFCQSJbWk54fFxdw64vAXkyj8Hz2gN/tkol+Le6XLkydHxeF1RhQ5ksqc8rL1/jb7gHihmp01x3k6lvHEsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781525406; c=relaxed/simple;
	bh=GRI3tkagR3kL6itJqeqxy08fmpfrLVQVZrdtZRjQ71A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FG1IMwKljHMDTGLG3Nm7cSIL3QdACtWzT7e/h5ZAmoFbeyEM9pxNhBniD4IdSB8h64dw9LJOMNANnjUNzo+oSXZue7NS4aIQ3qOsQYcAhlGH4C70xHYTOAur9jpgmErelLlT7weFv1+gisTvNempH7lhtR+1zTZnguhe2ALL2WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y324kz+I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y324kz+I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 231C01F00A3A;
	Mon, 15 Jun 2026 12:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781525404;
	bh=AeybkjLugyiJ0pqNJS2+u4o/uP6/g/+5I+2AGZtvrTQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Y324kz+IfA/+4HGJ5ezc3uJfzAbqvIwsaRTMMy49qZxGlzFmEQPTn7zfLKK5VPvnU
	 KOlmorKZo3YGl7qw9cAyyV4wVnPlh3CueNZHC41d5/VaKKPdt7isArOonK4DnWkAc7
	 cDpgzd9awc6dgIknO+cmOT0jpaOpEBj3CT/Kh9+eFohOwA2Noqe+hFSZEQgKO0B9Eu
	 O/0uM2YujaXBJGNbLWaXEEcHX7Gh6No/Q82XeKjKYNX9ccaEQtEnJGY0vGzhnvSMm6
	 YQq3WcnIUUAzXmG+3tQNP8io7Cc6FqKI6D3zgUw+6VNw7Hl84wSt3to3ODiahTO8W/
	 t+Tp4f0bZN27g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/5] arm64: dts: renesas: r9a09g087: Add DU node
Reply-To: sashiko-reviews@lists.linux.dev
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20260615115455.1412098-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260615115455.1412098-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2026 12:10:03 +0000
Message-Id: <20260615121004.231C01F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Missing the required `resets` property in the `du` node, leading t=
o a driver probe failure.
- [Medium] Missing a fallback compatible string for the `du` node.
- [Low] The device tree compilation fails due to the use of an undeclared m=
acro `R9A09G087_LCDC_CLKD`.
--

commit 60fe4c07204f3af15bb869a850f5f3764a505646
Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

arm64: dts: renesas: r9a09g087: Add DU node

This commit adds the Display Unit node to the r9a09g087 device tree.

> diff --git a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi b/arch/arm64/boot=
/dts/renesas/r9a09g087.dtsi
> index cb2eabe3242e0..21250caf31493 100644
> --- a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
> @@ -1272,6 +1272,30 @@ sdhi1_vqmmc: vqmmc-regulator {
>  			};
>  		};
> =20
> +		du: display@920c0000 {
> +			compatible =3D "renesas,r9a09g087-du", "renesas,r9a09g077-du";

[Severity: Medium]
Does this node need a recognized fallback compatible string?

Neither "renesas,r9a09g087-du" nor "renesas,r9a09g077-du" are present in
the display driver's match table, and no existing fallback string
is provided. Without a recognized fallback, the device will fail to match
with the driver entirely, preventing the display unit from probing.

> +			reg =3D <0 0x920c0000 0 0x10000>;
> +			interrupts =3D <GIC_SPI 781 IRQ_TYPE_LEVEL_HIGH>;

[Severity: High]
Does this node need a resets property?

The renesas,rzg2l-du.yaml schema strictly requires the resets property.
Furthermore, the display driver in drivers/gpu/drm/renesas/rz-du/
unconditionally attempts to acquire the reset control via:

    devm_reset_control_get_shared(rcdu->dev, NULL)

Because the resets property is absent, this returns -ENOENT, which aborts
the driver probe and renders the display subsystem unusable.

> +			clocks =3D <&cpg CPG_CORE R9A09G087_CLK_PCLKAH>,
> +				 <&cpg CPG_MOD 1204>,
> +				 <&cpg CPG_CORE R9A09G087_LCDC_CLKD>;

[Severity: Low]
Is the R9A09G087_LCDC_CLKD macro defined in the dt-bindings headers?

This macro is used as a clock specifier but does not appear to be defined
in the repository, causing the preprocessor to output the macro name as a
literal string. This results in a syntax error from dtc which expects a
phandle or integer.

> +			clock-names =3D "aclk", "pclk", "vclk";

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260615115455.1412=
098-1-prabhakar.mahadev-lad.rj@bp.renesas.com?part=3D4
