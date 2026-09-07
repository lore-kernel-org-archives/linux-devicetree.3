Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355D745D188
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 12:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788782697; cv=none; b=GGfQ0QrcduSSPLXouqiMyRyY+mKNWcqvPErEr4Ma+8E96KwVOXPWldgrirvyUY9DwHR+BasmHAq/AcsLPLannJM75rrnUd3W2T4gi8tt3GwbcPTsUYbFfDnq+gcefaXD+dDrKyfVPn/NJcZOFGe5FTVlNiToqjOz7I876bGYw9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788782697; c=relaxed/simple;
	bh=ad08DuDaSO1yVoT98fF9udpchlg5EnxBlUn+Ke17SOs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bQUFEWA7IsAkNTLi26vjMBDJRC/X14w2exiWvQdS/K4+Hae+CdC6xEd4HeZgSz04n4gKS1o+Tl8oc8IJgGGLeqWG58FfTzgLzXw2ft+X5mStQrObSIhs6qA+Ll9uRXZEYFZIPgQklHZYuqhmI38i9nnreFdCVo3Fap6Q2nu6raA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jD36vBjJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jD36vBjJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D4801F00A3A;
	Mon,  7 Sep 2026 12:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788782695;
	bh=9FNgktMsI7L54qOw0ELGSGQm8VP08SAZw59F1jT7zTM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jD36vBjJtmNPjfDyLvSN7s1xK1Das79V6E/4HpBq8tOgeY0Hi7UFjWWTvXqgjlz3J
	 X3ijd3/OyEpdekweLP+EEMzpBxZGpKuLbeWJx/x6j4AXbSm4P3JZVzh5Uu63iStvPx
	 bWpXmtttV5mHkIzURbhEIqeiZe4gb05X2wqicRCjOs2X+3vT28doGZLt0KHPriC06k
	 EQdRNyWYG9q4Gc4Z65q5roGtHNoU7GGTfcNgB2cUkxy2KufNi7amIrZb7yBkcASB07
	 uuUrnveGeanKQLoy1VSOe+MbbKt34CB6mwmyOsLHd/g0Zv+ORjQJqYgNXaO0HJERO9
	 66AmEnW0Rcfvw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 4/4] iio: light: veml6031x00: add support for events
 and trigger
Reply-To: sashiko-reviews@lists.linux.dev
To: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260907-veml6031x00-v9-4-8c93a6c66a4d@gmail.com>
References: <20260907-veml6031x00-v9-0-8c93a6c66a4d@gmail.com>
 <20260907-veml6031x00-v9-4-8c93a6c66a4d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 12:04:54 +0000
Message-Id: <20260907120455.7D4801F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Device left in Active Force (AF) mode causes stale data in single_=
read
- [Medium] Spurious I2C read from device configuration register caused by i=
terating over the timestamp channel
- [Medium] Software state machine desynchronization leaks interrupt user re=
ference on rollback failure
--

commit 20d504b87ca25179c583e1df1a78eee06d4b1837
Author: Javier Carrasco <javier.carrasco.cruz@gmail.com>

iio: light: veml6031x00: add support for events and trigger

The device provides a shared interrupt line to notify events and
data ready.

