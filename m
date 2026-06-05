Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C3A21D590
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 02:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780626985; cv=none; b=Beoi9cP2s+xOWUkwHvWRxYx2Mb88SEHrT78ky8JUdlqUJSn9HnG6ucpT42grWprrh4UqlvoNQoLsgjPzr299RTX3ew5SPp4mKkiEnhe6OaiiXpf1ZqNIn5n2g20yC8CJM35yxgFOoQicqT+xcD5fmORS3wwTX4J7ga0YrIVFSVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780626985; c=relaxed/simple;
	bh=fVuKjrj35y3EG4YdMZzqhRRTYsjEQBmdLbIN/eRRvNU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UAqc62lwTambof0sH5RqrJn/dTtc1DSLgOsDzKxddNRtR0BEyxQQc2RV5YdgSzGuAlYXHJxjjNJc34y17HJPM6aKYPerPtA0/nz64AdaJmnZnK/MzK/zprCfj3JQ5Kf+6wk6nPdsBVr9x6lq7jdY7j+Q+51688sj5jzwtdIxfjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CPs8eydK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CPs8eydK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C10061F00893;
	Fri,  5 Jun 2026 02:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780626980;
	bh=Lz1MrKbGC35bVNjFz+SNMh4gZSksUWMhJKlK7LZQK8I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CPs8eydKlw+WBxF3ISjpok0n64+u9jNY5Gv+NTc3vDnMMZvLwq0FrpYa2QoMcwVxz
	 qfB4B++4bb04ekFYZM7emk7YouQ6eTbN/jYAU+QNQvi+HxuLvb+zZq3XQNw0yN2jNs
	 xjk59G6UY50BT2REIY9J9hEUGJwNt2ARGKU2KiTLSeWcV/VlqA6Bpr1mbs6bQLGPmi
	 l1xU385aDBvwep7ZFj3y2Ii4UvfBz+7f7WsQMPj40E4t7x2L6Z+iScPlglrqlvn/ii
	 0DAgABxfz0KlZXTJUOKIosQ9nCK89DRZhNkLf+JOLnTXOhQjliNM4TE4TGx2dpsuRP
	 1DolGjf42V19w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 2/3] arm64: dts: rockchip: Add missing hclk for
 RK3588 eDP1
Reply-To: sashiko-reviews@lists.linux.dev
To: "Damon Ding" <damon.ding@rock-chips.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260605022305.3058853-3-damon.ding@rock-chips.com>
References: <20260605022305.3058853-3-damon.ding@rock-chips.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 02:36:19 +0000
Message-Id: <20260605023619.C10061F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Incorrect clock name "hclk" is used instead of "grf", which viol=
ates the DT binding schema and prevents the eDP driver from explicitly mana=
ging the clock.
--

commit a1adb5c9bb9ba76654d07ba8c6320c7edf51f41b
Author: Damon Ding <damon.ding@rock-chips.com>

arm64: dts: rockchip: Add missing hclk for RK3588 eDP1

This commit adds the required HCLK_VO1 bus clock to the RK3588 eDP1 node.
It intends to manage the clock explicitly instead of relying on implicit
enabling via the GRF phandle reference.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi b/arch/arm64/=
boot/dts/rockchip/rk3588-extra.dtsi
> index a2640014ee042..b251bb129cdbf 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
> @@ -285,8 +285,8 @@ hdmi1_out: port@1 {
>  	edp1: edp@fded0000 {
>  		compatible =3D "rockchip,rk3588-edp";
>  		reg =3D <0x0 0xfded0000 0x0 0x1000>;
> -		clocks =3D <&cru CLK_EDP1_24M>, <&cru PCLK_EDP1>;
> -		clock-names =3D "dp", "pclk";
> +		clocks =3D <&cru CLK_EDP1_24M>, <&cru PCLK_EDP1>, <&cru HCLK_VO1>;
> +		clock-names =3D "dp", "pclk", "hclk";

[Severity: Medium]
Should this clock name be "grf" instead of "hclk"?

According to the device tree binding schema for rockchip,analogix-dp, the
third clock name is expected to be "grf".

The driver looks up this clock using devm_clk_get_optional(dev, "grf"). If
"hclk" is used here, the driver will fail to find it, receive a NULL
pointer, and won't explicitly enable the clock as intended by this patch.

>  		interrupts =3D <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH 0>;
>  		phys =3D <&hdptxphy1>;
>  		phy-names =3D "dp";

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605022305.3058=
853-1-damon.ding@rock-chips.com?part=3D2
