Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ADB03E51E4
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 12:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781525773; cv=none; b=gEyXMlNAvZZJsD9GpjUxrMqUNhFa0g6ICcdkogKD0SzYMrdzJLZVJpt1QvnzsihkkjcKPJ30BoxKpvaRSUqc/VRGKNgvEu6+TH+sTNevxlI5SGpuAFDMIly/9FU2ZHe/5V3WLH77RIV9nrq7pcB7oE5dUIhHKpUzsTt7UJg9O5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781525773; c=relaxed/simple;
	bh=/ddTXEUo/V6459FNne9sRi46TwHCFG8pAowthMwwzRc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AelrVQKqDXZHWhRtR77VCW1zI6gMvEq6kk4TR3+e3oyJOBj3kdPospIQmhtYCIIxZaa470PgM4auoD6RHW9szw0i94V/RD7KoqZDCYVV+O3UZAiwj23W27MFElNVLiDCmrT7lTcJLxeHp7FjBfS286/Ys1U9I802asd7dJxAABU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jFBfy+Es; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jFBfy+Es"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F3BA1F000E9;
	Mon, 15 Jun 2026 12:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781525771;
	bh=YPbMenzKGXti/aRFLXKlQI4XZzKnWya5KJZtI8zklmY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jFBfy+Es5JAYM/cpYr1UpN57sxzDBJR4rcAZyLZeDExSklDQIybpGhfAStqBNCuyh
	 sRI1lSk4I7bvqDXEh8njxzXxfiW3lj+W0GeYRvA1OCQnVNr6fgvQ2s+tkrTMaCmpxS
	 B2T8S5WgI8EDJyHRjwAkszWw7HTfqmCI73kftfH/fy/x6CmgAH1Yqpkjc+iPs6R9i0
	 pUiCh2Y2PKbAI8CYSWyQ1e0r5/VnvkFlEk6l9lig5q/4V+3CaY4yBJYyMYCBcdRdFQ
	 NM1xnHiEECPWsi5wynXM/RY+wiHR6Zdr2jI3+g9Hr9ohS6yAAvP1/KhLxtRDLwiDtr
	 QhuTb84Y4B0eQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/5] arm64: dts: renesas: r9a09g077: Add DU node
Reply-To: sashiko-reviews@lists.linux.dev
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: robh@kernel.org, wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260615115455.1412098-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260615115455.1412098-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2026 12:16:10 +0000
Message-Id: <20260615121611.9F3BA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Missing mandatory `resets` property in du, fcpvd, and vspd nodes
- [High] Unregistered CPG_MOD 1204 clock referenced in du, fcpvd, and vspd =
nodes
- [Medium] Incomplete device tree implementation without driver support or =
fallback compatible string for du node
- [Low] Undefined macro R9A09G077_LCDC_CLKD causes build failure
--

commit 00c766c42ba26d88fa78760fe26949b97a0f53f2
Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

arm64: dts: renesas: r9a09g077: Add DU node

Add Display Unit (DU) node to SoC DTSI.

> diff --git a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi b/arch/arm64/boot=
/dts/renesas/r9a09g077.dtsi
> --- a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
> @@ -1269,6 +1269,30 @@ sdhi1_vqmmc: vqmmc-regulator {
>  			};
>  		};
> =20
> +		du: display@920c0000 {
> +			compatible =3D "renesas,r9a09g077-du";

[Severity: Medium]
Does this compatible string need a generic fallback?=20

Without a fallback like "renesas,r9a09g057-du", and with no driver currently
matching "renesas,r9a09g077-du" in the tree, won't this regression prevent =
the
node from binding to a driver and cause a schema validation failure?

> +			reg =3D <0 0x920c0000 0 0x10000>;
> +			interrupts =3D <GIC_SPI 781 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&cpg CPG_CORE R9A09G077_CLK_PCLKAH>,
> +				 <&cpg CPG_MOD 1204>,

[Severity: High]
Is module clock ID 1204 registered in the r9a09g077_mod_clks array in
drivers/clk/renesas/r9a09g077-cpg.c?=20

When the Renesas CPG-MSSR PM domain governor attempts to attach the du, fcp=
vd,
and vspd devices, won't of_clk_get_from_provider() fail and return -ENOENT
because the clock is missing? Could this regression prevent the devices from
being attached to the power domain?

> +				 <&cpg CPG_CORE R9A09G077_LCDC_CLKD>;

[Severity: Low]
Where is R9A09G077_LCDC_CLKD defined?=20

Since it doesn't appear to be defined in the device tree bindings headers f=
or
the du, fcpvd, and vspd nodes, won't this regression cause the device tree
compiler to fail with a syntax error and break the build?

[Severity: High]
Do the du, fcpvd, and vspd nodes also need a resets property?=20

The DT bindings for the Renesas Display Unit, Frame Compression Processor,
and VSP Video Processing Engine mandate the resets property. Their respecti=
ve
drivers call devm_reset_control_get_shared() without the _optional flag.=20

Without it, won't reset_control_get() return -ENOENT and cause this regress=
ion
where the driver probes fail?

> +			clock-names =3D "aclk", "pclk", "vclk";
> +			power-domains =3D <&cpg>;

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260615115455.1412=
098-1-prabhakar.mahadev-lad.rj@bp.renesas.com?part=3D2
