Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7D12417DE
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 10:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782986842; cv=none; b=HtvZhRKv82O5/zeuFaAknxZilhLuyPhL7goEzhBPVeHlBeeaX8UwLPNkUwnrGGpLe/UimO0a1KVGRihQvWjRxHVVLbHwrtCCnuQvrimHUvCM6YGU+k7eWZIgICyKngt+Be5ggO2x0tE4RfMt8fl5dswQpTKzRafGQ3I9o6bb7ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782986842; c=relaxed/simple;
	bh=evH5nPin663GxwmmqfCDNjKsgHPUYjKn2WnqOAGsJoI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Oz7cE9Ps4/OHmePNo3QNB8121VuqdwVYXZCQG3bYeZvB8kFdr8+ub398G5pNoandHaeiKqVTsg1X69bbmP6RGk7OiPz8ti0L9NnvyLgKOn2hQUxIA+Qav6fhogzsuiqqiPjlrlFBMjF7f+YlngkOYyyYW+mZ5zWyg8AofRBfg2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W26fxa34; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W26fxa34"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA1321F00A3A;
	Thu,  2 Jul 2026 10:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782986841;
	bh=NBXJ5QgCRyv5y/oQW6Cz3zc4m0K+WlEl0GIZLh7yhDw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=W26fxa346B1GMwPqYPAOOqDX28NLLJRaVVPk1ndr7xbujbB99V09+fa9hj8fV+nt9
	 87IQ6ZD/dgTYxIxDgnBHeH8WHg0PTSSpnA8ZrapSFz5ms8JiVIdR6//TENR8RQAaIt
	 wRANoGm4az9JzGMhgxC7cbQw4N/n1TV7U1F4+kAF8XbbJZ5dBKXWWoa2akAT3WOa3v
	 5bhP5lBmFAb6UBAAhSj2kdlVCSjuKRTf353P2Ty/3wS0GPFt1UFFaPp3cM9VsDO38F
	 aPwm3L4K9j+vsIMCSc6uRio431tQdErRbn0rkoQA4G+tE98940skthXH8oMa28uGjD
	 GckLJxocS75Yg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/7] thermal/drivers: airoha: fix copy paste error
 for sen internal
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260702094846.17325-3-ansuelsmth@gmail.com>
References: <20260702094846.17325-1-ansuelsmth@gmail.com>
 <20260702094846.17325-3-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 10:07:20 +0000
Message-Id: <20260702100720.EA1321F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The thermal interrupt handler ignores events if multiple interrupt=
 status bits are set simultaneously, causing lost thermal events.
- [High] The thermal interrupt is requested before the thermal zone device =
is initialized, risking a NULL pointer dereference.
- [High] Ignored return values from `regmap_read()` lead to the use of unin=
itialized stack variables, causing garbage temperature readings or hardware=
 corruption.
- [High] Ignored return value from `of_address_to_resource()` leads to conf=
iguring the hardware with a bogus uninitialized physical address.
- [High] The `set_trips` callback fails to disable hardware interrupts or u=
pdate registers when a trip point is removed.
- [High] The driver checks the entire 32-bit EFUSE register instead of the =
masked calibration field, potentially misinterpreting unrelated bits as cal=
ibration data.
--

commit d5d738260788425c2c1e27418bf98a956c539129
Author: Christian Marangi <ansuelsmth@gmail.com>

thermal/drivers: airoha: fix copy paste error for sen internal

In airoha_thermal_setup_monitor there is a copy paste error on configuring
the internval for temp monitor. Fix the error and use the correct mask for
the sen interval for the EN7581_TEMPMONCTL2 register.

> diff --git a/drivers/thermal/airoha_thermal.c b/drivers/thermal/airoha_th=
ermal.c
> index 439aa011b75c7..829a7327fc403 100644
> --- a/drivers/thermal/airoha_thermal.c
> +++ b/drivers/thermal/airoha_thermal.c
> @@ -403,7 +403,7 @@ static void airoha_thermal_setup_monitor(struct airoh=
a_thermal_priv *priv)
>  	 * sen interval is 379 * 52.715us =3D 19.97ms
>  	 */
>  	writel(FIELD_PREP(EN7581_FILT_INTERVAL, 1) |
> -	       FIELD_PREP(EN7581_FILT_INTERVAL, 379),
> +	       FIELD_PREP(EN7581_SEN_INTERVAL, 379),
>  	       priv->base + EN7581_TEMPMONCTL2);
> =20
>  	/* AHB poll is set to 146 * 68.64 =3D 10.02us */

[Severity: High]
This isn't a bug introduced by this patch, but could this switch statement
miss events if multiple interrupt status bits are set simultaneously?

