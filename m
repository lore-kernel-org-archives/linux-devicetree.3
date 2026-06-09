Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AAED54763
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 13:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781011066; cv=none; b=u0Pa1N1U3gX0sQcO/xSuiIo6LoN4xKUgk+8z+sIJDAw0V2xQ6wBXrBASA4zw5ZcdLv3L3/6bZVOeHl5iy3Ifa54x7vb9zZRKrVf4l66OoNXYTDE11O2aA6kJSCyYAEDpJIwjAi0lFp0TOELZCVgJzwqt+pMLJOkbZy+hLKEJ/fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781011066; c=relaxed/simple;
	bh=be6ong9zKKRCy3CfqXiQZdzsnE/Kgk4pLBrmxaMGGeo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HC3OKPUsrW7ryT0LPB03bZs24YnvbElDy3MqOC5OsBKLti54WQnBVn4Q4yWL0EWcISNIo5nk6sdBJFna9RppAU1BfwtbyFJnwtWJ9FQUDQPvD7AnPkgwRpMgJLIUkPM7KTq5igSvHRdLa1kT1xM988Tk22WzaYyc7iAsSNQzEG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cfV5Qoop; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cfV5Qoop"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D63D61F00893;
	Tue,  9 Jun 2026 13:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781011065;
	bh=wVa95z8MDlenH1fJmIpPY3V8FvajemIw1zalwUpVBec=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cfV5QoopFwz07COZldz+MjS3CLlW3L9N8I91fjB4pcdoYqXXayExdtLps6ISODxap
	 8rxxWuwGWM1LNRfKOk6FdcuXwPcAPV1kl6MJDSADqXkjh2yX7u8gsEF2FDMyiZTW/M
	 qetge+orN4pHEZaH2c4DhchKrw8Qbu4IQyRtzfuOKzzzg91/qLUXbHjExek62HlWtl
	 Dt2SFrW1aSweVZbd6S3FBI3iNuFZhd8O3+FKAAmlWfTnFEsUnsJxcpM9vARLbh6FpN
	 oWM6n36NtU6dqBBabice+V3Q0Qepl7BoSIGERtwGZdduvH99iuixaFFVInhEpocDMl
	 pR6TcCNyrgeCg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/5] arm64: dts: renesas: r9a09g077: Add VSPD and FCPVD
 nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260609125353.401124-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260609125353.401124-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2026 13:17:44 +0000
Message-Id: <20260609131744.D63D61F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The `vspd` node is missing the required `resets` property, which c=
auses the `vsp1` driver probe to fail.
- [High] Clock module index `1204` is requested but not defined in the CPG =
driver.
- [Low] The macro `R9A09G077_LCDC_CLKD` is undefined, causing device tree c=
ompilation to fail.
--

commit ed649581c488eb5d4825350ff0a4c3886f2bbb0c
Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

arm64: dts: renesas: r9a09g077: Add VSPD and FCPVD nodes

This commit adds the VSPD and FCPVD device nodes to the RZ/T2H SoC device
tree.

> diff --git a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi b/arch/arm64/boot=
/dts/renesas/r9a09g077.dtsi
> --- a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
[ ... ]
> +		fcpvd: fcp@920d0000 {
> +			compatible =3D "renesas,r9a09g077-fcpvd", "renesas,fcpv";
> +			reg =3D <0 0x920d0000 0 0x10000>;
> +			clocks =3D <&cpg CPG_CORE R9A09G077_CLK_PCLKAH>,
> +				 <&cpg CPG_MOD 1204>,

[Severity: High]
Will this clock lookup fail during probe?

Looking at the CPG driver in drivers/clk/renesas/r9a09g077-cpg.c, the
r9a09g077_mod_clks array does not seem to contain an entry for module index
1204.

Without this definition, devm_clk_get() will return an error, preventing the
fcpvd device from probing successfully.

> +				 <&cpg CPG_CORE R9A09G077_LCDC_CLKD>;

[Severity: Low]
Does this cause a compilation failure when building the device tree?

The macro R9A09G077_LCDC_CLKD does not appear to be defined anywhere in the
tree.

Because it is undefined, the preprocessor will leave the literal string in
the output, resulting in a dtc syntax error when an integer is expected.

> +			clock-names =3D "aclk", "pclk", "vclk";
> +			power-domains =3D <&cpg>;
> +		};
> +
> +		vspd: vsp@920e0000 {
> +			compatible =3D "renesas,r9a09g077-vsp2", "renesas,r9a07g044-vsp2";
> +			reg =3D <0 0x920e0000 0 0x8000>;

[Severity: High]
Is a resets property required for this node to probe successfully?

The bindings for renesas,r9a07g044-vsp2 require a resets property.
Additionally, the vsp1 driver probe function unconditionally calls
devm_reset_control_get_shared() in drivers/media/platform/renesas/vsp1/vsp1=
_drv.c.

If the resets property is missing from the vspd node, __reset_control_get()
will return an error and abort the driver probe.

> +			interrupts =3D <GIC_SPI 780 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&cpg CPG_CORE R9A09G077_CLK_PCLKAH>,
> +				 <&cpg CPG_MOD 1204>,

[Severity: High]
Similarly to the fcpvd node, does the missing definition for module clock
index 1204 prevent the vspd device from probing as well?

> +				 <&cpg CPG_CORE R9A09G077_LCDC_CLKD>;

[Severity: Low]
As with the fcpvd node, will this undefined R9A09G077_LCDC_CLKD macro also
cause a device tree compilation error here?

> +			clock-names =3D "aclk", "pclk", "vclk";
> +			power-domains =3D <&cpg>;
> +			renesas,fcp =3D <&fcpvd>;
> +		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609125353.4011=
24-1-prabhakar.mahadev-lad.rj@bp.renesas.com?part=3D1
