Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793806336;
	b=CcfVDUOdSvgpbOfpQm/w3nQqn+L1XiE7o4KoHRnKyxRh6xPZnKe8c1A6zcmdbuCqlcC3
	 UqybyeqKTwsxgRjf2KOPcC/vVy35/A6Nk6JeaRJ+N//oXJb6DmzdCTFsUE/LvuOW+v7ai
	 U7pT2RyhemrN/92F0Ag1h6Y2hL6QyxOOGVat9XYWaLw3Mo/+bSiah/saT0MQjZHxD4yAQ
	 ydgsmQX3zqxa5iYQhMs8/1oGVcn3SEIL82jLZzj0KRYUj/zrqEWiKOw65fNmZve+M31dD
	 qegQ/csKDpGKEmJOnYKctMeGS5eXQEd/dWE+d9wktlO4GfEkPfUKvQqwThrMkOI/RlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793806336;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ettRP5w+BU4VkZ3Ft6Tmtl0sJscQgrDdiGbDBEHLbQQ=;
	b=E5OCdhm6svztEy7JA0KFGWWuuFbRkt791nWlgQMLuScm6t+SzY9+Zxolu9gF/jubPZhF
	 QGIt0MLQXY5f8zjEviMsLjGdY/uV5vExsCsZ5k3EG8gyP9tsKVVCqKnk2FHvxuESKpCFC
	 KMc5WxgYGt2GOKbuEvF7qMlt9kCu1XCSTHg5YgHFkeREUyda6GvS/x8Fozyy+IAMPwHsq
	 FvX0wEcBbB3Zz+VovAAX8HkLlTa1y34si2DB9y+de2hOBwkA4Y3NvNqleihuzaDztDjl8
	 XmXoWFTBKLYkwpmsAfDycERbcS2to1b6GDJt9NUyVUCiu1LDAmfc5sJ3Q74pGwzAnWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GHA08Bf9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EAF3606A328
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 15:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GHA08Bf9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D59091F00919;
	Wed,  4 Nov 2026 15:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793806336;
	bh=ettRP5w+BU4VkZ3Ft6Tmtl0sJscQgrDdiGbDBEHLbQQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GHA08Bf9D5NfhGS3mpl1NwU1Zi1N/TGzr5T8ZlW8VLGOIpr6b+TpCCa94fB+SCs+i
	 MtHFtzB+ARDpPZBYMjnINjrlhzGD8IbzoKnc1jjDgMOcTclKih8MGxBn3Iw+SOShWn
	 O27qjGc96Ujp898mQlFUmN/V+m2Yhe6iXCNGBNGBem8My2YrbIY1B3fvxeZuE59QRS
	 /CHoEgah/uFea6UndGayybfkD2hpBl3+Jv51YGmOhO5WsHCLRFM+BCDlqwDC4LZABx
	 mmyZiG5g6kPsw51C7Da/Ug9tfDB7W5B8PXFMG0kUyNXNhGBx2+VR5/+2fAqeobupGO
	 yliHmpeR+xQxw==
Message-ID: <sashiko-outbox-197508@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 1/4] arm64: dts: renesas: r9a08g046: Enable TSU
Reply-To: sashiko-reviews@lists.linux.dev
To: "Biju Das" <biju.das.au@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20261104-usb_rzg3l-v8-1-ab109c4bd108@bp.renesas.com>
References: <20261104-usb_rzg3l-v8-0-ab109c4bd108@bp.renesas.com>
 <20261104-usb_rzg3l-v8-1-ab109c4bd108@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 15:32:15 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] arm64: dts: renesas: r9a08g046: tsu uses ADC index 0 instead of =
channel 8
- [Low] arm64: dts: renesas: r9a08g046: adc1 and tsu nodes out of unit-addr=
ess order
--

commit 3f81876bc97a3da87790da10f43f37d051bfeeea
Author: Biju Das <biju.das.jz@bp.renesas.com>

arm64: dts: renesas: r9a08g046: Enable TSU

This commit adds #cooling-cells to the CPU nodes and describes the ADC1 and
TSU nodes along with a CPU thermal zone and cooling maps on r9a08g046.

> diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot=
/dts/renesas/r9a08g046.dtsi
> index f33d5d7468ffa..35046c7dac547 100644
> --- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi

[ ... ]

> @@ -374,6 +378,37 @@ scif5: serial@1004e000 {
>  			status =3D "disabled";
>  		};
> =20
> +		adc1: adc@108c0000 {
> +			compatible =3D "renesas,r9a08g046-adc1";
> +			reg =3D <0 0x108c0000 0 0x10000>;

[Severity: Low]
Should adc1 (adc@108c0000) and tsu (thermal@108d0000) be placed after gpu
(gpu@108b0000) and before cpg (clock-controller@11010000) rather than betwe=
en
scif5 (the end of the scif0@100ac000 group) and i2c0 (i2c@100ae000) so the
soc child nodes stay in ascending unit-address order?

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
> +			clocks =3D <&cpg CPG_MOD R9A08G046_TSU_PCLK>;
> +			resets =3D <&cpg R9A08G046_TSU_PRESETN>;
> +			power-domains =3D <&cpg>;
> +			#thermal-sensor-cells =3D <0>;
> +			io-channels =3D <&adc1 0>;
> +			io-channel-names =3D "tsu";
> +		};

[Severity: Medium]
Should io-channels in the tsu node reference hardware channel 8 (<&adc1 8>)
matching channel@8 under adc1, with rzg2l_adc_iio_info in
drivers/iio/adc/rzg2l_adc.c implementing .fwnode_xlate?

In arch/arm64/boot/dts/renesas/r9a08g046.dtsi, adc1 defines only channel@8
with reg =3D <8>, matching Documentation/devicetree/bindings/iio/adc/renesa=
s,rzg2l-adc.yaml
and rzg3l_adc1_hw_params in drivers/iio/adc/rzg2l_adc.c. Similarly,
Documentation/devicetree/bindings/thermal/renesas,r9a08g045-tsu.yaml and
arch/arm64/boot/dts/renesas/r9a08g045.dtsi specify io-channels =3D <&adc 8>.

When rzg3s_thermal_probe() in drivers/thermal/renesas/rzg3s_thermal.c calls
devm_iio_channel_get(dev, "tsu"), __fwnode_iio_channel_get() in
drivers/iio/inkern.c checks for info->fwnode_xlate:

drivers/iio/adc/rzg2l_adc.c:
static const struct iio_info rzg2l_adc_iio_info =3D {
	.read_raw =3D rzg2l_adc_read_raw,
	.read_label =3D rzg2l_adc_read_label,
};

Because rzg2l_adc_iio_info omits .fwnode_xlate, __fwnode_iio_channel_get()
falls back to __fwnode_iio_simple_xlate(), which treats the io-channels cell
as an array index into indio_dev->channels[] (where num_channels is 1 and
chan_array[0].channel is 8) rather than matching chan->channel.

Does setting io-channels =3D <&adc1 0> bake the Linux IIO driver's internal
array index into the Device Tree ABI instead of the hardware channel number?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-usb_rzg3l-=
v8-0-ab109c4bd108@bp.renesas.com?part=3D1
