Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795343246;
	b=Lp4YIai6YF+WkFZgZjsQFgJGmJ85Cmy0ogp4vxX7SS86dCLjUVK7JZ2GJle1rkkVnXah
	 wyNSDgMu24A6hEwpPBvjv76YX2QZ3EUr4ZLUlhE0zseVED6jNSlfbauh3aVeJEE3li9FH
	 roWd1yuVqGFDwzlKDb7MniMnSrCIOgP5LCemkhzPRue3Ksof36z6MuNrP+zUuy0bZlkrS
	 OthNoZEqp8GvkuWR24SCC9rt84Po0ZaKTCjyk8le03iuDjv0j50uTnAW3zBxhdN6LI0kd
	 vmm+yJi2sC8IKZTAe74+4Wn8wR3pwKU4CA9N8n8ZZgxaZQcMi2dZ/CTvkJLLXYKZGyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795343246;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=j6enc7fPOBlKoNL0c63jaotDLqd4GGPb39qNfXsWq38=;
	b=Vv0DVNtK6XW3a0BudDgbzFeXa2suHgi2fBDjYnuN9e6/CLJxdV6sRPRyaUTagqyQGEQm
	 yjHLTJATv54qa6NH55RvcM/q29qNc6JZraOIGVMruE7IWMVjIbk0ddzEBsJugx1ie1LIj
	 mx6s82lb7+TXBJs2dCxsfTKxmD1sCUI/AAx3c4tY3oJJDhl7c02UGbQN5GAqvzve3ca33
	 OjjneFv4CWzekxEyTYEBpPE893qjoxRSmkEQyUzXyRdcdrrZwuptGMU6JtguBxtGarzTW
	 aSM79ZpmPUlFlcFxGwvOFVghYSrlWkGjTwgiOQOhlqvy0yXZOKsmAT1YOfVa1SsRr7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="A2QM/UwR";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D2A606A32C
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 10:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A2QM/UwR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FC441F000C0;
	Sun, 22 Nov 2026 10:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795343245;
	bh=j6enc7fPOBlKoNL0c63jaotDLqd4GGPb39qNfXsWq38=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=A2QM/UwRl4+eyAqBhCsTF9s9oc0zklSGEABTDfeQ9x3QTtesaUrePNoR0e5nyqgZ9
	 dHWDSt6ZrXf9Dm7iJYw+7zslfC9A29sxe7QM/WyT5DKF2pl8pLiEEr1EVvJFmIfPhF
	 7gwjun6cn4qqVbno0VE18ZJK/+yr0imiV1X/MSqA+N5MLLVvoAmG7ZmMF3Pq0yZ6Ec
	 Ow7pXZmj6WK0yMtEp2ZWu9gclKO/dksa7Hci8A/LhPmFqWGcLj9/sUimVGC7PIfCWR
	 FFUtc2NismZaX+L8xOqwQxbttVrGq1dNoHC/08RESfuq305jgcrydxW8jALQDy15Gc
	 l95c+pgPRMAUA==
Message-ID: <sashiko-outbox-227892@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] ARM: dts: bcm2835: replace deprecated LED
 fragment on Raspberry Pi Zero
Reply-To: sashiko-reviews@lists.linux.dev
To: "Artem Novak" <artem122novak@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261122101759.206056-2-artem122novak@gmail.com>
References: <20261122095225.200916-1-artem122novak@gmail.com>
 <20261122101759.206056-1-artem122novak@gmail.com>
 <20261122101759.206056-2-artem122novak@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 22 Nov 2026 10:27:25 +0000
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
- [Low] ARM: dts: bcm2835: redundant inlining of
  bcm283x-rpi-led-deprecated.dtsi
--

commit 6102946db777d06293b2fcb5e3eab012124a2da6
Author: Artem Novak <artem122novak@gmail.com>

ARM: dts: bcm2835: replace deprecated LED fragment on Raspberry Pi Zero

This commit replaces the bcm283x-rpi-led-deprecated.dtsi include in
bcm2835-rpi-zero.dts with an inline gpio-leds node.

> diff --git a/arch/arm/boot/dts/broadcom/bcm2835-rpi-zero.dts b/arch/arm/b=
oot/dts/broadcom/bcm2835-rpi-zero.dts
> index 539c19c10946c..e01f668cb9e04 100644
> --- a/arch/arm/boot/dts/broadcom/bcm2835-rpi-zero.dts
> +++ b/arch/arm/boot/dts/broadcom/bcm2835-rpi-zero.dts
> @@ -7,7 +7,6 @@
>  #include "bcm2835.dtsi"
>  #include "bcm2835-rpi.dtsi"
>  #include "bcm2835-rpi-common.dtsi"
> -#include "bcm283x-rpi-led-deprecated.dtsi"
>  #include "bcm283x-rpi-usb-otg.dtsi"
> =20
>  / {
> @@ -101,8 +100,17 @@ &hdmi {
>  	status =3D "okay";
>  };
> =20
> -&led_act {
> -	gpios =3D <&gpio 47 GPIO_ACTIVE_HIGH>;
> +/ {
> +	leds: leds {
> +		compatible =3D "gpio-leds";
> +
> +		led_act: led-act {
> +			label =3D "ACT";
> +			gpios =3D <&gpio 47 GPIO_ACTIVE_HIGH>;
> +			default-state =3D "keep";
> +			linux,default-trigger =3D "heartbeat";
> +		};
> +	};
>  };

[Severity: Low]
Why inline bcm283x-rpi-led-deprecated.dtsi here?

Commit 1156e3a78bcc ("ARM: dts: bcm283x: Move ACT LED into separate dtsi")
factored the legacy leds and led_act node into
bcm283x-rpi-led-deprecated.dtsi so existing Raspberry Pi boards could share
the deprecated label =3D "ACT" property (needed to preserve /sys/class/leds=
/ACT
for userspace) without new boards inheriting it from bcm2835-rpi.dtsi.

Open-coding the same node in bcm2835-rpi-zero.dts retains the deprecated
label =3D "ACT" property while duplicating the shared fragment used by the
other Raspberry Pi boards, and introduces a second / { ... }; root node blo=
ck
in the middle of the phandle overrides.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261122101759.2060=
56-1-artem122novak@gmail.com?part=3D1
