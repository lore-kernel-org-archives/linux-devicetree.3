Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794826541;
	b=fZ8tv4KjXhWAAjvZWPkRZON6hf4voc9VDZvnLJfx7Uma8E0mrDMlGnD2/Gqxo6PHhAgz
	 vgJW45FA1bkTxwyeZjuclKvwgvFIBDXDgq44y9GcJ7w9MaPocs76psFwjBXK85lKx/CMN
	 MnXqE1S4/0nm3xgiDVezRcfPCbCCF52QvVywD8G9Zd8YkghVDojtJCabtgSUCHlf9IZfV
	 I/fNWnJe1e1WIFz0JdQikVlwu77T9ixhL1gDJ/hHL03WUiyE7QKyeIncMNiaOK69r1DTH
	 ENkh5K79HaVaMK/Uqla2f7HGn1mfCeqcXlHt2PDddq3vfCvM8gN+gm8pHp1EKlZlOBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794826541;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=yCBSjpbCldSnHNBTPEQgfkK1lBLWXylXJNWWsIjLwsA=;
	b=x/begcffu59c40SB+1U3/ZBhT02woScDSB1CtY696RmJFcYIXkpifUonOepUziFMCqf9
	 he5aedgvRo/nGkC850wJB+olkgBm9uq10k2AnRWSoi1yW4vwGkhbdAydTfMYTliEa/l3Z
	 YcLqI+JZQQonEJPZjZo5SkhcRUKBeuY9/Tn4AI4yJcoMRv7kzCqwYYbvoYZIbVlgu1640
	 weJvFqFaluAyhIEIbTz9K7QC3fT8Hn3gaOy7E4FTAJonGoc9+0BPASUWCr+EjjLlhbyVj
	 PKzK1XfJ9meJ7QVBI1Pr7wdIr2vciRzmE8mLZqQbpeOf5+D1uK6a+WfFsiYPbJfUVew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fBRX2jiV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3EA8606A8BE
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 10:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fBRX2jiV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13B6E1F000C4;
	Mon, 16 Nov 2026 10:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794826541;
	bh=yCBSjpbCldSnHNBTPEQgfkK1lBLWXylXJNWWsIjLwsA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fBRX2jiVp7/jv2HxdOHbMeDmYcF5IZ9p3WWz92/J2/H8uiLLa9AcIW4g5kkfFcGzb
	 S0uQPSB49bP6ZGiNfFeXI+8w+Ju7i0KDDjkhN5jAXEeEOdKF2Sa3r8DSX/iUJg1SkC
	 8fXMUWvwYRomNSvV55Fxc/G5Hz4UXHf3fOw5fdAahzzqbvwbH+jsKOJ+57dMcviKUE
	 MNe9Yeuwt2jz0kO3BHm4iJ7Bp+4bq/pXrRB1eyPbJDNY/HhVc4kF0z52QUnblSFHaH
	 GGOIZeBOYuA73Hs5BO7nAYXvPVp3CsT7mkE3SlhH01vBZ7d5Av8FNw5VJ17eqnbcMr
	 UuRtskEDFdDiw==
Message-ID: <sashiko-outbox-216799@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] ARM: dts: ux500: Add power domains
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261116-ux500-powerdomain-dts-v1-2-e0f4459c3ab1@kernel.org>
References: <20261116-ux500-powerdomain-dts-v1-0-e0f4459c3ab1@kernel.org>
 <20261116-ux500-powerdomain-dts-v1-2-e0f4459c3ab1@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 10:55:40 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] ARM: dts: ux500: undocumented power-domains on sram, scu, mtu,
  gpio, dma, msp
--

commit ad3830cd03ea9fc02a3f12605289fd37c7711d23
Author: Linus Walleij <linusw@kernel.org>

ARM: dts: ux500: Add power domains

This commit adds power-domains properties to the CPU and SoC peripheral
device tree nodes in ste-dbx5x0.dtsi.

> diff --git a/arch/arm/boot/dts/st/ste-dbx5x0.dtsi b/arch/arm/boot/dts/st/=
ste-dbx5x0.dtsi
> index 5b2b4527a4724..b3b3cec696561 100644
> --- a/arch/arm/boot/dts/st/ste-dbx5x0.dtsi
> +++ b/arch/arm/boot/dts/st/ste-dbx5x0.dtsi
[ ... ]
> @@ -154,6 +156,7 @@ sram@40020000 {
>  			reg =3D <0x40020000 0x40000>;
>  			#address-cells =3D <1>;
>  			#size-cells =3D <1>;
> +			power-domains =3D <&pm_domains DOMAIN_ESRAM_12>;
>  			ranges =3D <0 0x40020000 0x40000>;
>  		};
>  		sram@40060000 {
> @@ -162,6 +165,7 @@ sram@40060000 {
>  			reg =3D <0x40060000 0x40000>;
>  			#address-cells =3D <1>;
>  			#size-cells =3D <1>;
> +			power-domains =3D <&pm_domains DOMAIN_ESRAM_34>;
>  			ranges =3D <0 0x40060000 0x40000>;

[Severity: Low]
Do the DT binding schemas for these nodes allow the power-domains
property?

Adding power-domains to sram@40020000 and sram@40060000 (sram/sram.yaml),
as well as scu@a0410000 (arm/arm,scu.yaml), mtu@a03c6000
(timer/st,nomadik-mtu.yaml), gpio0 through gpio8
(gpio/st,nomadik-gpio.yaml), dma-controller@801C0000
(dma/stericsson,dma40.yaml), and msp0 through msp3
(sound/stericsson,ux500-msp-i2s.yaml) below, causes dtbs_check to fail
because those schemas set additionalProperties or unevaluatedProperties to
false without documenting power-domains.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-ux500-powe=
rdomain-dts-v1-0-e0f4459c3ab1@kernel.org?part=3D2
