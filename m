Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69F3346AED
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 12:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785847182; cv=none; b=up8GPJR3ZeUFYcNiU43+a80JOGQ1p5KRReyShAnP2TMRq9WfP0AUzQlGsbVNqfAKh049EXHHkpgII+6fxR7Z1cJ7tH9nHWkgjwQcLiCkOu/MskeZlpty9eZeWpazX8VjYcWO7TsAXcN8+vEtdvgq+pHEYsB2F75ErkrrgvfvONU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785847182; c=relaxed/simple;
	bh=7+QYVM3j38zhX04EpnrHnsJPeFZRCt0MgD9hsdoKwqY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=l59d2x/iDjeDPkqmusQr0MP0dgPZ2QXUH1e3Az9SO9kcqWa6tjdYPc/eaVJgZwnO9OxyFHg2areG8aMW1KKQXOrgThOFWIyF2I+4Gs2qbSVOf2WG4pc0C+FrwfKPromHKolqUpDBGJDOGXLjaJ6h1XJftdmH+EVLJtt7w2uTvHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PzE1Ibn3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PzE1Ibn3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52FFB1F000E9;
	Tue,  4 Aug 2026 12:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785847181;
	bh=V5VvpMVFHhIQ3m6mwhRjiXP4YTgWc2hd8KtEEnxtdCQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PzE1Ibn3BJsN3L+hbBI1VkO0nunfk63utwyYGlVVUuI2VmFEiLnLOS2yE4nk+imMb
	 PdmXwk9f5V82G9qdp5EojA9i3Qz8f6i2uTv/+URMfROe1j6rJne8+THR4OyTguawPr
	 hlArw1078iHWc86gpH54L0m4kA16q8kBFEpio6gXGIhfj8Ta1R/QVrqkTIpGM6Ao0C
	 2KxYmp9SsrT5POQDoUvBtTjwBX5psph1N2hHNkNvrzF8rA7yHavAHJboGZ5DuEbv6Z
	 HCX0QjR/st6KHHvIBRYifFkraz4ZnyLFx+lkKipq8h1mT1eYd7qhN9weLAKYJrMekU
	 7g7j0pfFyoz1A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 11/17] ARM: dts: microchip: sama7d65: add cpu opps
Reply-To: sashiko-reviews@lists.linux.dev
To: "Varshini Rajendran" <varshini.rajendran@microchip.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260804113338.261782-12-varshini.rajendran@microchip.com>
References: <20260804113338.261782-1-varshini.rajendran@microchip.com>
 <20260804113338.261782-12-varshini.rajendran@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 12:39:40 +0000
Message-Id: <20260804123941.52FFB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing `cpu-supply` property in the board device tree leads to CP=
U undervolting and system crash.
--

--- Patch [11]: [PATCH v5 11/17] ARM: dts: microchip: sama7d65: add cpu opp=
s ---
commit fc836a1a8220dc67fbc068b60857dc5200abf5d0
Author: Varshini Rajendran <varshini.rajendran@microchip.com>

ARM: dts: microchip: sama7d65: add cpu opps

This commit adds the CPU operating performance points (OPP) table for the
SAMA7D65 SoC. It links the OPP table to the cpu0 node, enabling dynamic
frequency scaling for the CPU.

> diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dt=
s/microchip/sama7d65.dtsi
> index ec200848c153f..dfac17e34e651 100644
> --- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
> +++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
> @@ -35,6 +35,7 @@ cpu0: cpu@0 {
>  			d-cache-size =3D <0x8000>;	// L1, 32 KB
>  			i-cache-size =3D <0x8000>;	// L1, 32 KB
>  			next-level-cache =3D <&L2>;
> +			operating-points-v2 =3D <&cpu_opp_table>;

[Severity: High]
Will this cause the system to crash due to CPU undervolting during frequency
scaling?

Adding the operating-points-v2 property activates the cpufreq-dt driver.
However, the board device tree (at91-sama7d65_curiosity.dts) appears to be
missing a cpu-supply property for the cpu0 node to link it with the PMIC
regulator.

The cpufreq-dt driver gracefully tolerates missing regulators and will
proceed to dynamically scale the CPU frequency based on load. When the
frequency is raised (for example, to 1GHz, which requires 1.25V), the PMIC
voltage will remain at its default boot value.

Does the cpu0 node in the board file need to be updated with cpu-supply
to ensure the voltage scales safely alongside the frequency?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804113338.2617=
82-1-varshini.rajendran@microchip.com?part=3D11
