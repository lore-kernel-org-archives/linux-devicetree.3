Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82316368D49
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 11:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780314036; cv=none; b=BLFXZ6PY57RSVfPofkAHTTkTyGNWoh3GjzirYrWd3izLkTnOzYjGNFI88ileIQwZxRNfPOum5dH5diPROTBdoBKzRec+5c9cjN0B5m0h0MV80nfbZCjcW2JLsdWIByA3KAFqCib6rmhs4P2kAHJmGOhw9TFn57fEVysVZR/EnXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780314036; c=relaxed/simple;
	bh=BbIgTxXMaX0LxqoS4Iyz7yONe38uBoqUjhk2fw7EFyY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XTXDYmjDrS8HHMECQP2ezSHAlr50iGGs+I0AbcknHoWh6aCXBxf/cxgZZgn58y9aFYe+35f09IFCrF7d3SGKZQ+wvj/3HzeRVfj6iWw1Bzzqem/kiqkdNoENeAonUUN7eDwVeVxlyuSUpKb02c+1AYJ/SVWCWSvh10c9oy7IM5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i/z9OE/A; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i/z9OE/A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D9A81F00893;
	Mon,  1 Jun 2026 11:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780314035;
	bh=B/HOJ8r1oy94iCHR9uER7/ehCiLiUAk3pUMGZtGObOE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=i/z9OE/AtR3jPrf0Fn4QvRYOLc+cgfREWoWKT41MGCmOcmdlepnHddKwp2tLmj+J6
	 3feQflEc8L4TkYGXDC3cy/n7TKSpv9c4MS2rgPIkleZjh/BU39/JhjU2Ovr2syer0H
	 nixlmk/ZtwYnsz0/Xl5ifINp+FVbdCsU2dYsfGkS8jQniSbCZjgxPlwLjlNl2DNO9P
	 5Z7TzeyfxNF4GMvJgcHjXm0vt7K07fGsUH5/SPQ09cy0v4nygR8YkCL/9A5me3dVFC
	 TIv5Dz60hc0wMoNqhU2TcqTUk9cP+bcNyRgUrTHcn66Vcza8UpK3+gTn9HJmqyo7Co
	 iPVMTNW2HF7Mw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] thermal: qcom: Add support for Qualcomm MBG thermal
 monitoring
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sachin Gupta" <sachin.gupta@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260601-spmi-mbg-driver-v1-2-b4892b55a17f@oss.qualcomm.com>
References: <20260601-spmi-mbg-driver-v1-2-b4892b55a17f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 01 Jun 2026 11:40:34 +0000
Message-Id: <20260601114035.2D9A81F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Data race and TOCTOU window on `last_thres_crossed` leading to mis=
sed thermal violations.
- [High] Potential NULL pointer dereference accessing `node->name` on non-O=
F platforms.
- [High] Incorrect bitwise AND used to check a 4-bit fault status enumerati=
on.
- [High] Silent disablement of supported thermal trips.
- [Medium] Hardware threshold interrupt is enabled before configuring the t=
hreshold value.
- [Low] Incompatible pointer type passed to `regmap_read`.
--

commit 59e6da95c48d5200129439570e254b1f9180acf4
Author: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Subject: thermal: qcom: Add support for Qualcomm MBG thermal monitoring

This patch adds a driver for the Qualcomm MBG thermal monitoring device.
It monitors the die temperature and notifies the thermal framework when a=20
level 1 upper threshold violation occurs via an SPMI interrupt.

> diff --git a/drivers/thermal/qcom/qcom-spmi-mbg-tm.c b/drivers/thermal/qc=
om/qcom-spmi-mbg-tm.c
> new file mode 100644
> index 0000000000000..60190b341fc7c
> --- /dev/null
> +++ b/drivers/thermal/qcom/qcom-spmi-mbg-tm.c

[ ... ]

