Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8191F4C8E
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 21:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781128663; cv=none; b=jEy4tcqqDOlLjDBdhrLqLOMj6uGOcangXiByoGK4y/e7tgPCNeBZDxv+Dl+RynDiq01WbuzielcEI+8IcIXJZWwnhcFHrZZG5KFm+1BRj9ZH4bx9xVgm0ICVECCbPSawZhDQneoSbjnvbL0UBX/K3ddj/MjLbXsO8YMVym0eTBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781128663; c=relaxed/simple;
	bh=E+Zp7aKAkCaPAlEiWIYLdJ/S3c8DkcPjJtmk3WQDEjI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nyC6MwhQqD/xtD95/tZvhbPZxPQ0AhwLUtax1lHNrWnfa0esfxn3/5dAM4eiuumhv1LjcS68HijZE60Sd9Bx3i6DlV+kU7Deef644uwZY27Rl1lEJmv97df2VnAvLsMloP+lDYgI94xMVim3VlpKg19XRA8IZpitdJNPS9whioY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YDY3X5Xr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YDY3X5Xr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 431DE1F00893;
	Wed, 10 Jun 2026 21:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781128662;
	bh=l+CfX1Yyg08CnY7Cv8qYsE/Y2gCVBBgo3v0K2jRuL1U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YDY3X5Xrq4L2W6AxyTkE9+hQ/gIc8cJv8P0uARszYzj+rkvoWH4tPaH/uicvGSvXT
	 NoFwn9roXV+wdgD4ueCbDJdlha2Jz8JliXqb3zI0G525saWZmy5LeAN5L/kBEcSnQI
	 uRVbjk7uMUmCuw0nzjp65pl3X1cyctB37IZnHLplvMzj/cPZBREE2KFN1zMQGA1GJa
	 ycw+nm/F8PwRYjD5XCzQHN6+ybw2GlAq0hq9xHet6vS00zTviH96kVI5dq3zYoZ7ZJ
	 RmF7oB+QwM1KDdgkdKoA4lRhhsJeQgdAXOAPMGji+43qqUwCxJoSF9/MvwwTx8tQmO
	 DdzQxJkEweDLw==
From: sashiko-bot@kernel.org
Subject: Re: [net-next 3/3] arm64: dts: renesas: r8a779g0: Add gPTP node
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TmlrbGFzIFPDtmRlcmx1bmQ=?= <niklas.soderlund+renesas@ragnatech.se>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20260609215711.2960150-4-niklas.soderlund+renesas@ragnatech.se>
References: <20260609215711.2960150-4-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 21:57:40 +0000
Message-Id: <20260610215741.431DE1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Device Tree Resource Conflict due to overlapping memory, clock, an=
d reset regions between `tsn0` and `gptp`.
--

commit 225abba0fdcd1f7e4ebd535f168ba1447d871a7e
Author: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se>

arm64: dts: renesas: r8a779g0: Add gPTP node

The gPTP module is shared between the RAVB and RTSN Ethernet devices on
the SoC.

> diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/=
dts/renesas/r8a779g0.dtsi
> index 82a7278836e57..758c4ca0ae5f2 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> @@ -603,6 +603,15 @@ tsn0: ethernet@e6460000 {
>  			status =3D "disabled";
>  		};
> =20
> +		gptp: gptp@e6449000 {
> +			compatible =3D "renesas,r8a779g0-gptp", "renesas,rcar-gen4-gptp";
> +			reg =3D <0 0xe6449000 0 0x500>;
> +			clocks =3D <&cpg CPG_MOD 2723>;
> +			power-domains =3D <&sysc R8A779G0_PD_ALWAYS_ON>;
> +			resets =3D <&cpg 2723>;

[Severity: High]
Will this introduce a regression by duplicating resources already claimed by
the existing tsn0 node?

Looking at the tsn0 node earlier in this file:

		tsn0: ethernet@e6460000 {
			compatible =3D "renesas,r8a779g0-ethertsn", "renesas,rcar-gen4-ethertsn";
			reg =3D <0 0xe6460000 0 0x7000>,
			      <0 0xe6449000 0 0x500>;
			reg-names =3D "tsnes", "gptp";
			interrupts =3D <GIC_SPI 429 IRQ_TYPE_LEVEL_HIGH>,
				     <GIC_SPI 430 IRQ_TYPE_LEVEL_HIGH>;
			interrupt-names =3D "tx", "rx";
			clocks =3D <&cpg CPG_MOD 2723>;
			power-domains =3D <&sysc R8A779G0_PD_ALWAYS_ON>;
			resets =3D <&cpg 2723>;
			status =3D "disabled";
		};

It appears tsn0 already claims the 0xe6449000 memory region, CPG_MOD 2723 c=
lock,
and reset 2723.

If both drivers are enabled, will the second driver to probe fail when
requesting these overlapping resources, such as receiving -EBUSY from
devm_ioremap_resource() or request_mem_region()?

Should the overlapping resources be removed from the tsn0 node now that the
gPTP module is represented as a standalone shared node?

> +			status =3D "disabled";
> +		};
> +
>  		i2c0: i2c@e6500000 {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609215711.2960=
150-4-niklas.soderlund+renesas@ragnatech.se?part=3D1
