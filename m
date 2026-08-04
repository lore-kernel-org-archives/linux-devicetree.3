Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2539A4582DE
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 13:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785849061; cv=none; b=sEZpogoUsy1BsAWg4DZ5FCDgPL2L2TOGhIbXj1fW5aQajI558TUb6exQBOBmZ0ONjHM54EKPwrHd9EFOyLL72uljDGGtL+OV+7e3LSl1yYPANzwPfmQlXxaGFKOf7uQ0gYIUwhFOCdzZT5Lq1m2g0whRFwZi5c2hkb+lpyDBjB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785849061; c=relaxed/simple;
	bh=qHZPG2PTiBnbBU03Ym4nwkqL9O8/XlVod37bqzw9zbI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=F0EmWaF0h0T7vZPc4FRLg0tgVo6CwwMqNA0P6tgQtLsWdcEtAitGtEGFDgt5SdnufsHmHhgeJSljLzhW4ali8VSzP17OO+H7SxmGAt6B4rdg/SlZ48kuwpezoJzLNXHivRAAZcD4Jg5Lb7zMoJFEs2Z36KGNdyxuIv8rEdP5teg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IGN95WJl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IGN95WJl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60DF31F000E9;
	Tue,  4 Aug 2026 13:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785849059;
	bh=dxLn7DZkBVmSfqntJqiFBTHfoc/LjvmKXIMKaQFHK50=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IGN95WJlz/Roy/WC0oLmPsoV52dpYgcFCxehzN9CHqvVBuxXhuSnQhAskiJehX299
	 9IUQ2UUPFrRVTIzMqgGTIE7WhsNoGyVAJP0o+XtpfOH92pDWSlSfy9b9xWRJZHmgyi
	 HCn7hwZ4LGXD6ma9iH+OTOA6OunB+C3QT2BN8z2yU4oTmEq4cz1MYm9uwBDWP1oydl
	 kjwm5jzwjGtmYASMzg/EXBWx/66x2K2pWKjbA+JjILdbTv9oVcCeLWQ+0MJ3MsI1MP
	 RIs3T2L4glybrBMzYwXc78l8gWu2Q6GcXgsMshqPUgcph8pDtaBfsujJFUGGUiOvux
	 7ZkAaD2ZRZ5pQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 16/17] ARM: dts: microchip: sama7d65: add temperature
 sensor
Reply-To: sashiko-reviews@lists.linux.dev
To: "Varshini Rajendran" <varshini.rajendran@microchip.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260804113338.261782-17-varshini.rajendran@microchip.com>
References: <20260804113338.261782-1-varshini.rajendran@microchip.com>
 <20260804113338.261782-17-varshini.rajendran@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 13:10:58 +0000
Message-Id: <20260804131059.60DF31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The newly added generic-adc-thermal sensor node lacks a correspond=
ing `thermal-zones` node, causing a guaranteed probe failure on boot.
--

--- Patch [16]: [PATCH v5 16/17] ARM: dts: microchip: sama7d65: add tempera=
ture sensor ---
commit 1087474b952d46f446e7e1f6bb9fb653933e7ada
Author: Varshini Rajendran <varshini.rajendran@microchip.com>

ARM: dts: microchip: sama7d65: add temperature sensor

This commit adds a generic-adc-thermal temperature sensor node to the
SAMA7D65 device tree.

> diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dt=
s/microchip/sama7d65.dtsi
> --- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
> +++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi

[ ... ]

> @@ -119,6 +119,13 @@ pmu {
>  		interrupts =3D <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
>  	};
> =20
> +	thermal_sensor: thermal-sensor {
> +		compatible =3D "generic-adc-thermal";
> +		#thermal-sensor-cells =3D <0>;
> +		io-channels =3D <&adc AT91_SAMA7G5_ADC_TEMP_CHANNEL>;
> +		io-channel-names =3D "sensor-channel";
> +	};

[Severity: High]
Will this generic-adc-thermal node fail to probe during boot because a
corresponding thermal-zones node is missing from the device tree?

When gadc_thermal_probe() runs, it calls devm_thermal_of_zone_register(),
which relies on of_thermal_zone_find() to parse the device tree for a
thermal-zones node.=20

Since this commit adds the sensor but omits the thermal-zones definition,
does this cause the lookup to unconditionally return -ENODEV and abort the
probe with a Thermal zone sensor register failed: -19 error log?

> +
>  	soc {
>  		compatible =3D "simple-bus";
>  		ranges;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804113338.2617=
82-1-varshini.rajendran@microchip.com?part=3D16