> +static int mbg_tm_get_temp(struct thermal_zone_device *tz, int *temp)
> +{
> +	struct mbg_tm_chip *chip =3D thermal_zone_device_priv(tz);
> +	int ret, milli_celsius;
> +
> +	if (chip->last_thres_crossed) {
> +		dev_dbg(chip->dev, "last_temp: %d\n", chip->last_temp);
> +		chip->last_thres_crossed =3D false;
> +		*temp =3D chip->last_temp;
> +		return 0;
> +	}

[Severity: High]
Could this lockless read and clear of chip->last_thres_crossed cause missed
thermal violations?

If a user-space sysfs read occurs concurrently with the thermal worker=20
execution (which is triggered by the ISR), the sysfs read might consume the=
=20
flag by setting it to false.

When the thermal worker subsequently calls mbg_tm_get_temp(), it would see=
=20
false and read the raw ADC value. Because ADC readings can fluctuate and=20
lag, it might read a value below the threshold, entirely missing the=20
violation.

[ ... ]

> +static int mbg_tm_set_trip_temp(struct thermal_zone_device *tz, int low_=
temp,
> +				int temp)
> +{
> +	struct mbg_tm_chip *chip =3D thermal_zone_device_priv(tz);
> +	int ret =3D 0;
> +
> +	guard(mutex)(&chip->lock);
> +
> +	/* The HW has a limitation that the trip set must be above 25C */
> +	if (temp > MBG_MIN_TRIP_TEMP && temp < MBG_MAX_SUPPORTED_TEMP) {
> +		ret =3D regmap_set_bits(chip->map, chip->base + MBG_TEMP_MON2_MISC_CFG,
> +				      MON2_UP_THRESH_EN);
> +		if (ret < 0)
> +			return ret;
> +
> +		ret =3D regmap_write(chip->map, chip->base + MON2_LVL1_UP_THRESH,
> +				   temp_to_vtemp_mv(temp));

[Severity: Medium]
Is it safe to enable the threshold comparator before programming the new
threshold value?

If the hardware retains a stale threshold from a prior state that is lower
than the current temperature, enabling the comparator first could
immediately trigger a spurious interrupt.

Would it be better to write the threshold value before enabling the
interrupt?

> +		if (ret < 0)
> +			return ret;
> +	} else {
> +		dev_dbg(chip->dev, "Set trip b/w 25C and 160C\n");
> +		ret =3D regmap_clear_bits(chip->map, chip->base + MBG_TEMP_MON2_MISC_C=
FG,
> +					MON2_UP_THRESH_EN);
> +		return ret;
> +	}

[Severity: High]
When the requested temperature falls outside the hardware's supported bound=
s,
the driver disables the threshold interrupt and returns 0.

By returning 0, does the driver deceptively signal to the thermal core that
the trip has been successfully configured?

Because the interrupt is disabled, the core will never be notified when the
temperature violates the trip point. Should this return an error code like
-ERANGE instead?

[ ... ]

> +static irqreturn_t mbg_tm_isr(int irq, void *data)
> +{
> +	struct mbg_tm_chip *chip =3D data;
> +	int ret, val;

[Severity: Low]
The regmap_read() function expects an unsigned int pointer for the value
parameter, but val is declared as a signed int here.

> +
> +	scoped_guard(mutex, &chip->lock) {
> +		ret =3D regmap_read(chip->map, chip->base + MBG_TEMP_MON2_FAULT_STATUS=
, &val);
> +		if (ret < 0)
> +			return IRQ_HANDLED;
> +	}
> +
> +	if (FIELD_GET(MON_FAULT_STATUS_MASK, val) & MON_FAULT_LVL1_UPR) {

[Severity: High]
Does this bitwise AND correctly check the 4-bit fault status enumeration?

MON_FAULT_LVL1_UPR is defined as 0x5 (binary 0101). A bitwise AND against
0x5 will evaluate to true if either bit 0 or bit 2 is set, matching
unrelated fault states like 0x1, 0x4, or 0x7.

Should this use an exact equality check (=3D=3D) instead?

> +		chip->last_thres_crossed =3D true;

[Severity: High]
This sets chip->last_thres_crossed to true outside of the mutex. As
mentioned earlier in mbg_tm_get_temp(), this flag is read and cleared
locklessly.

Could this lead to a data race if mbg_tm_get_temp() executes concurrently?

> +		dev_dbg(chip->dev, "Notifying Thermal, fault status=3D%d\n", val);
> +		thermal_zone_device_update(chip->tz_dev, THERMAL_TRIP_VIOLATED);
> +	} else {
> +		dev_dbg(chip->dev, "Lvl1 upper threshold not violated, ignoring interr=
upt\n");
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int mbg_tm_probe(struct platform_device *pdev)
> +{
> +	struct mbg_tm_chip *chip;
> +	struct device_node *node =3D pdev->dev.of_node;

[ ... ]

> +	chip->tz_dev =3D devm_thermal_of_zone_register(chip->dev, 0, chip, &mbg=
_tm_ops);
> +	if (IS_ERR(chip->tz_dev))
> +		return dev_err_probe(chip->dev, PTR_ERR(chip->tz_dev),
> +				     "Failed to register sensor\n");
> +
> +	return devm_request_threaded_irq(&pdev->dev, chip->irq, NULL, mbg_tm_is=
r, IRQF_ONESHOT,
> +					 node->name, chip);
> +}

[Severity: High]
Will node->name cause a NULL pointer dereference on non-OF platforms?

Because the driver uses device_property_read_u32(), it can be instantiated
via ACPI or MFD without a device tree node, meaning pdev->dev.of_node
could be NULL.

Would it be safer to use dev_name(&pdev->dev) instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260601-spmi-mbg-d=
river-v1-0-b4892b55a17f@oss.qualcomm.com?part=3D2
