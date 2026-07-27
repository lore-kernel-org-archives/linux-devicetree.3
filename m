Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCFEB403B0A
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 12:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785156358; cv=none; b=M4p3pE44mWFMhy4NnYcObm7ukMZxUlMLWLG9yzNsS6OZkcmgcylMh8NNkRzpxNwb/nDugesH3AYnYpTc37hsTuHEm79ewUNWo+HcFypEnGTwMLETTia0Z2fr1bE33aBC+y9JcmyPnQ3HxnlE9eAloegUP80N/ux6ULVHPqbcNBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785156358; c=relaxed/simple;
	bh=sF/TPcVfnykhjkjJyt0Ks3I3S7YDQNEPd2W4cyaY8b0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Wo8/IetnAt32J8h/ZKX51E0XCRyWQCbt2IaSnIHzUdaL/GEBfzh/660ahqC2pxIaKnaXTUdwXVd6+F8kCbVSDRqNP+66CjUAru/tsLCZBWNvE/2+Uc4YtBFczJ6B2oCQhJAcQ6WPzWcI0HCOxXYUPOil1B+satzpFZOPpYEhWLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=idAnE+/K; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="idAnE+/K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DACD01F000E9;
	Mon, 27 Jul 2026 12:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785156357;
	bh=6LV7kj2bzRlQxNeZjvvIqYN2op0L+ygSH0VzfK2ezLk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=idAnE+/KDtnvkpMt+6/BAfzJbZ5GR1r6uZS8cIytBDoeK7FyOstQCkEDoNo46yWz7
	 uBSnkfj8cHm8GimUo+PBqfTB6TKQ+LKJafcmKW8GnuvHbD+viocMKJUFWNJlt/XHpe
	 NIbsBTkxIcIMY09vxFZSRw+G2qtqx35GDd0n0MENJFHBEQ/L2zYQxkTmQSkg1JSNGk
	 QmgETsUW7FEt8u2HGP41VPpSYmZ+B/8AyD2tKnEvhIkllY5V7s0JgB3xnI5flpD1nh
	 5Gya7XVfDsqAu7/REu4PEXUzjMFnehaZqAqGYyZdGgndo41r9ZeQVyrP4CWVtgIjIG
	 RDVQcXMI1uL8Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 15/16] ARM: dts: microchip: sama7d65: add temperature
 sensor
Reply-To: sashiko-reviews@lists.linux.dev
To: "Varshini Rajendran" <varshini.rajendran@microchip.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260727122633.117435-16-varshini.rajendran@microchip.com>
References: <20260727122633.117435-1-varshini.rajendran@microchip.com>
 <20260727122633.117435-16-varshini.rajendran@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 12:45:56 +0000
Message-Id: <20260727124556.DACD01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `generic-adc-thermal` node fails to probe due to a missing `=
thermal-zones` definition in the device tree.
--

--- Patch [15]: [PATCH v4 15/16] ARM: dts: microchip: sama7d65: add tempera=
ture sensor ---
commit c26d5d2aede7ab2e9e82e21d748fdf77a5266008
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

[Severity: Medium]
Will this generic-adc-thermal node fail to probe due to a missing
thermal-zones definition?

Looking at the generic-adc-thermal driver's gadc_thermal_probe(), it requir=
es
the sensor to be linked within a thermal-zones block. It calls
devm_thermal_of_zone_register(), which returns -ENODEV when the thermal-zon=
es
node is absent.

Since the thermal-zones node appears to be missing in sama7d65.dtsi, the
driver will treat this -ENODEV as a fatal error, log "Thermal zone sensor
register failed: -19", and abort probing. Should a thermal-zones definition
be added alongside this sensor?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727122633.1174=
35-1-varshini.rajendran@microchip.com?part=3D15
