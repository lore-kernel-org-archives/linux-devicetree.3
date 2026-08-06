Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8F52DC357
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 09:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786007894; cv=none; b=u3M6m8HryMbFj4/d8ddZ6DnqnhR6/atp5jPwocr4Xp7Eg9W+z+A4QNIAu4vNJfVZucqmmiQ7VoB9KPzSAm/I9KtT+k4pMZwBjBFXRB5bUw17PO5mlrjKtois+/dEYdcftagJ+NOkBP3kCZOqqWr9CMGnSfQbOBYQaLeRrZPHv28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786007894; c=relaxed/simple;
	bh=AecnMo+9UoUcqJfpD4qC0o8yWlY5lXXhuelFkSnFZR8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QE8FQdKRDi/PDmttZiA7zUxlOOyffSXy3nZYRW9OF9vdJ8ByZQCMmNmn2mDIfhEnFfpQMI3L12SThPqTwGsXOZFjz0SUFm10XBMsxx265AqvAbyLPqDg/KLTWk4zwTM/xbi8NOIsJ9pL7nr/Nnt/h4gI8zxisqSs163Wn2yBBHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=igC5IomD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="igC5IomD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFADA1F000E9;
	Thu,  6 Aug 2026 09:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786007893;
	bh=zQp4WAW18X3WBAz2zQNEaNzkHbgVE9RpR3HcpCN5rrs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=igC5IomDoa/pn4xJ9bWKgJ1rQywWgp3TorrdGB5I9rxhD/qesk+j+JZWdaAel8UuB
	 FDOEJyCC7xU8HQG1mwR5owGlfuK4ObqNXqAumGhKVZh3kfYFDFZaNTtSeiYNK8oElc
	 LAZb56kn9m4iHYhLQla5S0nzX94RmOtwQO/DAEI/POJc0ts6dIz8Z+3J9+6lnHKdzC
	 CPVqH77TBE7luHR/jnLlXOmlQic709ZWQr7K3WLMz5Ua2EmhqRY1yQt6hkZ/gdh75n
	 r8CEyqCZiBwVnXpQ3Adhh9Kds89hiitmgi4PbUAjCZaWe7boCdDLuaBaEC3bK/XIDw
	 by8/UNnj8I8UQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 16/17] ARM: dts: microchip: sama7d65: add temperature
 sensor
Reply-To: sashiko-reviews@lists.linux.dev
To: "Varshini Rajendran" <varshini.rajendran@microchip.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260806074024.531259-17-varshini.rajendran@microchip.com>
References: <20260806074024.531259-1-varshini.rajendran@microchip.com>
 <20260806074024.531259-17-varshini.rajendran@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 09:18:12 +0000
Message-Id: <20260806091812.DFADA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `thermal_sensor` node is added without a corresponding `ther=
mal-zones` configuration, which will cause the generic ADC thermal driver t=
o unconditionally fail to probe during boot.
--

--- Patch [16]: [PATCH v6 16/17] ARM: dts: microchip: sama7d65: add tempera=
ture sensor ---
commit 41e2fca5a3bc8d28e5d129ae6b0f55b6f1c9d640
Author: Varshini Rajendran <varshini.rajendran@microchip.com>

ARM: dts: microchip: sama7d65: add temperature sensor

This commit adds the generic-adc-thermal temperature sensor node for
the SAMA7D65.

> diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dt=
s/microchip/sama7d65.dtsi
> index a8b18ad0ef7f7..3aba73983c79a 100644
> --- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
> +++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
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
> +

[Severity: Medium]
Will this sensor fail to probe at boot due to a missing thermal zone
configuration?

During initialization, the generic-adc-thermal driver requires the sensor to
be bound to a thermal zone. It calls devm_thermal_of_zone_register() to scan
the device tree for a thermal-zones node that references this sensor.

Because neither sama7d65.dtsi nor its encompassing board files define a
thermal-zones block, devm_thermal_of_zone_register() evaluates to -ENODEV.
This error propagates to the driver's probe function (gadc_thermal_probe),
which emits a failure message and aborts the probe entirely.

Could a corresponding thermal-zones node be added to prevent this regressio=
n?

>  	soc {
>  		compatible =3D "simple-bus";
>  		ranges;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806074024.5312=
59-1-varshini.rajendran@microchip.com?part=3D16
