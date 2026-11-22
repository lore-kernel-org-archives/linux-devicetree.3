Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795341732;
	b=CYSGTJ+/Rx3TQuA/9N2uj7LD9WE9/ayyLzaa00cLv8x22PzR+gN3nRIukA2QrgnMjzUM
	 8Nw8JXeyZU0Ja39reGM8265dXiIB2B3VB19g29WQtbfooz1cqqTLErtJHs/3933KcHgwj
	 SnKRMNiffgKc1Z5JzrPFevOIFW9LpVAh3noY1NZqoGAxkvZU01mbvGJD+h16wDV7VcpEB
	 MEjP0SHKTsxez972YfDswsENOEbIc1pOX6f7j86cSlBT4+2hTGU/9SKHa5Ov6TfPvWYDC
	 dSN5yLHFU2SgsYvqbEO3IEKeip0rPVsSvKQQlLjVTwVktPOM6p5VbTM9JgbI9I65MHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795341732;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=nBlftteHVIEiAuZYZpsJcbwR52Vc5MWQKu43KE75t3Q=;
	b=IIQwgbr+P1leEjSKzaY3BFoIf03trU99UP+pkVMtMT1SZjjzhQnKTGK9mjjG2lcAAYz/
	 AmUlYEq/zPuPqixfnyZzpAfoDMtemM+qK2rCW0Sz3UwyRJH/WhSB9xFUmPiEamuPnB1/7
	 Z9urV1mxkzYo4uHdI6M00hG6FBp8MxGxJB1YHzwdW3bGp2IRLICr56SonIZYW7OHUIzvM
	 5cMo3ZJtykqCVE1rDXPqP1cMzTRFPkBJ3THsViaXqMQXXtN1rzXVS6dUos1AXnd3YWOd/
	 Gonus56+YjDews6TqRyOeJpIbaDDTo+4M3+Ri1yW8ayw3pwMUdJfKH5fErnhgkmF+mQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LEvpFXik;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10BBA606A32A
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 10:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LEvpFXik
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72F511F000C4;
	Sun, 22 Nov 2026 10:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795341731;
	bh=nBlftteHVIEiAuZYZpsJcbwR52Vc5MWQKu43KE75t3Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LEvpFXikzisuScrNSzc6NNlMJLbjMXiUDN0D3m7PMtfYyetd1vpay1m46Dn78diFG
	 MjKaS+1PyNcH3+3pWhJPt05wuAjXcMkTIrGbeBidQXnoA2wek2R/chYAhvyhwaZdxK
	 u7eJXZiXu21UppTjtMzxnKVm0OfyzgbPDm5IfhoZr/g98x9qpic4meNgODnmysWMrR
	 PpIRyxDOrMEkaKROieUxPIk4KJMEdWDhsAKZwPNCm6PNe37CK+4YkibT9dmPDvrbTx
	 KR5gIKrO2OQwQBtAaC2sSeGWJM4rrPAj1/BQpKh9IA3KaeRF3uyLWrXTNYYHipFxHm
	 ZKTgP4WXrzVrg==
Message-ID: <sashiko-outbox-227881@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] ARM: dts: bcm2835: replace deprecated LED fragment
 on Raspberry Pi Zero
Reply-To: sashiko-reviews@lists.linux.dev
To: "Artem Novak" <artem122novak@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261122095225.200916-2-artem122novak@gmail.com>
References: <20261122095225.200916-1-artem122novak@gmail.com>
 <20261122095225.200916-2-artem122novak@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 22 Nov 2026 10:02:10 +0000
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
- [Medium] ARM: dts: bcm2835: loss of leds and led_act symbols in
  bcm2835-rpi-zero.dtb
- [Low] ARM: dts: bcm2835: redundant inlining of
  bcm283x-rpi-led-deprecated.dtsi
--

commit 739b5e27f1887a8552cb53d11c780143b2a0ef69
Author: Artem Novak <artem122novak@gmail.com>

ARM: dts: bcm2835: replace deprecated LED fragment on Raspberry Pi Zero

This commit replaces the included bcm283x-rpi-led-deprecated.dtsi fragment
in bcm2835-rpi-zero.dts with an inline gpio-leds node for the ACT LED.

> diff --git a/arch/arm/boot/dts/broadcom/bcm2835-rpi-zero.dts b/arch/arm/b=
oot/dts/broadcom/bcm2835-rpi-zero.dts
> index 539c19c10946c..9364695055b4e 100644
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
> +	leds {
> +		compatible =3D "gpio-leds";
> +
> +		led-act {

[Severity: Medium]
Does dropping the leds: and led_act: node labels here remove the leds and
led_act entries from /__symbols__ in bcm2835-rpi-zero.dtb?

arch/arm/boot/dts/broadcom/Makefile compiles bcm2835-rpi-zero.dtb with -@
(DTC_FLAGS_bcm2835-rpi-zero :=3D -@), and bcm283x-rpi-led-deprecated.dtsi
defined leds: leds and led_act: led-act.  Without those labels, Device
Tree overlays and bootloader dtparam overrides targeting &leds or &led_act
will fail to resolve on Raspberry Pi Zero.

> +			label =3D "ACT";
> +			gpios =3D <&gpio 47 GPIO_ACTIVE_HIGH>;
> +			default-state =3D "keep";
> +			linux,default-trigger =3D "heartbeat";
> +		};
> +	};
>  };

[Severity: Low]
Does open-coding bcm283x-rpi-led-deprecated.dtsi here defeat the purpose
of 1156e3a78bcc ("ARM: dts: bcm283x: Move ACT LED into separate dtsi")?

What is deprecated in Documentation/devicetree/bindings/leds/common.yaml
is the label =3D "ACT" property (in favor of function and color), which has
to be kept on existing boards to preserve the /sys/class/leds/ACT
userspace interface.  Commit 1156e3a78bcc ("ARM: dts: bcm283x: Move ACT
LED into separate dtsi") moved that legacy node into
bcm283x-rpi-led-deprecated.dtsi so existing boards share one definition
while new boards do not inherit it; inlining the same label =3D "ACT"
definition into a second root / { ... }; block in the middle of the
phandle overrides duplicates the shared fragment without removing the
deprecated property.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261122095225.2009=
16-1-artem122novak@gmail.com?part=3D1
