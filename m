Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6053E2AD6
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 08:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787647140; cv=none; b=NOnt0+MMk9YamH5IRQqwkcK++kjXODF9oKLO8+Zb1/Sf6Zhf/9TrnKMpxzU5lcm2hIXCorRwXEEY4bgbHpHN8sdHStHgu61JyhtJQkwGNRcUFh1DJqlA5WUINuxpy/ZzUlL016Lv7Gunuo5PogPbJWh1jIrfsJ0YNDspIytMQc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787647140; c=relaxed/simple;
	bh=7T7pY7utwvtxOk7tgFxibSzP8j6we7/laT+MhTM9sSI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ImM97EFkV4qHTGFV2emWDzIZw7KPeq3cjQGE7CON2/NCAvo5SA79yPh66RVleuHoJyKMGjEk0VWrI+Rj+KYsQ1xUGSoCIbIuIc7HX/rE2BrJ33ZyZo/ew/oknwat6RtaU+nxiDyV+MeN+Ca/Rv3zPFjKqx4PU73w2grd8v0d+pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZfNIknss; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZfNIknss"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5F391F000E9;
	Tue, 25 Aug 2026 08:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787647139;
	bh=t7FuhuhZHOTPsQpACLKJmJ39gvgoSefuyJl90A8elQ8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZfNIknssF94117HWi1hYg6qKdrWMJuFyASeXckVyjcU4stTtvMvyfnL50GsCslRIm
	 gHFC8sbaZXjB/ZlGQEwouA6YmSwHzruSFM8DwpCBbTOQUBsfF+QmqNw7KwYRmW12HA
	 SiGuaRNtZ1MQNDiIfN8iRf20UG3zsE5w2j5HmjwmXWRtEBBXKdqTw15gp+6RkbuNna
	 hVY7l/5m67HPMD9+1kal7VKAsyKvoai+cPJd/RRZlS4wD29rnw4tACFtW32WjGus7/
	 mVaGOIINvn9YQq+TR3FBj25gSF1z+FUq2dVh7t50TZMSc2oVDbWg87q7mEJ+u/qklK
	 PAMAFOoD2xerA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/9] iio: accel: mma8452: Optimize struct
 mma8452_data member orders
Reply-To: sashiko-reviews@lists.linux.dev
To: "Esben Haabendal" <esben@geanix.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260825-mma8452-open-drain-v6-2-9b252804ee80@geanix.com>
References: <20260825-mma8452-open-drain-v6-0-9b252804ee80@geanix.com>
 <20260825-mma8452-open-drain-v6-2-9b252804ee80@geanix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 08:38:58 +0000
Message-Id: <20260825083858.A5F391F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Short I2C reads lead to an uninitialized kernel stack memory leak =
to userspace.
- [Medium] Runtime PM reference leak on I2C communication failure.
- [Medium] Unbalanced regulator disable and unpowered I2C access during mod=
ule removal.
- [Medium] Data race during read-modify-write of event configuration regist=
ers.
--

--- Patch [2]: [PATCH v6 2/9] iio: accel: mma8452: Optimize struct mma8452_=
data member orders ---
commit 26f60bee6a5ce9626d25a99fe80c0216eb010682
Author: Esben Haabendal <esben@geanix.com>

iio: accel: mma8452: Optimize struct mma8452_data member orders
   =20
Reorder struct mma8452_data members to avoid holes.

> diff --git a/drivers/iio/accel/mma8452.c b/drivers/iio/accel/mma8452.c
> index 7d683686dd9d6..f645a5c6fd1c2 100644
> --- a/drivers/iio/accel/mma8452.c
> +++ b/drivers/iio/accel/mma8452.c
> @@ -106,10 +106,7 @@ struct mma8452_data {
>  	struct i2c_client *client;
>  	struct mutex lock;
>  	struct iio_mount_matrix orientation;
> -	u8 ctrl_reg1;
> -	u8 data_cfg;
>  	const struct mma_chip_info *chip_info;
> -	int sleep_val;
>  	struct regulator *vdd_reg;
>  	struct regulator *vddio_reg;
> =20
> @@ -118,6 +115,10 @@ struct mma8452_data {
>  		__be16 channels[3];
>  		aligned_s64 ts;
>  	} buffer;
> +
> +	int sleep_val;
> +	u8 ctrl_reg1;
> +	u8 data_cfg;
>  };