> diff --git a/drivers/iio/light/veml6031x00.c b/drivers/iio/light/veml6031=
x00.c
> index 3d5a27a0baaed..110f59625a5b1 100644
> --- a/drivers/iio/light/veml6031x00.c
> +++ b/drivers/iio/light/veml6031x00.c
[ ... ]
> @@ -551,11 +976,83 @@ static int veml6031x00_buffer_postdisable(struct ii=
o_dev *iio)
>  	return 0;
>  }
> =20
> +static int __veml6031x00_set_trigger_state(struct veml6031x00_data *data=
, bool state)
> +	__must_hold(&data->irq_lock)
> +{
> +	int ret;
> +
> +	lockdep_assert_held(&data->irq_lock);
> +
> +	ret =3D veml6031x00_set_interrupt(data, state);
> +	if (ret)
> +		return ret;
> +
> +	/* The AF bit must be updated before updating AF_TRIG */
> +	ret =3D regmap_assign_bits(data->regmap, VEML6031X00_REG_CONF0,
> +				 VEML6031X00_CONF0_AF, state);
> +	if (ret)
> +		goto clear_interrupt;
> +
> +	ret =3D regmap_assign_bits(data->regmap, VEML6031X00_REG_CONF0,
> +				 VEML6031X00_CONF0_AF_TRIG, state);
> +	if (ret) {
> +		regmap_assign_bits(data->regmap, VEML6031X00_REG_CONF0,
> +				   VEML6031X00_CONF0_AF, !state);
> +		goto clear_interrupt;
> +	}
> +
> +	data->trig_en =3D state;
> +
> +	return 0;
> +
> +clear_interrupt:
> +	veml6031x00_set_interrupt(data, !state);

[Severity: Medium]
Does this rollback path cause a state desynchronization if the I2C write in
veml6031x00_set_interrupt() fails?

If the rollback fails, interrupt_users is incremented back to match the
hardware state, but trig_en remains false. This leaves the software counter
orphaned relative to trig_en, which can permanently prevent the driver from
disabling the hardware interrupt in the future.

Can we handle this failure so the interrupt_users count stays synchronized?

> +
> +	return ret;
> +}
[ ... ]
> +static irqreturn_t veml6031x00_trig_handler(int irq, void *p)
> +{
> +	struct iio_poll_func *pf =3D p;
> +	struct iio_dev *iio =3D pf->indio_dev;
> +	struct veml6031x00_data *data =3D iio_priv(iio);
> +	struct regmap *map =3D data->regmap;
> +	IIO_DECLARE_BUFFER_WITH_TS(__le16, scan, 2) =3D { };
> +	unsigned int i;
> +	int ch, ret;
> +
> +	if (test_bit(VEML6031X00_SCAN_ALS, iio->active_scan_mask) &&
> +	    test_bit(VEML6031X00_SCAN_IR, iio->active_scan_mask)) {
> +		ret =3D regmap_bulk_read(map, VEML6031X00_REG_ALS_L,
> +				       scan, 2 * sizeof(*scan));
> +		if (ret)
> +			goto done;
> +	} else {
> +		i =3D 0;
> +		iio_for_each_active_channel(iio, ch) {
> +			ret =3D regmap_bulk_read(map, iio->channels[ch].address,
> +					       &scan[i++], sizeof(*scan));

[Severity: Medium]
Does this loop read from the configuration register by mistake if the
timestamp channel is enabled alongside a single data channel?

The iio_for_each_active_channel() loop processes the timestamp channel, but
its .address is uninitialized (0). This causes a spurious I2C read from
address 0x00 (CONF0), writing the config register contents into the timesta=
mp
padding of the scan buffer.

Could we skip the timestamp channel or check the address before reading?

> +			if (ret)
> +				goto done;
> +		}
> +	}
> +
> +	iio_push_to_buffers_with_ts(iio, scan, sizeof(scan), pf->timestamp);
> +
> +done:
> +	iio_trigger_notify_done(iio->trig);
> +
> +	return IRQ_HANDLED;
> +}
[ ... ]
> +static int veml6031x00_hw_init(struct veml6031x00_data *data)
> +{
> +	struct regmap *map =3D data->regmap;
> +	struct device *dev =3D regmap_get_device(map);
> +	unsigned int val;
> +	__le16 regval;
> +	int ret;
> +
> +	regval =3D 0;
> +	ret =3D regmap_bulk_write(map, VEML6031X00_REG_WL_L, &regval, sizeof(re=
gval));
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to set low threshold\n");
> +
> +	regval =3D cpu_to_le16(U16_MAX);
> +	ret =3D regmap_bulk_write(map, VEML6031X00_REG_WH_L, &regval, sizeof(re=
gval));
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to set high threshold\n");
> +
> +	ret =3D regmap_field_write(data->rf.int_en, 0);

[Severity: High]
Does this initialization sequence leave the device stuck in Active Force (A=
F)
mode?

If the driver is unloaded after using triggered buffers (which sets the AF =
bit
to 1) and then reloaded, or if a warm reboot occurs with an always-on
regulator, the hardware retains AF=3D1. Because veml6031x00_hw_init() does =
not
explicitly reset the VEML6031X00_CONF0_AF bit to 0, the device remains in
Active Force mode.

Subsequent calls to veml6031x00_single_read() do not assert the AF_TRIG bit,
causing the sensor to never execute a new conversion and indefinitely return
stale data.

Should we explicitly reset the AF bit during hardware initialization?

> +	if (ret)
> +		return ret;
> +
> +	ret =3D regmap_read(map, VEML6031X00_REG_INT, &val);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to clear interrupts\n");
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907-veml6031x0=
0-v9-0-8c93a6c66a4d@gmail.com?part=3D4
