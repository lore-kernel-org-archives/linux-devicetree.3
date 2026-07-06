Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D01395AF1
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 08:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783326174; cv=none; b=pEQDHVKncP90ob0WT3clB+2ha5OPfam0Gqwdtd/UliS5XEcSrizhd3nCugJ7e4NuscP053PdbZIKKjV3JxE14g2uL1EXyv3QdkZzVNVM1lxD85OINNt0fKulDzWDblJWRf45fBVu3Rtp0/ASVbyU5L5kqbDYZk+S4/Px+F9FN48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783326174; c=relaxed/simple;
	bh=Z45fnCeYiqgbNtqv2FhepjB1EC6A5GgOg0KG3+1Q4pE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=B+J24CJtE0VHQli4veuw7PJFlMnSWChslePGleQeqdTR1eGvUoca9W9nCh9spWNMGUsEX/ZKUJSLaeVe/8x8YQbYevo8ObbTHwUB8aBOLNtabl1MHYAZoiBRclI9548JGmQ/4OEOCDe8UoJCaa4LABOx3P28OFtbT5VPE/dod2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GNiSlbWG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GNiSlbWG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8C891F000E9;
	Mon,  6 Jul 2026 08:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783326159;
	bh=moPErxptzMoFitn4NCYWOwu7PQBkbJROla6/+YkgVVo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GNiSlbWGx9vZxeFVLlNwctHw9YSkGjZAgmUCNEdw4CmHsQQ696wy/jAi7x2rOaRyI
	 0+ftiTBPm3ihli2Qiq6cE2kxNCBl5CaQETl5p+C4Grflurk7L+6VJCbQfKDJlETKA9
	 jvxBI4j2ZcdUBF32OGBt456ZzhaKAScumzOZsMqRNVOO93qOtou56ruCjq/LMcobi3
	 J5b7Nk9dZM/vuIes8dCYRBxY2eg9Eec5Eb6GC0/+pJAV8Qu5a245cTU9vaSjoosmvZ
	 RHnXkfEfkKViv9AfE2+67eZ7hzf+EPHvugI5MpjDDB60RLX5zC3N6wy8YdKFTus6JG
	 +/E6eBgTEwJ2Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 8/8] riscv: dts: eswin: add watchdog support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pinkesh Vaghela" <pinkesh.vaghela@einfochips.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260706081055.1126275-9-pinkesh.vaghela@einfochips.com>
References: <20260706081055.1126275-1-pinkesh.vaghela@einfochips.com>
 <20260706081055.1126275-9-pinkesh.vaghela@einfochips.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 06 Jul 2026 08:22:38 +0000
Message-Id: <20260706082238.C8C891F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Incorrect mapping of the APB clock (PCLK) to the timer reference c=
lock (tclk), omitting the actual reference clock.
- [Low] Missing space after the '=3D' sign in the 'clocks' properties.
--

commit e654cdc83801a14778ef2783efed381807629c6f
Author: Pritesh Patel <pritesh.patel@einfochips.com>

riscv: dts: eswin: add watchdog support

This commit adds watchdog nodes for the ESWIN EIC7700 SoC and enables them
for the HiFive Premier P550 board.

[ ... ]

> diff --git a/arch/riscv/boot/dts/eswin/eic7700.dtsi b/arch/riscv/boot/dts=
/eswin/eic7700.dtsi
> index 6d328befc623d..d079bb337ecbb 100644
> --- a/arch/riscv/boot/dts/eswin/eic7700.dtsi
> +++ b/arch/riscv/boot/dts/eswin/eic7700.dtsi
> @@ -265,6 +265,46 @@ hsp_sp_csr: hsp-sp-top-csr@50440000 {
>  			};
>  		};
> =20
> +		wdt0: watchdog@50800000 {
> +			compatible =3D "snps,dw-wdt";
> +			reg =3D <0x0 0x50800000 0x0 0x4000>;
> +			interrupts =3D <87>;
> +			clocks =3D<&clk EIC7700_CLK_GATE_LSP_WDT0_PCLK>;
                                ^^^^

[Severity: Low]
This isn't a bug, but there appears to be a missing space after the '=3D' s=
ign.

> +			clock-names =3D "tclk";

[Severity: High]
Are we assigning the APB clock (PCLK) to the timer reference clock (tclk)
while omitting the actual reference clock (NOC_WDREF)?

The snps,dw-wdt driver retrieves tclk to determine the frequency for TOP
calculations and to enable the clock. Because EIC7700_CLK_GATE_LSP_WDT0_PCLK
is assigned to tclk here instead of the explicit watchdog reference clock
(EIC7700_CLK_GATE_NOC_WDREF), the driver might calculate timeouts using the
wrong rate and fail to enable NOC_WDREF entirely.

> +			resets =3D <&reset EIC7700_RESET_WDT0>;
> +			status =3D "disabled";
> +		};
> +
> +		wdt1: watchdog@50804000 {
> +			compatible =3D "snps,dw-wdt";
> +			reg =3D <0x0 0x50804000 0x0 0x4000>;
> +			interrupts =3D <88>;
> +			clocks =3D<&clk EIC7700_CLK_GATE_LSP_WDT1_PCLK>;
                                ^^^^

[Severity: Low]
This isn't a bug, but there is a missing space after the '=3D' sign here as
well.

> +			clock-names =3D "tclk";

[Severity: High]
Could this result in similar incorrect timeout calculations for wdt1 due to
omitting NOC_WDREF?

> +			resets =3D <&reset EIC7700_RESET_WDT1>;
> +			status =3D "disabled";
> +		};
> +
> +		wdt2: watchdog@50808000 {
> +			compatible =3D "snps,dw-wdt";
> +			reg =3D <0x0 0x50808000 0x0 0x4000>;
> +			interrupts =3D <89>;
> +			clocks =3D<&clk EIC7700_CLK_GATE_LSP_WDT2_PCLK>;
                                ^^^^

[Severity: Low]
This isn't a bug, but there is a missing space after the '=3D' sign.

> +			clock-names =3D "tclk";

[Severity: High]
Does this node also need NOC_WDREF to avoid incorrect timeout calculations?

> +			resets =3D <&reset EIC7700_RESET_WDT2>;
> +			status =3D "disabled";
> +		};
> +
> +		wdt3: watchdog@5080c000 {
> +			compatible =3D "snps,dw-wdt";
> +			reg =3D <0x0 0x5080c000 0x0 0x4000>;
> +			interrupts =3D <90>;
> +			clocks =3D<&clk EIC7700_CLK_GATE_LSP_WDT3_PCLK>;
                                ^^^^

[Severity: Low]
This isn't a bug, but there is a missing space after the '=3D' sign.

> +			clock-names =3D "tclk";

[Severity: High]
Is the explicit watchdog reference clock (NOC_WDREF) missing for wdt3 as
well?

> +			resets =3D <&reset EIC7700_RESET_WDT3>;
> +			status =3D "disabled";
> +		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706081055.1126=
275-1-pinkesh.vaghela@einfochips.com?part=3D8