[Severity: Medium]
This is a pre-existing issue, but does this early return leak the runtime PM
reference count?

drivers/iio/accel/mma8452.c:mma8452_read() {
...
	ret =3D i2c_smbus_read_i2c_block_data(data->client, MMA8452_OUT_X,
					    3 * sizeof(__be16), (u8 *)buf);
	if (ret < 0)
		return ret;
...
}

If i2c_smbus_read_i2c_block_data() fails, the function returns directly,
skipping the mma8452_set_runtime_pm_state() call.

A similar issue appears in mma8452_data_rdy_trigger_set_state() where a
failure during i2c_smbus_read_byte_data() skips dropping the autosuspend
reference if state was true.

[Severity: Medium]
This isn't a bug introduced by this patch, but during module removal, does
mma8452_remove() execute operations on an already suspended device?

drivers/iio/accel/mma8452.c:mma8452_remove() {
...
	pm_runtime_disable(&client->dev);
	pm_runtime_set_suspended(&client->dev);

	if (client->irq)
		free_irq(client->irq, indio_dev);

	iio_triggered_buffer_cleanup(indio_dev);
	mma8452_trigger_cleanup(indio_dev);
	mma8452_standby(iio_priv(indio_dev));

	regulator_disable(data->vddio_reg);
	regulator_disable(data->vdd_reg);
...
}

If the module is removed while the device is in a runtime-suspended state,
pm_runtime_disable() does not wake up the device. Subsequent calls to
mma8452_standby() and regulator_disable() are then executed on an unpowered
device.

[Severity: Medium]
This is a pre-existing issue, but can concurrent sysfs writes cause a data
race when updating event configuration registers?

drivers/iio/accel/mma8452.c:mma8452_write_event_config() {
...
	case IIO_EV_DIR_RISING:
		val =3D i2c_smbus_read_byte_data(data->client, ev_regs->ev_cfg);
		if (val < 0)
			return val;
...
		return mma8452_change_config(data, ev_regs->ev_cfg, val);
...
}

The read-modify-write sequence is performed without acquiring the internal
driver lock.

If two threads concurrently write to different event attributes in sysfs,
could the initial read and bitwise modifications race, overwriting each
other's configuration bits?

[Severity: High]
This isn't a bug introduced by this patch, but can a short I2C read result
in uninitialized stack memory being leaked to userspace?

drivers/iio/accel/mma8452.c:mma8452_read() {
...
	ret =3D i2c_smbus_read_i2c_block_data(data->client, MMA8452_OUT_X,
					    3 * sizeof(__be16), (u8 *)buf);
	if (ret < 0)
		return ret;

	ret =3D mma8452_set_runtime_pm_state(data->client, false);

	return ret;
}

If i2c_smbus_read_i2c_block_data() encounters a short read, it returns a
positive number less than the requested size. The condition ret < 0 is fals=
e,
so the code proceeds and overwrites ret with the return value of
mma8452_set_runtime_pm_state(), which is 0.

When mma8452_read() returns 0 instead of propagating the short read:

drivers/iio/accel/mma8452.c:mma8452_read_raw() {
...
		ret =3D mma8452_read(data, buffer);
...
		*val =3D sign_extend32(be16_to_cpu(
			buffer[chan->scan_index]) >> chan->scan_type.shift,
			chan->scan_type.realbits - 1);
...
}

Does the caller process and return the uninitialized stack memory from buff=
er
via *val?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825-mma8452-op=
en-drain-v6-0-9b252804ee80@geanix.com?part=3D2
