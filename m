Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867953E3170
	for <devicetree@vger.kernel.org>; Sat, 26 Sep 2026 13:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790429760; cv=none; b=c87GeGZsjK8XbE/s8wyBeiuKOIiOIskDbzjetWZHOvDMZubXHDEWlGUur+HGkzLt+jAdkPi6Pobl9aZ1AjyjZcMcYU8FudAEzJ07/++/rNVCcylHT8pVEMHMsXPRbAwQbNg0ZXsZwG7VXSQ2CAXpMB4jQ1kpMgLpxWqMf6yZTvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790429760; c=relaxed/simple;
	bh=l1cKj7QTl6cd7v3YBAiiz8/YXWpEEU5JaaGRAdV92qY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rJ3eNWat2QJ2G3Mgs6eSW1SlYkmaDFYc4YmMytV6y3x4yDgAdjKdYGsqEZwHqparzVsl7sQpPI01DLRpkcehP6J6eSpCrRHIHzx4WxKPaYgaTHLKsGe7RdurPU2Nh4IDewJPIuVEPxDGfrmA6En9V8GnfgU/ZoUY69eh5qeJO30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j+7PloRK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j+7PloRK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3DC91F000FF;
	Sat, 26 Sep 2026 13:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790429755;
	bh=RZ0W/gr3IAWE1+TCDJY/NV6beU6lchjmiMKwDZPK3nI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=j+7PloRKiU4yXPwOd7gR+I6+eHw5mhEL7EXKOd/LyuM+AQpX8EylMViWbABReIK7H
	 nX4agB8EdkbcJ32qpfEzf2KT78HCZe23/sxS9wG9upLCknlmgV6Brbnz2ykZvQ7c/H
	 z4PimpJZM3aRFHYo5Tj7C5DocPSBsi0OzQ34EKvHUkXBxnG+V3MCgLoPNuKQvMpejY
	 MsZbL5OFK4pIlAGtkyD4glQGWmumVJIYQ7CIKWb0RI8rnADX0ygS6BbajEe6JtP+4m
	 i+hdRbEfFkO0+PNc70FVLvWSuRl9kX1/vEdIx0nFj3aIQgij1SccVA+0hX3cneBA65
	 WAQKPe91ilWsQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 17/17] arm64: dts: apple: t6031: add avd nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sofus Forstreuter" <sofus.c@icloud.com>
Cc: media-ci@linuxtv.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260926-avd-v2-17-ecebe6a3648e@icloud.com>
References: <20260926-avd-v2-0-ecebe6a3648e@icloud.com>
 <20260926-avd-v2-17-ecebe6a3648e@icloud.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 26 Sep 2026 13:35:54 +0000
Message-Id: <20260926133554.E3DC91F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dts: nodes sorted incorrectly by unit-address
--

commit fe4ebbc8c6f98e6f76243dbcfb7c2f83ad238d54
Author: Sofus Forstreuter <sofus.c@icloud.com>

arm64: dts: apple: t6031: add avd nodes

This commit adds device tree nodes for the avd dart (IOMMU) and video codec
on the Apple T6031 SoC.

> diff --git a/arch/arm64/boot/dts/apple/t6031-dieX.dtsi b/arch/arm64/boot/=
dts/apple/t6031-dieX.dtsi
> index 2e9d3d2e6dea4..3b21a7aae409c 100644
> --- a/arch/arm64/boot/dts/apple/t6031-dieX.dtsi
> +++ b/arch/arm64/boot/dts/apple/t6031-dieX.dtsi
> @@ -73,6 +73,38 @@ DIE_NODE(pinctrl_aop): pinctrl@2a8824000 {
>  				<AIC_IRQ DIE_NO 601 IRQ_TYPE_LEVEL_HIGH>;
>  	};
> =20
> +	DIE_NODE(avd_dart): iommu@2cd010000 {

[Severity: Low]
Are these new nodes inserted in the correct order? In kernel device tree fi=
les,
nodes are conventionally sorted by unit-address.

The patch inserts iommu@2cd010000 and video-codec@2cd070000 between
pinctrl@2a8824000 and pinctrl@2b3000000. Since 0x2cd010000 and 0x2cd070000
are numerically greater than 0x2b3000000, should these new nodes be placed
after pinctrl@2b3000000 instead?

> +		compatible =3D "apple,t6031-dart", "apple,t8110-dart";
> +		reg =3D <0x2 0xcd010000 0x0 0x4000>;

[ ... ]

> +	video-codec@2cd070000 {
> +		compatible =3D "apple,t6031-avd", "apple,t8122-avd";

[ ... ]

>  	DIE_NODE(pinctrl_ap): pinctrl@2b3000000 {
>  		compatible =3D "apple,t6031-pinctrl", "apple,t8103-pinctrl";
>  		reg =3D <0x2 0xb3000000 0x0 0x4000>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260926-avd-v2-0-e=
cebe6a3648e@icloud.com?part=3D17
