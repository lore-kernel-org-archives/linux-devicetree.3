Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795605385;
	b=KTL4nH+BFoMcQShsalJ/f89ZetIvsy1KrJNLqeoC8mcgIwM58dnf8GAvaHtiWMn3749z
	 td8UP3K9p5Q+pJ6dPAwXCNrSdoOKZTRUIuSWv/c3bX2wJmK44vHo20ENvtbzBPoOjkx/8
	 4cu56DjlEsN1ZUK3IJqx6eHJMkovI+RGTmwHy0g8mUrU2XNjYUsVTeKf85LIUH/sSZ7Iz
	 ALKa99k76W/8CgYSiNrzu4gCrrmeTN2GENnVI2y5K8RGnBWgH7ApFFI93X45K4l/kEnQ+
	 Q1CP2eSdog7o3njQgJFTLTbsBeIlP5kAGsNmIge9UB7V6PREhlO5IppbevKF889y3iA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605385;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=CgCi0fMrW4K4pgKr3d/z1J25anJJQwm9IuzWpgdaCbM=;
	b=v6zMmbbyNUd88O4kDBf4Lrma9flro0Swh9E+Y0de1EU/SDLxHOFhdLaFiFiWa6bN+0ER
	 ++H3b6tw1DyPt47Sof/NLa4n7OaKjFx7g/jNynzbhEydX62MxUgwPQF9IGIr03cdoa0pV
	 ozrbpcAU+gcdQkuyL4Xdk7rIh8OVWa5rk4a5EjPTo64zpC6COyyVyFHXhA+uoEPLRFxaX
	 bVsN69Bf3DcER8xpFNJdX8X0nK9iZckAZDdIcbvmS1q+NFM48//qRWdCRLOByGZw7gqsy
	 kfLu9ZXvnsCy4+DINjkwv82SqpxfMxGakPqlHbFf4AI19HVA8k38sSn2UVqYJCKwDZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="e+cdk/5X";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB86606A31E
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 11:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e+cdk/5X
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBF3D1F000EE;
	Wed, 25 Nov 2026 11:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795605385;
	bh=CgCi0fMrW4K4pgKr3d/z1J25anJJQwm9IuzWpgdaCbM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=e+cdk/5Xvw6pBrNo9ezNvWeJWXeMxKBR7nv230j04K8iApu7JVjMq3622xAaV7ktg
	 FeE4eaH2NO15Ziw69Cd4bL4ieRFyk5GBr+Pn0j9gkt98k1FI+QBlxY0LedQ07cgTkD
	 JLDkSB/zP1DNleHBhONmkpabYN+fz2DrncmUkXn/C+cMsTJuuXuBvbAWbxffkYHkOa
	 mYRP/HRE2esR6jbqbZ9uJ59O2uzr37RTpDtOf7qczQRHHWonoQW3485/gdEeGXw4B5
	 Uuc9XbMxMsrsnoAWSpaTr5NQr1N0rhzZSri1Xm9hKx0rn5ZIkn5jfFXFrmpTMaqSoN
	 arHdIKm0WYDfg==
Message-ID: <sashiko-outbox-233211@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 1/4] arm64: dts: renesas: r9a08g046: Enable TSU
Reply-To: sashiko-reviews@lists.linux.dev
To: "Biju Das" <biju.das.au@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20261125-usb_rzg3l-v9-1-ea14d3ab8a53@bp.renesas.com>
References: <20261125-usb_rzg3l-v9-0-ea14d3ab8a53@bp.renesas.com>
 <20261125-usb_rzg3l-v9-1-ea14d3ab8a53@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 11:16:24 +0000
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
- [Medium] arm64: dts: renesas: r9a08g046: tsu uses ADC index 0 instead
  of channel 8
- [Low] arm64: dts: renesas: r9a08g046: adc1 and tsu nodes out of
  unit-address order
--

commit 4b03a04880b343754630b467c7e0397104914b06
Author: Biju Das <biju.das.jz@bp.renesas.com>

arm64: dts: renesas: r9a08g046: Enable TSU

This commit adds #cooling-cells to the CPU nodes and describes the ADC1,
TSU, and cpu-thermal zone nodes for the RZ/G3L (r9a08g046) SoC.

> diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot=
/dts/renesas/r9a08g046.dtsi
> index bb69e5e3528d0..1d4d95f645746 100644
> --- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi

[ ... ]

> @@ -381,6 +385,37 @@ scif5: serial@1004e000 {
>  			status =3D "disabled";
>  		};
> =20
> +		adc1: adc@108c0000 {
> +			compatible =3D "renesas,r9a08g046-adc1";
> +			reg =3D <0 0x108c0000 0 0x10000>;
> +			interrupts =3D <GIC_SPI 378 IRQ_TYPE_EDGE_RISING>;
> +			clocks =3D <&cpg CPG_MOD R9A08G046_ADC1_ADCLK>,
> +				 <&cpg CPG_MOD R9A08G046_ADC1_PCLK>;
> +			clock-names =3D "adclk", "pclk";
> +			resets =3D <&cpg R9A08G046_ADC1_PRESETN>,
> +				 <&cpg R9A08G046_ADC1_ADRST_N>;
> +			reset-names =3D "presetn", "adrst-n";
> +			power-domains =3D <&cpg>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			#io-channel-cells =3D <1>;
> +
> +			channel@8 {
> +				reg =3D <8>;
> +			};
> +		};
> +
> +		tsu: thermal@108d0000 {
> +			compatible =3D "renesas,r9a08g046-tsu";
> +			reg =3D <0 0x108d0000 0 0x10000>;

[Severity: Low]
This isn't a bug, but adc@108c0000 and thermal@108d0000 are placed between
the scif group (ending at serial@1004e000) and i2c@100ae000.  To keep the
soc bus nodes sorted by ascending unit address, should these go after
gpu@108b0000 and before clock-controller@11010000?

> +			clocks =3D <&cpg CPG_MOD R9A08G046_TSU_PCLK>;
> +			resets =3D <&cpg R9A08G046_TSU_PRESETN>;
> +			power-domains =3D <&cpg>;
> +			#thermal-sensor-cells =3D <0>;
> +			io-channels =3D <&adc1 0>;
> +			io-channel-names =3D "tsu";
> +		};

[Severity: Medium]
Should io-channels specify hardware channel 8 (<&adc1 8>) rather than 0?

adc1 only defines channel@8 (matching renesas,rzg2l-adc.yaml and the
channel 8 reference in renesas,r9a08g045-tsu.yaml).  Using 0 here works
around the missing .fwnode_xlate callback in rzg2l_adc_iio_info, where
__fwnode_iio_simple_xlate() indexes indio_dev->channels[] by array position
instead of matching chan->channel.  Encoding the Linux driver's internal
array index in the DT ABI will break thermal probing if rzg2l_adc adds
.fwnode_xlate for sparse channel numbers.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125-usb_rzg3l-=
v9-0-ea14d3ab8a53@bp.renesas.com?part=3D1