drivers/thermal/airoha_thermal.c:en7581_thermal_irq() {
        switch (status & (EN7581_HOFSINTSTS0 | EN7581_LOFSINTSTS0)) {
        case EN7581_HOFSINTSTS0:
                event =3D THERMAL_TRIP_VIOLATED;
                update =3D true;
                break;
        case EN7581_LOFSINTSTS0:
                event =3D THERMAL_EVENT_UNSPECIFIED;
                update =3D true;
                break;
        default:
                /* Should be impossible as we enable only these Interrupt */
                break;
        }
}

If the hardware asserts both EN7581_HOFSINTSTS0 and EN7581_LOFSINTSTS0
concurrently, the bitwise AND evaluates to both bits being set, which match=
es
neither case. Execution would fall through to default, discarding the event=
s.

[Severity: High]
This is a pre-existing issue, but does this driver request the interrupt
before the thermal zone device is initialized?

drivers/thermal/airoha_thermal.c:en7581_thermal_probe() {
        ...
        ret =3D devm_request_threaded_irq(&pdev->dev, irq, NULL,
                                        en7581_thermal_irq, IRQF_ONESHOT,
                                        pdev->name, priv);
        ...
}

If the bootloader leaves the thermal interrupt enabled and asserted, the
handler could execute immediately:

drivers/thermal/airoha_thermal.c:en7581_thermal_irq() {
        ...
        if (update)
                thermal_zone_device_update(priv->tz, event);
        ...
}

Because the tz pointer is populated later in the probe sequence:

drivers/thermal/airoha_thermal.c:airoha_thermal_probe() {
        ...
        priv->tz =3D devm_thermal_of_zone_register(dev, 0, priv,
                                                 soc_data->thdev_ops);
        ...
}

Could this result in a NULL pointer dereference if the interrupt fires earl=
y?

[Severity: High]
This isn't a bug introduced by this patch, but are the return values of
these regmap reads intentionally ignored?

drivers/thermal/airoha_thermal.c:airoha_get_thermal_ADC() {
        ...
        regmap_field_read(priv->chip_scu_fields[AIROHA_THERMAL_DOUT_TADC],
                          &val);
        return val;
}

And also here:

drivers/thermal/airoha_thermal.c:airoha_set_thermal_mux() {
        ...
        regmap_read(priv->chip_scu, EN7581_PLLRG_PROTECT, &pllrg);
        ...
}

If the underlying regmap read fails, the uninitialized stack variables
val and pllrg could be used directly, potentially returning invalid
temperatures or writing garbage back to the hardware.

[Severity: High]
This is a pre-existing issue, but what happens if the device tree node lacks
a valid reg property?

drivers/thermal/airoha_thermal.c:en7581_thermal_probe() {
        ...
        of_address_to_resource(chip_scu_np, 0, &priv->scu_adc_res);
        ...
}

The return value is ignored here. If the parse fails, priv->scu_adc_res.sta=
rt
remains 0. The driver then configures the AHB bus master to poll from this
address:

drivers/thermal/airoha_thermal.c:en7581_thermal_setup_monitor() {
        ...
        regmap_write(priv->map, EN7581_TEMPADCVALIDADDR,
                     priv->scu_adc_res.start + EN7581_DOUT_TADC);
        ...
}

Could this asynchronous read from an uninitialized address cause a bus faul=
t?

[Severity: High]
This isn't a bug introduced by this patch, but does the driver handle the
removal of all trip points correctly?

drivers/thermal/airoha_thermal.c:en7581_thermal_set_trips() {
        ...
        /* Enable sensor 0 monitor after trip are set */
        if (enable_monitor)
                regmap_write(priv->map, EN7581_TEMPMONCTL0, EN7581_SENSE0_E=
N);
       =20
        return 0;
}

If the thermal core removes a trip point and enable_monitor becomes false,
there is no else branch to disable the monitor in hardware. Would the monit=
or
continue firing interrupts for the stale thresholds?

[Severity: High]
This is a pre-existing issue, but does this correctly check if the
calibration field is programmed?

drivers/thermal/airoha_thermal.c:en7581_thermal_setup_adc_val() {
        ...
        regmap_read(priv->map, EN7581_EFUSE_TEMP_OFFSET_REG, &efuse_calib_i=
nfo);
        if (efuse_calib_info) {
                priv->default_offset =3D FIELD_GET(EN7581_EFUSE_TEMP_OFFSET=
, efuse_calib_info);
        ...
}

If the lower bits of the register contain non-zero data (outside the
EN7581_EFUSE_TEMP_OFFSET mask), but the calibration field itself is
unprogrammed (0), the condition still evaluates to true.=20

Would this trap the driver in the calibrated path with a 0 offset, preventi=
ng
the use of the non-calibrated fallback parameters?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260702094846.1732=
5-1-ansuelsmth@gmail.com?part=3D2
