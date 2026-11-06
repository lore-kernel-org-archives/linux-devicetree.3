Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793934543;
	b=pz8IQfiFPJZbIiftARGEyFxuJd/AFLkUuMpJJNVB5GEp4JLuybC9TlOu7QmHIxqJvutk
	 Yn/1mar5xK797A4DvetAE6jGePEcTTtAng6NxWXtFk7d9LaLO8S8U2BT4X/hQzo/I/bJT
	 zz3BKdRa7HmOuno0RmRqnj1VfV/MtG9NphzqGzbvMhgG+/m9PX/EmN1II08sK45DwBNWf
	 B5TygEwZ0frpptpYOIVbo1BumkKJM05YoJUu9CgI4E38ug8s0Pp1JmWNvjZFrSfbrfTFM
	 vqw0ilFQzxDxnYSt8klyhpJv7KOE7Ju/sc7TGzbqV01+RteBDkVn3/zjnr9n/5dZMjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793934543;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=rfgKGJwUxyCKc2yiifPyE0DVAAaj47Hb0LxyZeS4T4U=;
	b=DRKQSkq8z0BptT3rXbDeszdbGsmc7v3iQF5Xbnikm2XIBCt33FQ6O1u2wtTKhUndi+EL
	 c6LDZZA9RBb1D9lt2fUsD4vqBwXRtqtlBNAzaobE5G4EIXXzspZQ+mgtoOAYJZIHC0NXs
	 z+aK5MJ9hrCnA7vpJfRGc1jkM07IrdTa3RP3wl3G2j3JjQst7W8sC3JAFvKxgboToEiXn
	 kGHuqaGyLyiI11EJURZMISdgFjLhfdv2JgbnMYEts+AYtPUoYF980MwziErDmCqoDjgBI
	 jTHYmnDjA/wx4k+J6YyKw1VAFBBDK3Fv/P3tCxwD48t3BwqGB7Qe4GfRsw7AYd7p0mA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d4yOxTna;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6553E606A335
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 03:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d4yOxTna
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD20D1F008A5;
	Fri,  6 Nov 2026 03:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793934543;
	bh=rfgKGJwUxyCKc2yiifPyE0DVAAaj47Hb0LxyZeS4T4U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=d4yOxTnaf2iWfGei4IrnJJnDndNPcjjTTOXxZVkILYyuZw5c8YahXJNf02Qst1VBt
	 4bk9nZObJ22qkkcdW/nFWQCqRRglDF6vOluqLAgt5vkoVjThXFaQ9s1v4i0EeCvuuy
	 /wsJ0yRto7Nm23imsKZ52tSlznSOyqDw7ukwI7bWwwCUM5mraE+jRZhe2mFQ52RsdR
	 vUKFkGa+ihku+dA3y6+e/5KgZzzX+KsLAuTomdKdd4XJYHbjw3KE2nDekKg4E81HDO
	 NH1INOkbMUQ/MC/G/SB9FVseAS7/yQwOvQt60zAt40i89iRInV+sAJCpUAuReba+RF
	 VeK9VerCYUMKw==
Message-ID: <sashiko-outbox-200623@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] ARM: dts: aspeed: ventura2: Add LTC2305 ADCs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyle Hsieh" <kylehsieh1995@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261106-ventura2-dts-update-v1-1-b085ece9bf57@gmail.com>
References: <20261106-ventura2-dts-update-v1-0-b085ece9bf57@gmail.com>
 <20261106-ventura2-dts-update-v1-1-b085ece9bf57@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 03:09:02 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] ARM: dts: aspeed: ventura2: missing vref-supply violates lltc,ltc24=
97.yaml
--

commit 13d509351ee73dbf947376a477d0e32c8ab7eea1
Author: Kyle Hsieh <kylehsieh1995@gmail.com>

ARM: dts: aspeed: ventura2: Add LTC2305 ADCs

This commit adds three lltc,ltc2305 ADC nodes to the Facebook Ventura2 BMC
device tree (under i2c0mux0ch2 and i2c3) without vref-supply properties and
wires the i2c3 channels into iio-hwmon.

> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts b/=
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
> index f3dbdece30767..50e652cc37a17 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts

[ ... ]

> @@ -392,6 +393,12 @@ i2c0mux0ch2: i2c@2 {
>  			reg =3D <2>;
>  			#address-cells =3D <1>;
>  			#size-cells =3D <0>;
> +
> +			adc@8 {
> +				compatible =3D "lltc,ltc2305";
> +				reg =3D <0x08>;
> +				#io-channel-cells =3D <1>;
> +			};
>  		};
> =20
>  		i2c0mux0ch3: i2c@3 {
> @@ -583,6 +590,18 @@ &i2c3 {
> =20
>  	status =3D "okay";
> =20
> +	adc_op_fb1: adc@8 {
> +		compatible =3D "lltc,ltc2305";
> +		reg =3D <0x08>;
> +		#io-channel-cells =3D <1>;
> +	};
> +
> +	adc_op_fb2: adc@9 {
> +		compatible =3D "lltc,ltc2305";
> +		reg =3D <0x09>;
> +		#io-channel-cells =3D <1>;
> +	};

[Severity: Low]
Although ltc2309_probe() in drivers/iio/adc/ltc2309.c treats vref-supply as
optional and falls back to LTC2309_INTERNAL_REF_MV when it is absent, the
binding schema in Documentation/devicetree/bindings/iio/adc/lltc,ltc2497.ya=
ml
unconditionally requires vref-supply:

required:
  - compatible
  - reg
  - vref-supply

Doesn't omitting vref-supply on adc@8 under i2c0mux0ch2 and on adc_op_fb1 a=
nd
adc_op_fb2 under i2c3 cause make dtbs_check validation errors on
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dtb unless
Documentation/devicetree/bindings/iio/adc/lltc,ltc2497.yaml is updated first
to make vref-supply optional for lltc,ltc2305 and lltc,ltc2309?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-ventura2-d=
ts-update-v1-0-b085ece9bf57@gmail.com?part=3D1
