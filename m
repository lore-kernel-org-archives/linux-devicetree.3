Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793984909;
	b=dJlJPa6pDXxaqttEjn+K4r+Hg7maRAp7vbabOPeMTzbnXbfaEpQ6H1/fUTDAjp5wGMcY
	 t4vtmUS+VeCdxyNC2WecTdpiiIlqJBxVzSUPIrGmq2kvg3F/UXjAsFd51cgP4RH6C3Hn5
	 TwFCGVL75ojqAUS25JIhDLT9LAXhfxq+K6CEiH234MhnEhztui2ou6t1kdSIEyrwyUIDm
	 kcvR9jbT5c7chSHNyqo23AOiw1ouFilwHBvBtMQ2mgF5b1eqdnIVm7g/Xa33IEVp4w0Iw
	 8N9n9bUBoFolgWKEGKfjYiiwnfrSyrB7JzlOY1zP1N7NOcU7AvVQCY+JsmcD9j3e6zQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793984909;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=9NkqfV90MF6vU8LdIkdapKwx5uT28pYX0IpqB7ywa0Y=;
	b=tAOAC77gJ499IkNMgCLNGST4KxxUN3ohIc+Z0wao9x4Mk7fhB8QUsqVvYP0dOIDwJfar
	 5c2xTjA556/9uJyKejWgFcZn2ARVCcfG7EX6d2A3qSWXMs8fT+KJP+atDDmx+J1Te+wmM
	 6c8nwRHOxbNNCWVEA7A75E8XzaazKHj0ZnGnEB1OB0JjeXMqGXhPMO1h1XbkBwe+Ll/ra
	 ojVKvdgBVxmIRAQ/IA7XTXOoyCnvvw3K2226zwweUjjcFw3E5E6swPwJCrl/APovLR4NZ
	 lqSuutjipOiSdrae8DfRrB650AtynNKXe4xjZPMvSA+U2KVpj1SaQDx6wtTRnXzcYPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LbumBLTg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F0C606A326
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 17:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LbumBLTg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0BED1F0089F;
	Fri,  6 Nov 2026 17:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793984908;
	bh=9NkqfV90MF6vU8LdIkdapKwx5uT28pYX0IpqB7ywa0Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LbumBLTgE5SOIAF7+Ss1uxHfYULNlx+RTyHLfHChigQwwlJwm6K1bTUTF9R7nKnSO
	 tKJSsvRo9sz0rbfRE9a78A9HWTbhti0+ld+JLFdSJkL0x7o+ozodqliHqZCAJZuoxv
	 LqIDPea4Tc+qpZwzykPBEtQxYC9RN3ikIBRBvzNV1BX8TiVCggEy2c2CjnT66gIsi/
	 yhei3TadS6ds2Mbzr8eBOTBrGB1pokavrnS8ePbNakbkd/7ybDBLGikq8JKKAOvnJ2
	 K+PSg1q9jEVNByxxxPSo25Wienau/2qQ618FnFvcYo1AqJUkctBSZkSiDAjaY61EXz
	 tFwTWtje9b+Pg==
Message-ID: <sashiko-outbox-201897@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/4] arm64: dts: apple: t8132: Fix ordering-related
 dt-check-style issues
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yureka Lilian" <yureka@cyberchaos.dev>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261106-apple-dts-m4-dt-style-check-v2-4-1e715e80b066@cyberchaos.dev>
References: <20261106-apple-dts-m4-dt-style-check-v2-0-1e715e80b066@cyberchaos.dev>
 <20261106-apple-dts-m4-dt-style-check-v2-4-1e715e80b066@cyberchaos.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 17:08:27 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Low] arm64: dts: apple: t8132: root model placed before compatible
  breaks strict style
- [Low] arm64: dts: apple: t8132: #address-cells after nonposted-mmio
  and unsorted props
--

commit 85a1def59cfd948af8883a7bded0a54104bc0b30
Author: Yureka Lilian <yureka@cyberchaos.dev>

arm64: dts: apple: t8132: Fix ordering-related dt-check-style issues

This commit reorders nodes and properties in the Apple t8132 device trees to
address strict dt-check-style warnings.

> diff --git a/arch/arm64/boot/dts/apple/t8132-j604.dts b/arch/arm64/boot/d=
ts/apple/t8132-j604.dts
> index 93076cd923a93..ebf25fb1bd3cd 100644
> --- a/arch/arm64/boot/dts/apple/t8132-j604.dts
> +++ b/arch/arm64/boot/dts/apple/t8132-j604.dts
> @@ -14,8 +14,8 @@
>  #include <dt-bindings/leds/common.h>
> =20
>  / {
> -	compatible =3D "apple,j604", "apple,t8132", "apple,arm-platform";
>  	model =3D "Apple MacBook Pro (14-inch, M4, 2024)";
> +	compatible =3D "apple,j604", "apple,t8132", "apple,arm-platform";
> =20
>  	led-controller {
>  		compatible =3D "pwm-leds";

[Severity: Low]
Does placing model before compatible in the root node introduce a
dt-check-style --mode=3Dstrict regression here and in t8132-j623.dts,
t8132-j624.dts, t8132-j713.dts, t8132-j715.dts, and t8132-j773g.dts?

Per Documentation/devicetree/bindings/dts-coding-style.rst and
scripts/dtc/dt-check-style, compatible belongs to the first canonical group
whereas model is a general property, so swapping them triggers a new
property-order warning that compatible should sort before model.

[ ... ]

> diff --git a/arch/arm64/boot/dts/apple/t8132.dtsi b/arch/arm64/boot/dts/a=
pple/t8132.dtsi
> index b1e77a8ae4066..e2e79c7e7fd07 100644
> --- a/arch/arm64/boot/dts/apple/t8132.dtsi
> +++ b/arch/arm64/boot/dts/apple/t8132.dtsi
[ ... ]
> @@ -190,50 +197,44 @@ l2_cache_1: l2-cache-1 {
>  		};
>  	};
> =20
> -	clkref: clock-ref {
> -		compatible =3D "fixed-clock";
> -		#clock-cells =3D <0>;
> -		clock-frequency =3D <24000000>;
> -		clock-output-names =3D "clkref";
> -	};
> -
>  	soc: soc {
>  		compatible =3D "simple-bus";
> -		#address-cells =3D <2>;
> -		#size-cells =3D <2>;
> =20
>  		ranges;
>  		nonposted-mmio;
> =20
> +		#address-cells =3D <2>;
> +		#size-cells =3D <2>;

[Severity: Low]
Should #address-cells be placed before nonposted-mmio in soc?
dt-check-style --mode=3Dstrict sorts standard properties alphabetically by
their #-stripped names (address-cells, nonposted-mmio, size-cells), so
placing #address-cells after nonposted-mmio still triggers a property-order
warning.

Several other within-group alphabetical property-order warnings under
--mode=3Dstrict also remain in these files: cpu_e0..cpu_p3 (cpu-release-addr
after enable-method, and cache properties in reverse order),
pinctrl_nub/smc/aop/ap (gpio-controller before #gpio-cells,
interrupt-controller before #interrupt-cells, and power-domains before
gpio-controller), l2_cache_0..1, i2c0..i2c4, fpwm1, serial0, and led-0 in
t8132-j604.dts, t8132-j713.dts, and t8132-j715.dts.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-apple-dts-=
m4-dt-style-check-v2-0-1e715e80b066@cyberchaos.dev?part=3D4
