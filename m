Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241FA3AB5B7
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 21:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779829258; cv=none; b=ombPWCOK9ilebG6F8fR9/WfogCZsWHsEOLQM1xypYDqan74sHn0naWZTJYVgYUE6p++IdItya6JH/lhLwopaWvFNKBWMuT5VwG94D5+Z5sWuToijhD1Iw8OYSoyQfOa68S1HlXHFiFaCsElL1axTOBkpS2xrjpmH1X8MlAlszEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779829258; c=relaxed/simple;
	bh=PACiooJabi8lsjM1OapSXL9WYHqncVa4GXQLBuufkiY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=friU++MqH8uvRguucA/GY2uHhhXEnykYCl8Ci5rJTFJHtY4J1R4/a+bGI+Bd3rJuB6xqO388vTl2uiL7YoG9od9T4yap+KaYYOex696qDKPa1zVUR6snoFVLy75REtRhBdLAr4lDbNU0rQEuUOWHNCtSnZ5faCN2c5/jX5Y+G+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jj7dicaa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jj7dicaa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADE551F000E9;
	Tue, 26 May 2026 21:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779829257;
	bh=GQtTdXjjRGDXBU+L40MXovfCW8nB+smL+rcIj3vDK8A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Jj7dicaa73BrGyJVcnh1IGHtYpiWdQhiKKC2/5pAcz2MJnMURIgjbbAiWsFVCgMZP
	 JhCEQld5BRCCBKZjibLDGc+DTRx+2djOWfZngOGZ7PjnrhkGIuesurStUYmm7UtIoJ
	 h90pPymqG+MTzrE1ljTOyxB0SbID1qWzfxRTKIbi8z3DBQLHkbcnnukONgZpKP4win
	 A4SnyGtEy2Bz8lZtojZI0oNkpcQxejUMo+cnZMjupagJvoTAIVor0ES5bCM6Nqfy11
	 2WE6lpnWikG0kqJGj0gzPS11LOLzyKfgl3/JVWMdTpC/2x3leRaKtd7Uxe1G58z5La
	 UaBkGNtcW668A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] arm64: dts: renesas: r9a09g077: Add xSPI nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20260526204045.3481604-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260526204045.3481604-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 26 May 2026 21:00:56 +0000
Message-Id: <20260526210056.ADE551F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The xSPI nodes provide fewer clocks and resets than strictly req=
uired by the fallback compatible string 'renesas,r9a09g047-xspi', causing d=
tbs_check validation failures and breaking the hardware compatibility contr=
act.
- [Low] Inconsistent numeric formatting in the 'resets' property between xs=
pi0 and xspi1.
--

commit 5e178072e3e48c6e7ba03bbaf8ea699cb37031c4
Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

arm64: dts: renesas: r9a09g077: Add xSPI nodes

This commit adds device tree nodes for the two xSPI (Expanded SPI)
controllers integrated into the RZ/T2H (R9A09G077) SoC.

> diff --git a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi b/arch/arm64/boot=
/dts/renesas/r9a09g077.dtsi
> --- a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
[ ... ]
> +		xspi0: spi@801c0000 {
> +			compatible =3D "renesas,r9a09g077-xspi", "renesas,r9a09g047-xspi";
> +			reg =3D <0 0x801c0000 0 0x1000>,
> +			      <0 0x40000000 0 0x10000000>;
> +			reg-names =3D "regs", "dirmap";
> +			interrupts =3D <GIC_SPI 654 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 655 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names =3D "pulse", "err_pulse";
> +			clocks =3D <&cpg CPG_MOD 4>,
> +				 <&cpg CPG_CORE R9A09G077_XSPI_CLK0>;
> +			clock-names =3D "ahb", "spi";
> +			resets =3D <&cpg 0x4>;

[Severity: Medium]
Will this trigger validation errors during make dtbs_check?

The fallback compatible string renesas,r9a09g047-xspi typically requires
exactly 4 clocks (ahb, axi, spi, spix2) and 2 resets (hresetn, aresetn) in
its bindings schema. Since these nodes only provide 2 clocks and 1 reset,
does this break the hardware compatibility contract expected by older
software?

Should there be a corresponding dt-bindings schema update to document the
new compatible string and relax these resource constraints?

> +			reset-names =3D "hresetn";
> +			power-domains =3D <&cpg>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			status =3D "disabled";
> +		};
> +
> +		xspi1: spi@801c1000 {
[ ... ]
> +			clock-names =3D "ahb", "spi";
> +			resets =3D <&cpg 5>;

[Severity: Low]
This isn't a bug, but the reset index is formatted as a decimal here,
whereas the xspi0 node above uses hexadecimal (0x4). Would it be better
to use consistent numeric formatting across adjacent, identical hardware
block definitions?

> +			reset-names =3D "hresetn";
> +			power-domains =3D <&cpg>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			status =3D "disabled";
> +		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260526204045.3481=
604-1-prabhakar.mahadev-lad.rj@bp.renesas.com?part=3D1
