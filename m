Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795343166;
	b=dRZSxF3j5H3k/kzE+WM+F7w/D1MtGY9pPGzi90EMkXJmEMFvdfSdcn5ZvKlWddcX7gF/
	 kENj2AWC2UIUYPNcamDi5DyNPJh+dTKpPBO1inBLN8J7zKMNhnuNUM7I248776yP+JS5O
	 UjGujXqO/2KTsArZcwJi9fEHueu2Qzn8Pa15zWkfJuqYoA43h20LmBEaAw4iQ0t1ERn1/
	 met96WfRUtFjR717HGfzpc08aEyG6aDVXC69N5hreu94QpD9X3Rvb2dAIzPEQWIXwcTzC
	 T4iWHogkqcnw/fS9YZ7rUDUbk5jO+N5pWZ1Tpgk03rPrdNqaBmYNnMIyrGzf1NrUKnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795343166;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=vU9q9JLNY1/CXqxD8YzidckGwSnhAMWj1kR6PcnY94Q=;
	b=Yl6HPk+77r3Zes0+2cIzjsfEMkaFcIXeTEwJaGBaHVWgDo899DiwfUpTDk1O13Ia4tyW
	 LT6KKf8vP4c1Z+1/n53sfYk2opnD99h41vXXF+Avmz+m90D11OpBiKf29HH40SAtTsRta
	 91G1sfCOyk/b1kMquVyZUWVL72m0FtTZ3pQhyBIlY4gKtW0eGSWgNDI7LmdAyKVj/6jRQ
	 SgRzN/sL8Ofty8Nzb6nUyGCBYc09lced/HsKszfZ5EFvvJii9TVja6eqT0YpUbKws7wt6
	 5Y1ohxkuFop1zPiRpW7p4GWmjzWra3nfdnus0rwCDhIiLWqL6UTAYJmUVukvS5BfISg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="cC1U/yWW";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F69606A320
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 10:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cC1U/yWW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DD601F000CA;
	Sun, 22 Nov 2026 10:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795343166;
	bh=vU9q9JLNY1/CXqxD8YzidckGwSnhAMWj1kR6PcnY94Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cC1U/yWWxYht3hfr+c9lIEdno9LLrzgSoiGkfpKpvZsgihrrMr68oa35jW88EwHVG
	 NnGsV2fbVRnGXz8O8VFSXEZ1puSZHri644wiu8FwGcQ65eM6ioEI+fStYjfpvFOyGr
	 P8bdZDzcOdxHIMzxNCXyVEmcDXf28Z6DdhIB5ddF0RoNoy/Wqu1qhk8qbQoXVEpUtn
	 7nRFiOnC2z85k2bB9KVNBJPshFEzJFkKo6jWFVLQAUNw0kRWK8IOoo6lPWn6TTPVD9
	 BWMx/eeJ/C0biIOlwPaMhEdaBLPGjm3lVEx8OVuysNtpYFyBERdQiwXTCBQ9iZ5A3W
	 xkthwTxOt1BMA==
Message-ID: <sashiko-outbox-227891@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] ARM: dts: bcm2835: replace deprecated LED
 fragment on Raspberry Pi Model B
Reply-To: sashiko-reviews@lists.linux.dev
To: "Artem Novak" <artem122novak@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261122101759.206056-3-artem122novak@gmail.com>
References: <20261122095225.200916-1-artem122novak@gmail.com>
 <20261122101759.206056-1-artem122novak@gmail.com>
 <20261122101759.206056-3-artem122novak@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 22 Nov 2026 10:26:05 +0000
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
- [Low] ARM: dts: bcm2835: inlining deprecated LED dtsi duplicates
  legacy label node
--

commit 63b377a339b5c423a1e61107aa45808a3f4ef120
Author: Artem Novak <artem122novak@gmail.com>

ARM: dts: bcm2835: replace deprecated LED fragment on Raspberry Pi Model B

This commit replaces the bcm283x-rpi-led-deprecated.dtsi include in
bcm2835-rpi-b.dts with an inline gpio-leds node defining the ACT LED.

> diff --git a/arch/arm/boot/dts/broadcom/bcm2835-rpi-b.dts b/arch/arm/boot=
/dts/broadcom/bcm2835-rpi-b.dts
> index 72764be75a799..660814ce851b9 100644
> --- a/arch/arm/boot/dts/broadcom/bcm2835-rpi-b.dts
> +++ b/arch/arm/boot/dts/broadcom/bcm2835-rpi-b.dts
> @@ -3,7 +3,6 @@
>  #include "bcm2835.dtsi"
>  #include "bcm2835-rpi.dtsi"
>  #include "bcm2835-rpi-common.dtsi"
> -#include "bcm283x-rpi-led-deprecated.dtsi"
>  #include "bcm283x-rpi-smsc9512.dtsi"
>  #include "bcm283x-rpi-usb-host.dtsi"
> =20
> @@ -93,8 +92,17 @@ &hdmi {
>  	status =3D "okay";
>  };
> =20
> -&led_act {
> -	gpios =3D <&gpio 16 GPIO_ACTIVE_LOW>;
> +/ {
> +	leds: leds {
> +		compatible =3D "gpio-leds";
> +
> +		led_act: led-act {
> +			label =3D "ACT";
> +			gpios =3D <&gpio 16 GPIO_ACTIVE_LOW>;
> +			default-state =3D "keep";
> +			linux,default-trigger =3D "heartbeat";
> +		};
> +	};
>  };
> =20
>  &pwm {

[Severity: Low]
Why inline bcm283x-rpi-led-deprecated.dtsi back into bcm2835-rpi-b.dts while
keeping the deprecated label =3D "ACT" property?

Commit 1156e3a78bcc ("ARM: dts: bcm283x: Move ACT LED into separate dtsi")
factored this node out into bcm283x-rpi-led-deprecated.dtsi specifically so
existing Raspberry Pi boards can share the legacy label definition (Needed
to preserve the /sys/class/leds/ACT userspace ABI) without duplicating it in
every board file.  Replacing the shared include with an open-coded copy pro=
duces
an identical DTB while reverting that consolidation and adding a second
root node block (/ { ... };) in the middle of the phandle overrides.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261122101759.2060=
56-1-artem122novak@gmail.com?part=3D2
