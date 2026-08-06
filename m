Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB96431A55
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 09:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786008003; cv=none; b=oFORPEFgwuc17MflCSIy0ccf28+qkvYPT6FK2CdgPtHA9CbB+Vi9C5+e8J1oRsEC/lpqfkrryX6yM26lscXNNko+3/Z1Ed3A212b16jIxAOUeYQ7XngV8M9PHIWn046Sw4BQpQtL50Tk0nNFh+XqpmhYxP6fI09+URbOBObMW34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786008003; c=relaxed/simple;
	bh=ppuno137RP6271vqxYKve6fXX8313nM9xHUJM3ucwmY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ULyp7aIoTCQ2mDm92QW+VvoG4EexG6Pxx9v2PHqHBXCSpnLdLPfXNsdwwepqSYMbaF0eCiIkwIZKZPR2yK7hyfWyZ+BZoEym0ujU7FGGSPfjv7xIkO15beCI6v05X/cohDtvHe4LkpZIqVsvanpqpK4EMg28nNT2PJ3mX0qwKDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VGWAy3/1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VGWAy3/1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C8441F00A3A;
	Thu,  6 Aug 2026 09:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786008001;
	bh=m40DMkacGH57y2XG1uJmVN4Icez9zlS++z0T3oHVVds=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VGWAy3/1yb5lKe9N80l3FozaPpoyv10iWb3HMhhDjKUX+aHHu4f3R7YKdRt0FNtHX
	 5dehKg/JTrF6fjj55ANvKyA+R+MD+Xd4ampV3bFRlhFc1nCKV99c0lBuCd5FD52aZg
	 PoDE5sbkZCMzWRIvzM3kMRIbXkFKJr3+hpcU3A73+Y0zBkyB1htz82Vp5uFf4yh4P0
	 KflfLMvGnzUHPswSxlzh4bj8aDkPAnF55XBwpHKjB4nil9p5QRehSrHw7nKY5BGS+D
	 x9q2fBbR/4dqZ0Tbp5cW3L1n0xuoIYzS+iN/0UA9tyJzHev5bftNkvDQfyPKEQamFT
	 5MZuRWNR4nSjw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 15/17] ARM: dts: microchip: sama7d65: add cells for
 temperature calibration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Varshini Rajendran" <varshini.rajendran@microchip.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260806074024.531259-16-varshini.rajendran@microchip.com>
References: <20260806074024.531259-1-varshini.rajendran@microchip.com>
 <20260806074024.531259-16-varshini.rajendran@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 09:19:59 +0000
Message-Id: <20260806092000.8C8441F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Low] Adding `nvmem-cells` and `nvmem-cell-names` properties to the ADC d=
evice tree node without updating the corresponding binding schema causes va=
lidation failures.

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but the ADC driver c=
ompletely ignores -EPROBE_DEFER from nvmem_cell_get(), leading to missing t=
emperature channels on boot.
--

--- Patch [15]: [PATCH v6 15/17] ARM: dts: microchip: sama7d65: add cells f=
or temperature calibration ---
commit a0118b79f35c5e22daa318dd83acca0c7e480c2e
Author: Varshini Rajendran <varshini.rajendran@microchip.com>

ARM: dts: microchip: sama7d65: add cells for temperature calibration
   =20
Add nvmem-cells for temperature calibration data to the ADC node.
The calibration data is read from the OTPC.

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
Will adding these properties without updating the binding schema cause
dtbs_check to fail?=20

Documentation/devicetree/bindings/iio/adc/atmel,sama5d2-adc.yaml enforces
additionalProperties: false, which might reject the newly added nvmem-cells
and nvmem-cell-names properties.

[Severity: High]
This is a pre-existing issue, but does the ADC driver incorrectly swallow
probe deferrals when trying to fetch this nvmem cell?

If the OTPC provider has not finished probing, nvmem_cell_get() in
drivers/iio/adc/at91-sama5d2_adc.c:at91_adc_temp_sensor_init() will return
-EPROBE_DEFER.

However, the caller at91_adc_probe() appears to ignore the return value:

    ret =3D at91_adc_temp_sensor_init(st, &pdev->dev);
    /* Don't register temperature channel if initialization failed. */
    if (ret)
        num_channels =3D st->soc_info.platform->max_channels - 1;
    else
        num_channels =3D st->soc_info.platform->max_channels;

Could this non-deterministically drop the temperature channel on boot
instead of properly deferring the probe?

>  			atmel,min-sample-rate-hz =3D <200000>;
>  			atmel,max-sample-rate-hz =3D <20000000>;
>  			atmel,trigger-edge-type =3D <IRQ_TYPE_EDGE_RISING>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806074024.5312=
59-1-varshini.rajendran@microchip.com?part=3D15
