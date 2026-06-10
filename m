Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1012C031E
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 16:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781108600; cv=none; b=B0xqdNh/o0B3vFVo+7kmk72yOD/bfrV6V/OEthKg+68fVKL4pJhqqFv/ln/5xObbPAp9vX1zG4TFJLaXmJ3ziEypScISHkmmRE7fmHKIU9FFCCy5sRwV2HabeScabIu71FUiTvXgfej0rXUWtHnqyb3TcXINWJ2Yopg63Y/ZOCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781108600; c=relaxed/simple;
	bh=uUdYuS3oDH97JAU1CJfb5sq0zCbG+jVEO81CvoUmz7k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=F0mJG1etbcukla9jeKnhvimnxzlI1vbIzgRcHpBYzauVHDbckUTP6Ojb1K+EBRx4/L7sPXNcCfsYA3SdxLP/6XQ3iGIAmuCMcyxZ8w8UIwM+z8B7p8KohXpB12Mwp5UyXDLtb9R4tQPDNiup+o9c22keE2w8pl2FJxKxxil6KVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TvGTzVcO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TvGTzVcO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E468D1F00893;
	Wed, 10 Jun 2026 16:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781108599;
	bh=uGMuu7Do/B+5M2qPd5TiMSY55OMl/czuPp00NNc0iQ0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TvGTzVcOTK/nQiHXoELvA5C1HleroKA8UyC0TLbYPxeNuy7reJZzcn8VFbKf98Sor
	 CNEd1vKunhCGieMyAaSlOr9w3rC991wbBHjlwbohGVj9Crtf+i6kE5hpRSOoRD3P0s
	 jmedyQOyQRnCRcaKCncQQuEDBNY6EtNFUSEPg+lHl6TSngCZl3V8r1rCYCajDNzXXJ
	 iRdkVTyBhaZH9unhrju5NFCvNS8R53Q1Ua7Eb8l8WFEf8OM99BANd4cXeec911xp/1
	 IEv7ZTM5I3vRFtAYiODtVy4YdDwueeg34TmNNSVqEoeDHMd+XN8+lNTT2lRVDsvHR0
	 LP9uS3vpSzJww==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/3] arm64: dts: nuvoton: npcm845-evb: Add peripheral
 nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tomer Maimon" <tmaimon77@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260610160816.2828713-4-tmaimon77@gmail.com>
References: <20260610160816.2828713-4-tmaimon77@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 16:23:18 +0000
Message-Id: <20260610162318.E468D1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Missing `/bits/ 8` for `fan-tach-ch` and `cooling-levels` causes i=
ncorrect 32-bit integer array emission, corrupting the thermal fan driver s=
tate.
- [High] The `tip_reserved` memory node lacks the `no-map` directive, causi=
ng speculative external aborts.
- [Medium] Incorrect Device Tree property name `spix-mode` prevents the FIU=
 controller from enabling SPIX mode.
--

commit 011b4946d76e73a81f86b002033d53a6d052bd40
Author: Tomer Maimon <tmaimon77@gmail.com>

arm64: dts: nuvoton: npcm845-evb: Add peripheral nodes

Enable peripheral support for the NPCM845 evaluation board by wiring up
the SoC controller nodes to the board design.

> diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts b/arch/a=
rm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
> index 5edf5d13342da..ea92888d9b9e2 100644
> --- a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
> +++ b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts

[ ... ]

> @@ -26,12 +62,389 @@ refclk: refclk-25mhz {
>  		clock-frequency =3D <25000000>;
>  		#clock-cells =3D <0>;
>  	};
> +
> +	reserved-memory {
> +		#address-cells =3D <2>;
> +		#size-cells =3D <2>;
> +		ranges;
> +
> +		tip_reserved: tip@0 {
> +			reg =3D <0x0 0x0 0x0 0x6200000>;

[Severity: High]
Does this reserved memory region need the no-map directive?

Without no-map, the kernel establishes a direct, cacheable linear mapping
over this region. Since this block is isolated by hardware firewalls for the
Trusted Information Processing firmware, could speculative execution or
prefetching by the CPU into this linear mapping trigger fatal synchronous
external aborts or SErrors?

> +		};
> +	};

[ ... ]

> +&fiux {
> +	spix-mode;

[Severity: Medium]
Is this property missing the vendor prefix?

The SPI driver for the NPCM FIU (drivers/spi/spi-npcm-fiu.c) appears to
check specifically for the "nuvoton,spix-mode" property. If it is only named
"spix-mode" here, will the driver fail to detect it and silently fall back
to standard mode?

> +};

[ ... ]

> +&pwm_fan {
> +	status =3D "okay";
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pwm0_pins &pwm1_pins
> +		&pwm2_pins &pwm3_pins
> +		&pwm4_pins &pwm5_pins
> +		&pwm6_pins &pwm7_pins
> +		&fanin0_pins &fanin1_pins
> +		&fanin2_pins &fanin3_pins
> +		&fanin4_pins &fanin5_pins
> +		&fanin6_pins &fanin7_pins>;
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +	fan@0 {
> +		reg =3D <0x00>;
> +		fan-tach-ch =3D <0x0 0x1>;
> +		cooling-levels =3D <127 255>;

[Severity: High]
Should these arrays be explicitly sized using /bits/ 8?

The Device Tree compiler natively emits 32-bit big-endian integers for this
syntax. However, if the driver (npcm750-pwm-fan.c) explicitly reads both
properties using of_property_read_u8_array(), an 8-byte payload like
<127 255> would be read as 8 individual u8 elements:
0, 0, 0, 127, 0, 0, 0, 255.

Does this result in registering intermediate thermal cooling states with a 0
duty cycle, inadvertently turning the fan off during active cooling request=
s?

> +	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610160816.2828=
713-1-tmaimon77@gmail.com?part=3D3
