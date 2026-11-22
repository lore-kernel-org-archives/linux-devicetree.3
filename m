Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795341759;
	b=Y7IrtqohX6pKdwuLGqUBjIYrTpConeCgHOJQaUXkph+YQDvSDgyXMrBM31ZtjOvRl0OE
	 u6Q2mjA1SdcBrazhZ6qZuAvJUEQzv+lkjcYSEVEy/8yJKgOgDUh3HTyu/uvtEipLWX+u1
	 Phcmwwc458vRfqciSvQUDNtGnNyc2d8BVHHevCVpH3dsvfHrmgjlOPyHsqbCCwVKODz0Z
	 2se9fhPPjxSStO+zV0APuj51yol2qGh+O6mJDI7B5U/dNQjsLx6UWXEBn0kvQA7p7s7L7
	 LcAbnEvaKGI85ehWHIZ0Uvos8cmWhcMskp0V5VJJj++AwWovsmODwHpQNjgr1VrZqyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795341759;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=AKrmexxKjbXz8t2Pm4Lv9mBFvPg0o/B8VUW4GTlEO5M=;
	b=SbFsBfMrBb/2rSIWqQMsDBic12rG1Ca2DVkFXB6rJs/fwr4mddz7fJDzZILR1K6nGXdb
	 MCNGFTnjgxF6QS7VfGBHmwwt9+CWkmngf+jsTu6j/Zd6yKo8G2CDjCx4U6XHgoHP/5Tld
	 GFOrqVszk7YFUTcm0kY3+nJ24xeq6L9CAZvn44KyWrrt9R0+Evls3vgUtSBbwrImv/X7a
	 abTVi4iMg9tIjZqKyvskifGt5CV7WrClymINwFKjc+X2Olww2syV2AMBB8VunAs3PEi3a
	 hFuLxiuGWHgI/DgAHI6S4FZYhNaX6RLEqcUPbWwNPVuiEFOAGlYvR8S/QfycCnBzllA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RUYuy0J3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EBF1606A320
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 10:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RUYuy0J3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C4571F000C0;
	Sun, 22 Nov 2026 10:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795341758;
	bh=AKrmexxKjbXz8t2Pm4Lv9mBFvPg0o/B8VUW4GTlEO5M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RUYuy0J305g0Gmd9TfSz8x6udnxhD47XmCSOyTtuLcdJee84SfRipRU5XwZL2fO26
	 1K6j2hkyZxTAgxHnee0Hml0uwuk35a9qgnbeQXNQ6LMzejsJZ9Bw5NhKyfHIaFqPk0
	 SbNEBYjxhoLmZgUXJNyrtVxcwIntsDrUnrzVlD/zS7II/jENdA2/EIfXMQFQRdSfZF
	 GYE+XEIdpbT+LsjoYlHA5FiH1+pNnOIi9nqHisllDLrxxod4VDXn3H1H96K1V7bOwP
	 OhBmkdiBzL/bYyk4Fl0qQlQRxNP4jwiXzRUDhAZKWQBzNg96JN6Fzbeszw98UZT9j6
	 kwBvqwAhcMWUA==
Message-ID: <sashiko-outbox-227883@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] ARM: dts: bcm2835: replace deprecated LED fragment
 on Raspberry Pi Model B
Reply-To: sashiko-reviews@lists.linux.dev
To: "Artem Novak" <artem122novak@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261122095225.200916-3-artem122novak@gmail.com>
References: <20261122095225.200916-1-artem122novak@gmail.com>
 <20261122095225.200916-3-artem122novak@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 22 Nov 2026 10:02:38 +0000
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
- [Medium] ARM: dts: bcm2835: dropped leds and led_act overlay symbols
  in bcm2835-rpi-b
- [Low] ARM: dts: bcm2835: inlining deprecated LED dtsi duplicates
  legacy label node
--

commit 49ba1cd9cda13f0341e152094b002fc2c5f37a35
Author: Artem Novak <artem122novak@gmail.com>

ARM: dts: bcm2835: replace deprecated LED fragment on Raspberry Pi Model B

This commit removes the bcm283x-rpi-led-deprecated.dtsi include from
bcm2835-rpi-b.dts and defines a board-local gpio-leds node for the ACT LED.

> diff --git a/arch/arm/boot/dts/broadcom/bcm2835-rpi-b.dts b/arch/arm/boot=
/dts/broadcom/bcm2835-rpi-b.dts
> index 72764be75a799..040ba7f452163 100644
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
> +	leds {
> +		compatible =3D "gpio-leds";
> +
> +		led-act {

[Severity: Medium]
Does dropping the leds: and led_act: node labels here remove those symbols
from /__symbols__ in the compiled DTB?

arch/arm/boot/dts/broadcom/Makefile builds bcm2835-rpi-b.dtb with -@ for
device-tree overlay support, and bcm283x-rpi-led-deprecated.dtsi defined
leds: leds and led_act: led-act.  Omitting both labels removes leds and
led_act from /__symbols__, breaking overlays and bootloader dtparam fixups
that target &leds or &led_act.

> +			label =3D "ACT";
> +			gpios =3D <&gpio 16 GPIO_ACTIVE_LOW>;
> +			default-state =3D "keep";
> +			linux,default-trigger =3D "heartbeat";
> +		};
> +	};
>  };

[Severity: Low]
Why inline bcm283x-rpi-led-deprecated.dtsi into bcm2835-rpi-b.dts while
keeping the deprecated label =3D "ACT" property?

Commit 1156e3a78bcc ("ARM: dts: bcm283x: Move ACT LED into separate dtsi")
moved this node into bcm283x-rpi-led-deprecated.dtsi specifically so existi=
ng
boards could preserve the legacy /sys/class/leds/ACT userspace ABI in one
shared fragment without new boards inheriting the deprecated gpio-leds label
property.  Open-coding the same definition here also introduces a second
/ { ... }; root node block in the middle of the board's phandle overrides.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261122095225.2009=
16-1-artem122novak@gmail.com?part=3D2
