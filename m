Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437EF3DA7C4
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 13:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790341682; cv=none; b=J+GndYZ1nv/RmPBuooXbluzhguM4/yb7atnOgzXG85Ir7zbluPJDueVpOLvRdqsIAT6HwcdnX1ub3iaWP2m07MR+7KtmapoNkkajUisZHi6wZZGcRu+qXTL+taSKXyYw+XjtH0Zy4+8rDAC+YVVrjwNShAlmp+nfh18HUqZBpB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790341682; c=relaxed/simple;
	bh=6DiU9wlLf8Go540GpwNblyy3SRupmhlKR6ISXlPozO4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hT1WhRsJSdg840i4vhNy4UcHL5XAsXpQ+PcD3x0K3Nm+kS8lD1e+5D4ixFxMcknVhtkNIup6QharhowMyq5tkkWjbpHM2ordjMmTzYm+EM8Z4JWy2fyOP+d7ysVn/+gZBTkkOYH0a6HZQ4pBUTb8PW2hK1a0HG3EqsWVJnb57/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DzudbTDu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DzudbTDu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C388F1F000FF;
	Fri, 25 Sep 2026 13:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790341681;
	bh=3TGGE5YvawiYaPMtZ16HHhPeNHdxBW6b02r66f1fikE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DzudbTDuYe4V2VrVvkcaqpJqMwyy48nOILvwVmNQJX08WqyiFnH4EANErnIA4pKoY
	 OPVz45qlGjpQtwQ2w8UuBi8YroHTJ23HhtIJtohaqI0UQT1TAckfPHA5wgoTbX+mS/
	 v5jThoVRWxZEPLHAhHMzaldqcQI7rw8PGjy/j2PcQMtmcZjYu8iGlBCI0S3jPbrOmc
	 6t7PL52WtBvSigHHPoGaj6PJyQqDXX2gkdsTxec97jasQq/SZwRRQt/EoeIowf6nyi
	 Xs+DrtcA7Eddcfst6Z6QwIPJWzG1Ph7KfqnoNhEiT9jKWQZRNJZQYPKeQE9m85zN9g
	 8ndLqeWjSbrvw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/4] arm64: dts: renesas: r9a09g057: Add IVC and ISP
 nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org, wsa+renesas@sang-engineering.com, conor+dt@kernel.org
In-Reply-To: <20260925-mali-c55-renesas-dts-v2-3-69f728a474a2@kernel.org>
References: <20260925-mali-c55-renesas-dts-v2-0-69f728a474a2@kernel.org>
 <20260925-mali-c55-renesas-dts-v2-3-69f728a474a2@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 25 Sep 2026 13:08:00 +0000
Message-Id: <20260925130800.C388F1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] arm64: dts: renesas: swapped vclk and hclk clock/reset mapping in =
mali-c55 ISP node
- [High] arm64: dts: renesas: missing power-domains property in mali-c55 IS=
P node
--

commit f1f95e2c7f1fc7d73c0351518cd19bf0ac773a31
Author: Daniel Scally <dan.scally@ideasonboard.com>

arm64: dts: renesas: r9a09g057: Add IVC and ISP nodes

Add the Input Video Control Block and Arm Mali-C55 ISP to the device
tree file for the RZ/V2H(P) SoC.

> diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot=
/dts/renesas/r9a09g057.dtsi
> index 639693d464a77..f04180c35866a 100644
> --- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
[ ... ]
> +		isp: isp@16080000 {
> +			compatible =3D "arm,mali-c55";
> +			reg =3D <0 0x16080000 0 0x80000>;

[Severity: High]
Does this node need a power-domains property?

The isp node appears to omit power-domains =3D <&cpg>;. On Renesas SoCs, th=
is
property attaches the device to the Clock Pulse Generator (CPG) generic pow=
er
domain, which is responsible for clearing the BUS_MSTOP bits during
pm_runtime_resume.=20

Without it, pm_runtime_resume_and_get() in the driver might not trigger the
genpd domain hooks to clear MSTOP, which could cause register accesses to h=
ang
the bus or leave the hardware inaccessible.

> +			clocks =3D <&cpg CPG_MOD 0xe2>, <&cpg CPG_MOD 0xe4>,
> +				 <&cpg CPG_MOD 0xe5>;
> +			clock-names =3D "vclk", "aclk", "hclk";

[Severity: High]
Are the vclk and hclk clock mappings swapped here?

The arm,mali-c55 driver expects vclk to be the video clock and hclk to be t=
he
AHB register clock. Here, vclk is assigned to CPG_MOD 0xe2 (isp_0_reg_aclk)
and hclk is assigned to CPG_MOD 0xe5 (isp_0_isp_sclk).=20

This appears to reverse their roles and could cause the driver to configure
the wrong clock frequencies.

> +			interrupts =3D <GIC_SPI 859 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 865 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 866 IRQ_TYPE_EDGE_RISING>;
> +			resets =3D <&cpg 0xd2>, <&cpg 0xd1>, <&cpg 0xd3>;
> +			reset-names =3D "vresetn", "aresetn", "hresetn";

[Severity: High]
Are the vresetn and hresetn reset mappings also swapped?

Similar to the clocks, this maps the register reset (0xd2 ISP_0_REG_ARESETN)
to vresetn and the ISP video reset (0xd3) to hresetn. This could lead to
reset domains being incorrectly managed, resulting in hardware initializati=
on
failures.

> +			status =3D "disabled";
> +
> +			port {
> +				isp_in: endpoint {
> +					remote-endpoint =3D <&ivc_out>;
> +				};
> +			};
> +		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260925-mali-c55-r=
enesas-dts-v2-0-69f728a474a2@kernel.org?part=3D3
