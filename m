Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D123DDDB8
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 12:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785847876; cv=none; b=WvL+oddIGPktawFGX3+N3OHx6kmy/00b06jcGo2/h+2MH8VMNGiU3lDKR3gzlgTqD2rnrcrSO0cRQqMUcgeNMK9GvSWgqeSyeBZOopWkQeApNzPZ1so4Vadb07eg3iM2nxvZHKr5N3VE073gVM4wA+hpclUgOqvYioCM2qwih/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785847876; c=relaxed/simple;
	bh=EwCnWWyRotjYksmHaKXm7lUbHfVLaPgOmr3IVnKhEkc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=I8posLDCMj3l14dTmIwOD8MnExUIgvUd+2bcYPkmz2x3MWguDOENhB6mcyKAChPnO3WUZhZjPtIzNn+tN7LD9kuZ+215cvd4CUlXNUplDTZHS+QHXeeCrZ2SKC0C/21mLuO7RpmU8h8h0d1v4QIbrlO/6odInoeP5fMrgXxZs0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=koxLPd/E; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="koxLPd/E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BC241F00A3A;
	Tue,  4 Aug 2026 12:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785847871;
	bh=SDE2yw9zo2l8L+3EY4WP2XTmH9AYN/3szziVwv6W3nQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=koxLPd/ESewVNJ+rkPo8UVcW/WEaw6hgR+XuIxGqBMcwSogYFRPlN0ApU7ohMVdT2
	 0jXi2P2WMW6xKGep7SK0SCkdcVJkOvi9cp+NSyIx49yxkC0utdi9V5Bvxt4Mqefmud
	 99K95NSXfZb2btaKp7GW7PIsuYL++JLD2gnbvzikyIZ+n94R3MaprVx8Pasks5Q1xB
	 Xvshq2j59cXZHpXumG3xIpvTEP/3F8hsw40IGWmoNMF9hViyZ7Up9cGCg/4eG34N5D
	 Ige0mpLIImcwTmGVdpF8OW2huD7mOyMiSLBqpzREZ++i0hApAZBPqOvmInfo+vXCgx
	 JmHMZJYGKhCuQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 15/17] ARM: dts: microchip: sama7d65: add cells for
 temperature calibration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Varshini Rajendran" <varshini.rajendran@microchip.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260804113338.261782-16-varshini.rajendran@microchip.com>
References: <20260804113338.261782-1-varshini.rajendran@microchip.com>
 <20260804113338.261782-16-varshini.rajendran@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 12:51:10 +0000
Message-Id: <20260804125111.3BC241F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Low] The 'nvmem-cells' and 'nvmem-cell-names' properties are used in the=
 ADC device tree node, but are not declared in the corresponding DT binding=
s schema.

Pre-existing issues:
- [High] The ADC driver silently swallows -EPROBE_DEFER from nvmem_cell_get=
(), which permanently drops the temperature sensor if the OTP controller pr=
obes later.
--

--- Patch [15]: [PATCH v5 15/17] ARM: dts: microchip: sama7d65: add cells f=
or temperature calibration ---
commit a38951f8e3bfd0ea10718735901a2bfeb4e17375
Author: Varshini Rajendran <varshini.rajendran@microchip.com>

ARM: dts: microchip: sama7d65: add cells for temperature calibration

This commit adds nvmem-cells for temperature calibration data to the ADC
node. The calibration data is read from the OTPC.

> diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dt=
s/microchip/sama7d65.dtsi
> index aac2e22d96cb3..a8b18ad0ef7f7 100644
> --- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
> +++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
> @@ -318,6 +318,8 @@ adc: adc@e1000000 {
>  			dmas =3D <&dma0 AT91_XDMAC_DT_PERID(0)>;
>  			dma-names =3D "rx";
>  			#io-channel-cells =3D <1>;
> +			nvmem-cells =3D <&temperature_calib>;
> +			nvmem-cell-names =3D "temperature_calib";

[Severity: Low]
Will this cause dtbs_check validation to fail? The atmel,sama5d2-adc.yaml
bindings specify additionalProperties: false, but the nvmem-cells and
nvmem-cell-names properties don't appear to be declared in the schema.

[Severity: High]
This is a pre-existing issue, but won't adding these DT properties expose a
probe deferral race condition in the driver?

If the OTP controller hasn't probed yet, nvmem_cell_get() returns
-EPROBE_DEFER, which gets swallowed here in at91_adc_probe():

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

Does this mean the temperature sensor hardware feature could be permanently
lost on boots where the ADC driver is probed before the OTP controller?

>  			atmel,min-sample-rate-hz =3D <200000>;
>  			atmel,max-sample-rate-hz =3D <20000000>;
>  			atmel,trigger-edge-type =3D <IRQ_TYPE_EDGE_RISING>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804113338.2617=
82-1-varshini.rajendran@microchip.com?part=3D15
