Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2C439891D
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 08:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787559216; cv=none; b=CUvsGKHz8V/QMe0onlG5EncABBqAFxGEuU199/A/uWGi/UCXYceQXa2ow1zZ4tmyfT1bDheP6fD0EeOiHeWhwrPt+dPzbz4acnUvmLRvMpP0L+82SsX8VtjEdIdE1q8rDc+zzMMarStiFVTP0FuuatkMu5kKuT5MootB2isAIyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787559216; c=relaxed/simple;
	bh=xs5mzCG36o8AYOG+jmO+bZVs1xKY+tAcBtFJqtwb0g8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=X2rfuUZWlPE8elkp+3U63umVbKFBcO85oaFvOVSZgbGJUo5rqj6AS77jx1b2M00tKM2xqiNe6Ak2O+LYaI7FjJmhed3lDE7bAE/QlNlEzAnW6UXlsKInfiDhx5j8JhyibLmy8i+C5aOHEZfXilA+k7VQ5v4aDzOOsyiL2Mf5omA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gyPOhESG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gyPOhESG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21DAE1F000E9;
	Mon, 24 Aug 2026 08:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787559214;
	bh=RBTNfkNaVei/8AAbQ60OFAlcMCtqXbSkvKhjxDxwI1g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gyPOhESGCJQaiGhsWWlJTYhzoUdY3507RaNyv+mpw8xmQkIRZmA6LdYbzPn0oCEL0
	 I8VV/+ZAc90KjBebVgPLB+QxAUu4z/iiI1DMhjAI6seSFC9po21VVUbPYM3FsGTjsg
	 Nln69KXYELVPO+2vebPpQOmgoNWstOY/gFr2CnjUukkN95UFFbq5ZEqI4nh6VcdzTj
	 rimNIiktxbSu4gPPv9u8/u7FeAmCIj5GkG/PkOREJgBz4Ft+YlycNASTJZl/va8wuF
	 bR2PYeNwnLZZ/gPaITI3ElkXRHmJ6nnoPbq5/y6ggwfyAytAM//SRzsrcw4rtv8ohM
	 J1CIMT3pFZyrg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] arm64: dts: renesas: r9a09g077: Add RTC node
Reply-To: sashiko-reviews@lists.linux.dev
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260824075936.2904336-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260824075936.2904336-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260824075936.2904336-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 08:13:33 +0000
Message-Id: <20260824081334.21DAE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Build failure due to undefined macro `R9A09G077_PCLKRTC`.
--

--- Patch [1]: [PATCH 1/3] arm64: dts: renesas: r9a09g077: Add RTC node ---
commit 2ac601db99f828037f74c28a1b191a0855d1fe45
Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

arm64: dts: renesas: r9a09g077: Add RTC node

This patch adds the Real Time Clock (RTC) node to the Renesas R9A09G077 SoC
device tree include file.

> diff --git a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi b/arch/arm64/boot=
/dts/renesas/r9a09g077.dtsi
> --- a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
[ ... ]
> @@ -1146,6 +1146,19 @@ pinctrl: pinctrl@802c0000 {
>  			power-domains =3D <&cpg>;
>  		};
> =20
> +		rtc0: rtc@81009000 {
> +			compatible =3D "renesas,r9a09g077-rtc";
> +			reg =3D <0 0x81009000 0 0x1000>;
> +			interrupts =3D <GIC_SPI 495 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 497 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 496 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names =3D "alarm", "timer", "pps";
> +			clocks =3D <&cpg CPG_MOD 605>, <&cpg CPG_CORE R9A09G077_PCLKRTC>;

[Severity: Low]
Is there a missing prerequisite patch that defines R9A09G077_PCLKRTC?

Since R9A09G077_PCLKRTC is not defined in the tree, the C preprocessor leav=
es
it as a literal string. When dtc parses the file, it encounters the unquoted
string inside a cell array and throws a syntax error, causing a build failu=
re
when compiling the device trees.

> +			clock-names =3D "hclk", "xtal";
> +			power-domains =3D <&cpg>;
> +			status =3D "disabled";
> +		};
> +
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824075936.2904=
336-1-prabhakar.mahadev-lad.rj@bp.renesas.com?part=3D1
