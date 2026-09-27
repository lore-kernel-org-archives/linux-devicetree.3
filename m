Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D16037F8CA
	for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 15:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790522574; cv=none; b=BF5fDzrmMs1cp9QC4GSqkrCMXki4M9LL8KNEnLaVCysM5JnAMVmTlNRbQk2CVYPfR6ahgDp/wSnyxr0zq19F4jUa/cTCJ8R0wz95P8VFu6NGhThgGGVEiEdGMIIbD7dD+1+w2tVk5UpwQz8JLWJUef50s+cK45ETyGZ+n37n/gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790522574; c=relaxed/simple;
	bh=8BVRHz/kDrtG2s22yn9zrTU2fPh53+VwAU+kxMq0ixE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=J9S/cckQaoKdKhnhlEWuIrZdaD+4EFgBemdimqkLN1nPlXoXNMmLZA/lKeqZnxjb+vBlvHMTXotk05NlqVxuVrggOCbMsPL5peztbLYfgN01UoH5hEfZk+rpSTaf7h0Av/WD7GeSMiiIMVQkMWOAjKCOGT/ICW8j9EtZ9FN4USY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LEjFDtnv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LEjFDtnv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA5FD1F000FF;
	Sun, 27 Sep 2026 15:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790522573;
	bh=QkTrPPVKaEMVDZ0RStxTYVPbk5I119AGJFAkYLyhzLQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LEjFDtnvnKi5uxrRSRL8yCYd2o4uV3yb8vZ0Id63aMeL5HtJ0pcVuA1RHPtlpe2aB
	 Tw2Boqs2BDAjmTVD1zJf7NrdXghuhnDDilS6BVsVvOBBm1yiZt0Tu5cPTKyGP+XM25
	 vL0ZrT5YNorUZ5l2ujOUeAQEGvx3V0beVqsikkqdtnEl630UWJ9tcMoy4jO8IdBVXs
	 AowCXPOuAQC1pucpj9kR28V32xZBMIqZ8eUvXrPmOIK3QtBS4iPh1j1Jq3KhcLm6fJ
	 VUHSN0QmsQTraMNu3WceYL0L3vEVIgNbHGDQ/6lGU4s3kKvNFQy8s3bx1Iv57kOo4N
	 a8leWzT3DEfag==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: renesas: r8a78000: Add I2C nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wolfram Sang" <wsa+renesas@sang-engineering.com>
Cc: conor+dt@kernel.org, wsa+renesas@sang-engineering.com, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260927151133.45845-3-wsa+renesas@sang-engineering.com>
References: <20260927151133.45845-3-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 27 Sep 2026 15:22:52 +0000
Message-Id: <20260927152252.AA5FD1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dts: missing prerequisite includes and nodes for i2c controllers
--

commit 3f7801bb0ea0ac6eb4aa58321a3d66e8c5413897
Author: Wolfram Sang <wsa+renesas@sang-engineering.com>

arm64: dts: renesas: r8a78000: Add I2C nodes

Add device nodes for the I2C controllers of the Renesas R-Car X5H (R8A78000)
SoC.

> diff --git a/arch/arm64/boot/dts/renesas/r8a78000.dtsi b/arch/arm64/boot/=
dts/renesas/r8a78000.dtsi
> index fb71974ef3905..a6a60d8930dec 100644
> --- a/arch/arm64/boot/dts/renesas/r8a78000.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a78000.dtsi
> @@ -877,6 +877,118 @@ gic: interrupt-controller@39000000 {
>  			interrupts =3D <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
>  		};
> =20
> +		i2c1: i2c@c06c0000 {
> +			compatible =3D "renesas,i2c-r8a78000",
> +				     "renesas,rcar-gen5-i2c";
> +			reg =3D <0 0xc06c0000 0 0x40>;
> +			interrupts =3D <GIC_SPI 956 IRQ_TYPE_LEVEL_HIGH>;
> +			i2c-scl-internal-delay-ns =3D <110>;
> +			clocks =3D <&cpg R8A78000_CPG_SGASYNCD8_PERW_BUS>;
> +			power-domains =3D <&mdlc_perw R8A78000_MDLC_PD_APL 0x44>;
> +			resets =3D <&mdlc_perw 0x44>;

[Severity: Low]
Will this device tree compile cleanly on the current baseline?

It looks like the R8A78000_CPG_SGASYNCD8_PERW_BUS and R8A78000_MDLC_PD_APL
macros, as well as the &cpg and &mdlc_perw phandles, are not yet defined in
the current tree.

Could this cause syntax errors and unresolved phandle references during the
build?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260927151133.4584=
5-3-wsa+renesas@sang-engineering.com?part=3D1
