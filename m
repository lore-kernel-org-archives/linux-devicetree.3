Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC543DDAF2
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 09:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786007563; cv=none; b=ni/6sBrVrjWGdsdm83OKujdfkOLCYbvO19K6776uF5AobO3Ul2sIwWOBwozCh4ItvYE+L9Uuyne84a9Y94V6XYRx2gHcomEHT+/dqssT+MkyWrhfvXDO3n6q+OaRZzJlTcaA0B3IfTIRH8yCPyRwGiczieHlpacce+55cVixCwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786007563; c=relaxed/simple;
	bh=ylrwZyRv/+qkdxUkvHdkBmR5QowzVep6had/wfGLisQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=J7wiCyMTzhMNBkIlAS18DR0jTVNX5S4NRIvNIJTJJkKQz4+7V48OiqwVTgLDJ41QLikGmdf8PyVoBUTwqp+84XtI6JQXTN9esfxOG4zus+cQyLFVaXD/TqvqcLhHR6gO0ixNBns4B5UH832ESTBROvGFSUbyHGcKwzKkZ+V5ysI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HNT76xJN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HNT76xJN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84A191F000E9;
	Thu,  6 Aug 2026 09:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786007561;
	bh=VIvb1Xbuw7eu7FppomHpDpfKZF2XpS8geAEz9j31PjI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HNT76xJNVNPmJUWmgDSi89/0IU7vQH2sucaJ+9OFQMwIrWVz8mxRfmSLcUcuJXXUg
	 HV9KEeIaTkeL1QdROyTvhTp2HmSrQcjHKUX2843VciTHnJVbG3uhQqkKzgS9TMZRCm
	 vCIl0cQQcIERhHhcw3kxiRIBKTxeUFuLvityB6JF7rXbxEFBkTtoZXxridJp3E4aRj
	 IlzR2slMA2Xv55wSEM2GV+ILUOZ41251Y/ngR/LtEK6tJjHQTlH5R2cxjSuOPVyJ6L
	 +B//c7dVwsz5t99eEfFpTtUXeeZ8ZKoXBMpxLC7StKY6rkCQVKR6LGw74dNQuowino
	 uVGFI3trdqRxw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 12/17] ARM: dts: microchip: sama7d65: Add ADC node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Varshini Rajendran" <varshini.rajendran@microchip.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260806074024.531259-13-varshini.rajendran@microchip.com>
References: <20260806074024.531259-1-varshini.rajendran@microchip.com>
 <20260806074024.531259-13-varshini.rajendran@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 09:12:41 +0000
Message-Id: <20260806091241.84A191F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The `at91-sama5d2_adc` driver silently drops the temperature chann=
el if the NVMEM driver defers probe (`-EPROBE_DEFER`).
--

--- Patch [12]: [PATCH v6 12/17] ARM: dts: microchip: sama7d65: Add ADC nod=
e ---
commit a490ddf1ce530155ef041c9e439ca0706a1887e8
Author: Varshini Rajendran <varshini.rajendran@microchip.com>

    ARM: dts: microchip: sama7d65: Add ADC node
   =20
    Add node for the ADC controller in sama7d65 SoC. Add the vddout25 fixed
    regulator node which provides the 2.5V reference voltage for the ADC.

> diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dt=
s/microchip/sama7d65.dtsi
> index dfac17e34e651..c35f27615bc49 100644
> --- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
> +++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi

[ ... ]

> @@ -296,6 +306,24 @@ can4: can@e0838000 {
>  			status =3D "disabled";
>  		};
> =20
> +		adc: adc@e1000000 {
> +			compatible =3D "microchip,sama7d65-adc";

[Severity: High]
This is a pre-existing issue, but does enabling this device expose a problem
with the temperature channel probe deferral?

Looking at the driver in drivers/iio/adc/at91-sama5d2_adc.c, when
at91_adc_probe() calls at91_adc_temp_sensor_init(), it drops the channel
on any error instead of propagating -EPROBE_DEFER:

drivers/iio/adc/at91-sama5d2_adc.c:at91_adc_probe() {
	...
	ret =3D at91_adc_temp_sensor_init(st, &pdev->dev);
	/* Don't register temperature channel if initialization failed. */
	if (ret)
		num_channels =3D st->soc_info.platform->max_channels - 1;
	else
		num_channels =3D st->soc_info.platform->max_channels;
	...
}

If the NVMEM driver hasn't initialized yet, at91_adc_temp_sensor_init()
will return -EPROBE_DEFER.

Because at91_adc_probe() doesn't propagate this, the temperature channel
becomes randomly unavailable on boot, depending on the module load timing
between the ADC and NVMEM drivers.

Should the driver be updated to explicitly check for and propagate
-EPROBE_DEFER?

> +			reg =3D <0xe1000000 0x200>;
> +			interrupts =3D <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&pmc PMC_TYPE_GCK 25>;
> +			clock-names =3D "adc_clk";
> +			assigned-clocks =3D <&pmc PMC_TYPE_GCK 25>;
> +			assigned-clock-rates =3D <100000000>;
> +			dmas =3D <&dma0 AT91_XDMAC_DT_PERID(0)>;
> +			dma-names =3D "rx";
> +			#io-channel-cells =3D <1>;
> +			atmel,min-sample-rate-hz =3D <200000>;
> +			atmel,max-sample-rate-hz =3D <20000000>;
> +			atmel,trigger-edge-type =3D <IRQ_TYPE_EDGE_RISING>;
> +			atmel,startup-time-ms =3D <4>;
> +			status =3D "disabled";
> +		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806074024.5312=
59-1-varshini.rajendran@microchip.com?part=3D12
