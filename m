Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795188079;
	b=ODxhLSEdsiMQAowcjY3ck+ls5mRJowKaoxxOvtaisk0TWFPW9SOs/JXJKvueidOeMv07
	 3NJGVzrgsDj/e4FJspZJ1AGnscKpH6LZpBeANat+wlR++A0NR0BvUUc3GqONzmR2B6xc/
	 /J7d9eMyeQTug3RynUHnIWiq4wsqeg0l0zsntHrz4ViNJDJwgMhzlspQz4L5fs7mRd/oE
	 3k6ErIi3ndGo+HklI4TWx40Sf683NlLaInh3adcbKs72n1Xac7Do5zzzFA5Bm3bJa27dp
	 GFf0QGunTfAl004BY1STLiKvc0RhdOKmQ7bm1MSj03i91WzhZru6Crzh0k+4iI52Fgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795188079;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=EoILwtKAFC7pUy6PTaV9xgOWsk3S7vpRb0ivrvi6Lhw=;
	b=SJoQwhFU5cYgodYdN5CgUTa5E2EHqC9KcFMtgIjtBLdIgVGw65FrM5a9znBMI2INn7IK
	 Q1Mp+0dyaP4dwwicQp4Sa7Ar+fkjHx3FAdr0UPCUlxVNrIoVE5sSA2WJsECzJA//WUd3A
	 92ldjcNGPNwMH3XbnmItTQHlVRDpaWnyBK9/c/OpHDj0Jsm3Osbq4IsL1Ntm7sngJBfQp
	 1a33UjUV6NiYudtih/NQxX2huYyyPtvdH1yylJG5V0UcWMJbV2pzmKxjMm8gYeanATATg
	 BLhjthY1wqCNK1B2Q+PWPxivIqlvrwT/4OT7sKf0s4RKeYNUSSrRREbK88dWRt8WyXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VknaFJDy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D355606A326
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 15:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VknaFJDy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 722B11F000D0;
	Fri, 20 Nov 2026 15:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795188078;
	bh=EoILwtKAFC7pUy6PTaV9xgOWsk3S7vpRb0ivrvi6Lhw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VknaFJDyVOkjpr75T9KS/JqtWgeUMhxQwjq6NfnwI2FG01rvysKayWLCbhRWpBMiz
	 SFG/4/2HC7CHTedoXldI/SkohgZfF5RyCZCBdwbInkc7LOyXHy2qWk0qFm600869zW
	 P24cZNKTO3u5Rc9Vo1cwEdNQDP31fQx6kz3YtDjJ5duMEe2X077BojiCXUuFG7Ld+m
	 +uDn8TbTnWtaY1dNl635APzoYSFT5CZd5k+ykmYM4Wk4ouZto3I1FUX6FO0bF6RrgG
	 gco8Sk5p7ve7YT8jHqXDBchumy8J62bMoSGGhJoVldoLeZUQo863HYFDZ+KoeRfWD8
	 w2bhfqT5IgXFg==
Message-ID: <sashiko-outbox-225456@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 8/8] ARM: dts: rockchip: Add Luckfox Lyra Zero W board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jonas Karlman" <jonas@kwiboo.se>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261119152055.556266-9-jonas@kwiboo.se>
References: <20261119152055.556266-1-jonas@kwiboo.se>
 <20261119152055.556266-9-jonas@kwiboo.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 15:21:18 +0000
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
- [Medium] ARM: dts: rockchip: missing pinctrl properties on enabled
  fspi node
--

commit 48e50ced88fba2da121063679ad813c27667c9d5
Author: Jonas Karlman <jonas@kwiboo.se>

ARM: dts: rockchip: Add Luckfox Lyra Zero W board

This commit adds the device tree for the Rockchip RK3506B-based Luckfox
Lyra Zero W development board.

Link: https://wiki.luckfox.com/Luckfox-Lyra/Luckfox-Lyra-Zero-W

> diff --git a/arch/arm/boot/dts/rockchip/rk3506b-luckfox-lyra-zero-w.dts b=
/arch/arm/boot/dts/rockchip/rk3506b-luckfox-lyra-zero-w.dts
> new file mode 100644
> index 0000000000000..f2fa513e8bff1
> --- /dev/null
> +++ b/arch/arm/boot/dts/rockchip/rk3506b-luckfox-lyra-zero-w.dts
> @@ -0,0 +1,23 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +/dts-v1/;
> +#include "rk3506b-luckfox-lyra.dtsi"
> +
> +/ {
> +	model =3D "Luckfox Lyra Zero W";
> +	compatible =3D "luckfox,lyra-zero-w", "rockchip,rk3506";
> +};
> +
> +&fspi {
> +	status =3D "okay";
> +
> +	flash@0 {
> +		compatible =3D "spi-nand";
> +		reg =3D <0>;
> +		bootph-pre-ram;
> +		bootph-some-ram;
> +		spi-max-frequency =3D <80000000>;
> +		spi-rx-bus-width =3D <4>;
> +		spi-tx-bus-width =3D <1>;
> +	};
> +};

[Severity: Medium]
Should &fspi define pinctrl-names =3D "default" and pinctrl-0 =3D <&fspi_bu=
s4
&fspi_clk &fspi_csn>?

The fspi node in rk3506.dtsi has no default pinctrl properties, and the
fspi_bus4, fspi_clk, and fspi_csn pinmux nodes in rk3506-pinctrl.dtsi are
marked /omit-if-no-ref/.  Without referencing them here, dtc strips those
pinmux nodes from the DTB and the pinctrl subsystem cannot mux the FSPI
pins when the bootloader has not pre-configured all four data lines.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119152055.5562=
66-1-jonas@kwiboo.se?part=3D8
