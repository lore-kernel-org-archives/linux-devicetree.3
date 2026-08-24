Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0881A0BD0
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 08:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787559109; cv=none; b=DqkDpY9DUEs0NEhoh4aQ6QScKzr52qetuWws71ZEHpSg2KPUdw1qoj6sNByDN9n0E9wzzo2C7TWacLRDVJXbvxrWBV61p4Moi9Qg+E1EnOjbjzy696SewFgFDjX4zZbnudxJjhbTPA7UOEAM+doG8f86vSNLf7hmyxip7YTx01k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787559109; c=relaxed/simple;
	bh=owHdKQwIf7USFZ0oBvbiEmeNzF2t2AIhZ7izxA6l+hM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PSGMsweDkU9jZWk/MWPpubjuirMiWJ3U8KCFj6iIwwGGtvhQE+8MfGh1SHJUua8ov26IhwF905VzlreOGygFhxF6UL501Pm+/HisaRWa89oaNQ8WT4ZTYiLbTOnRVmBZe1ZlQ054xXILmOc8Dg59MvUi8/Rowr81rGNGk/VWfTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MMF+le0a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MMF+le0a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7B4D1F000E9;
	Mon, 24 Aug 2026 08:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787559108;
	bh=SnqsJF7W9L03XyVjl3g/JvPLCibxtz3YeiOmoWHLLKo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MMF+le0aeyXPZpHh0m2oD0rp54UVXLQS0ZZlXuIgh/hhWDGy3ahKut7bZ6RyvTsrS
	 Dm0rbRtWGO16qveBAFkPbU+vyLqtf6XfYGX4yKiVjCf5y5L8wVaBv4Dg9XWzXXM62B
	 Zd5g674bZpg7ObO6Ouw6kXxDSY9N9veoza/IQJdV9uGxWM4jrrJrCX4oNVRMzlSEwy
	 8SiZwoZG3VlAR21RmiVaVI5ibk3dUFVVDOVvmK+4t/rnPGnx2Gde/A42jkFZxs2ySM
	 OLygY3zsqbk/eGBD2HJrBQhBnEQB07gG5j51jVEJxBDcYyLxRyL6p5E70LhOLRli4L
	 5XSwcDWdjtL8w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: renesas: r9a09g087: Add RTC node
Reply-To: sashiko-reviews@lists.linux.dev
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: wsa+renesas@sang-engineering.com, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260824075936.2904336-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260824075936.2904336-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260824075936.2904336-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 08:11:47 +0000
Message-Id: <20260824081147.E7B4D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The macro `R9A09G087_PCLKRTC` used in the `clocks` property of the =
`rtc0` node is undefined, which will cause a Device Tree Compiler (dtc) syn=
tax error.
--

--- Patch [2]: [PATCH 2/3] arm64: dts: renesas: r9a09g087: Add RTC node ---
commit 17edcdb9ccacc177ffc6dada7867d0b9b83bfdd5
Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

arm64: dts: renesas: r9a09g087: Add RTC node

Add Real Time Clock (RTC) node to SoC DTSI.

> diff --git a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi b/arch/arm64/boot=
/dts/renesas/r9a09g087.dtsi
> --- a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
[ ... ]
> @@ -1149,6 +1149,19 @@ pinctrl: pinctrl@802c0000 {
>  			power-domains =3D <&cpg>;
>  		};
> =20
> +		rtc0: rtc@81009000 {
> +			compatible =3D "renesas,r9a09g087-rtc", "renesas,r9a09g077-rtc";
> +			reg =3D <0 0x81009000 0 0x1000>;
> +			interrupts =3D <GIC_SPI 495 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 497 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 496 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names =3D "alarm", "timer", "pps";
> +			clocks =3D <&cpg CPG_MOD 605>, <&cpg CPG_CORE R9A09G087_PCLKRTC>;

[Severity: Low]
Does this introduce a device tree compilation regression? It looks like the
macro R9A09G087_PCLKRTC used in the clocks property is undefined.

Since the preprocessor will leave an undefined macro as a literal string,
this will cause a syntax error when the device tree compiler attempts to
parse it as a numeric cell value. Was the definition for R9A09G087_PCLKRTC
perhaps left out of this patch series?

> +			clock-names =3D "hclk", "xtal";
> +			power-domains =3D <&cpg>;
> +			status =3D "disabled";
> +		};
> +
>  		gic: interrupt-controller@83000000 {
>  			compatible =3D "arm,gic-v3";
>  			reg =3D <0x0 0x83000000 0 0x40000>,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824075936.2904=
336-1-prabhakar.mahadev-lad.rj@bp.renesas.com?part=3D2
