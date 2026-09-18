Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5124C4F30C3
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 13:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789738088; cv=none; b=HJcVtnlrFl3QhcACPx0S/9OTRR3Is7WSoF7N+wglq6dgSgug2jRZNKLvPC84vVZcSnl55Tnwl62r8Sy3fO2lAyr4oPLMu9MpxxHGMz1FvipzRxdfx3LM51NgfKu1O8Ks11kfSk0XSOLmca33a0OpkS4z0zbztmEMy2aQKeq+08Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789738088; c=relaxed/simple;
	bh=Eop3jSxLsjZxZhwIKyqqP96EmgDGgKs+1PzSiuKIJY8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uvX/UxOHSD87yzY9v+ZLkTSWXEY0UVKAx6vTbx5l+6Pn7zihqPHZ9fC1q8fNa8AAuUavEOKb81SYlrWPIdnqBb8kCrgyDzF3WXtBMLD45kCYNpHFtyGDGdSePIco0976oRMNgaPxR/5l8/eb6dju7Y2clFdAno65ypnohY0h4Eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OIM9FI8K; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OIM9FI8K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B0741F000FF;
	Fri, 18 Sep 2026 13:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789738086;
	bh=5DIMPnmdVjJBfEojPavAkYIk3SWBbk1lPNi2IA52xUA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OIM9FI8KNS9P0Lupi6XYf52uPF8D9n/v/Z21cxC+Lugyxfi2A2erSbBoCQpghVBxe
	 YpnHstqQ4XpjA8W+K3zqjZivvgvXZ27aLoKF16/x7iDr1zniYt7EUgS316Y2FgHu9a
	 MwFuOemsuWZ3nrWMfZoWOMfjyyeWfEn8C2nLoyxuNCrlQM5oyi+l8vx52CPiAehisT
	 u/IPjfOueu9hCkjSkB9Zi2tMpLWlS4IIGsrJTp5NBZ9f0LpNreEuDPk02udYNp2DMB
	 GK7ci+zjZNonLe82sRw8sk4k5EAKXl6foqjN3Pac/Dia6f/oPbDcVA8UjPrx0v3m7O
	 aYyuVlpB+5Uww==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 08/14] arm64: dts: apple: t6030: add avd nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sofus Forstreuter" <sofus.c@icloud.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260918-avd-v1-8-49977931f455@icloud.com>
References: <20260918-avd-v1-0-49977931f455@icloud.com>
 <20260918-avd-v1-8-49977931f455@icloud.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 13:28:06 +0000
Message-Id: <20260918132806.9B0741F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] dt: undocumented compatible string apple,t6030-dart
- [Low] dt: nodes avd and avd_dart are not sorted by unit address
--

commit 1c295b9d0d2ddda136e588deb146546700501f9d
Author: Sofus Forstreuter <sofus.c@icloud.com>

arm64: dts: apple: t6030: add avd nodes

This commit adds the avd and avd_dart nodes to the t6030 device tree.

> diff --git a/arch/arm64/boot/dts/apple/t6030.dtsi b/arch/arm64/boot/dts/a=
pple/t6030.dtsi
> index dda9568af11f9..802759a2352fa 100644
> --- a/arch/arm64/boot/dts/apple/t6030.dtsi
> +++ b/arch/arm64/boot/dts/apple/t6030.dtsi
> @@ -361,6 +361,30 @@ pmgr_gfx: power-management@290e80000 {
>  			/* child nodes are added in t6030-pmgr.dtsi */
>  		};
> =20
> +		avd: avd@30b080000 {

[Severity: Low]
Does this node ordering violate the device tree convention of sorting nodes
by unit address in ascending numerical order? The avd@30b080000 node is
placed before the iommu@30b010000 node, which can trigger dtc W=3D1 warnings
when building the device tree.

> +			compatible =3D "apple,t6030-avd", "apple,t8122-avd";
> +			reg =3D <0x3 0x0b080000 0x0 0x12000>,
> +			      <0x3 0x0b092000 0x0 0x12000>,
> +			      <0x3 0x0b0a4000 0x0 0x4000>,
> +			      <0x3 0x0b100000 0x0 0x10000>;
> +			reg-names =3D "code", "sram", "mbox", "ctrl";
> +			interrupt-parent =3D <&aic>;
> +			interrupts =3D <AIC_IRQ 788 IRQ_TYPE_LEVEL_HIGH>,
> +				     <AIC_IRQ 789 IRQ_TYPE_LEVEL_HIGH>;
> +			power-domains =3D <&ps_avd_sys>;
> +			resets =3D <&ps_avd_sys>;
> +			iommus =3D <&avd_dart 0>;
> +		};
> +
> +		avd_dart: iommu@30b010000 {
> +			compatible =3D "apple,t6030-dart", "apple,t8110-dart";

[Severity: Low]
Is the apple,t6030-dart compatible string missing from the dt-bindings
documentation? Because the schema uses additionalProperties: false, the
absence of this entry from Documentation/devicetree/bindings/iommu/apple,da=
rt.yaml
will cause a standard dtbs_check warning when validating the device tree.

> +			reg =3D <0x3 0x0b010000 0x0 0x4000>;
> +			#iommu-cells =3D <1>;
> +			interrupt-parent =3D <&aic>;
> +			interrupts =3D <AIC_IRQ 795 IRQ_TYPE_LEVEL_HIGH>;
> +			power-domains =3D <&ps_avd_sys>;
> +		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918-avd-v1-0-4=
9977931f455@icloud.com?part=3D8
