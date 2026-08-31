Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB15403B1B
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 12:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788179501; cv=none; b=iPXkONLNO6Z7ofTqagrvyuSfsgGTmWsKbTtcvKMHxT/rZpxhbCcrAAqhX1BEijkOUD0DIYZkPIXB18lgAe0u5qS6ukbYE9wzVWtGjfdEcH4ftLlmCLDCdJVPzpgmifiNIwA6j+bZxK9vGoNtnu+zRVOmhJGDFattIyA+43ZPxqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788179501; c=relaxed/simple;
	bh=FBfRGzW4OhSp4mJrpiAXELuqd/YtgtYL7ulh6yE87Dk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NG+jpvTkZtLtUiV/HjdnrrYlpvL+vpTz8WQM5RUvJxBzjKpuSYhWuyJ4MLbIRqhV533A0q01wC9G1cA9olSV18TlDKHQTva4XwjVwfJFM7Ii4ytgXrZG4TIYZJUEhdkUT+4gtiUTJ3yufMNM8WvQSxYPMowJIUYXlNLHOJltKmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fbHsi8+T; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fbHsi8+T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C3C91F00A3D;
	Mon, 31 Aug 2026 12:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788179499;
	bh=ejHuym2HxT8JOW/TDiIuZhbZGBwQxVxXsDkOLE5IJgk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fbHsi8+Twjjk0ScM1z0AI1GBSxO4xa+5yGy2JdE0d1garTUF3dt/d7BVOBx6ectac
	 Ss7satNhdxyff5mmxHx9UzIdy8ulxL/ETC8fO9gRK87ciPChAyL4/Ywn0qHSBiWl6j
	 Oeu/xBd9JH8Uyr5zjZftIDJN2HJqC/nsfUzU6DUvmoImrgeUUYMhrGjoNmIHY2ecka
	 8z+xM9g2n3bcRyR0gX9Bzk5KV4J12q9r2s8R5R/DC2K5pa5ZiXdq8UQkqkdUSpZ37/
	 UREoj3qFmrcxTcNdoxVFyoQRYpNSdNRixOeuRrPXj6tztB1UyT6czDioF/V+kxqYB/
	 jQEWq6tz83lZw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 7/8] iio: accel: mma8452: Fix use-after-free bug in
 error error path
Reply-To: sashiko-reviews@lists.linux.dev
To: "Esben Haabendal" <esben@geanix.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260831-mma8452-open-drain-v7-7-22946812c928@geanix.com>
References: <20260831-mma8452-open-drain-v7-0-22946812c928@geanix.com>
 <20260831-mma8452-open-drain-v7-7-22946812c928@geanix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 12:31:38 +0000
Message-Id: <20260831123139.5C3C91F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing runtime PM reference during probe() allows concurrent susp=
end and unbalanced regulator disables.
- [High] Unpowered I2C access and unbalanced regulator disables in mma8452_=
remove().
- [High] Runtime PM reference leak in mma8452_read() on I2C error path.
- [High] Runtime PM reference leak in mma8452_write_event_config() and mma8=
452_data_rdy_trigger_set_state() on I2C error paths.
--

commit f144db47a6c84b2bd25c6e5cc7cf38650461861a
Author: Esben Haabendal <esben@geanix.com>

iio: accel: mma8452: Fix use-after-free bug in error error path

If mma8452_probe() fails in iio_device_register() or later, we could end up
with runtime suspend callback being called with a now freed device pointer.

Cc: stable@vger.kernel.org

> diff --git a/drivers/iio/accel/mma8452.c b/drivers/iio/accel/mma8452.c
> index bf56ebd6e091a..9619b200fa5a9 100644
> --- a/drivers/iio/accel/mma8452.c
> +++ b/drivers/iio/accel/mma8452.c
> @@ -1745,7 +1745,7 @@ static int mma8452_probe(struct i2c_client *client)
> =20
>  	ret =3D iio_device_register(indio_dev);
>  	if (ret < 0)
> -		goto free_irq;
> +		goto runtime_suspend;
> =20
>  	ret =3D mma8452_set_freefall_mode(data, false);
>  	if (ret < 0)
> @@ -1756,6 +1756,10 @@ static int mma8452_probe(struct i2c_client *client)
>  unregister_device:
>  	iio_device_unregister(indio_dev);
> =20
> +runtime_suspend:
> +	pm_runtime_disable(dev);
> +	pm_runtime_set_suspended(dev);
> +
>  free_irq:
>  	if (client->irq)
>  		free_irq(client->irq, indio_dev);

[Severity: High]
This isn't a bug introduced by this patch, but looking at the error paths h=
ere
in mma8452_probe(), is it possible to hit an unbalanced regulator disable if
the device suspends concurrently?

Because the shared IRQ is requested earlier in mma8452_probe(), if the
interrupt fires, mma8452_interrupt() increments and then drops the usage co=
unt
via pm_runtime_put_autosuspend():

drivers/iio/accel/mma8452.c:mma8452_interrupt() {
    ...
    if (pm_status > 0)
        pm_runtime_put_autosuspend(&data->client->dev);
    ...
}

Since pm_runtime_use_autosuspend() hasn't been called yet during this early
phase in mma8452_probe():

drivers/iio/accel/mma8452.c:mma8452_probe() {
    ...
    pm_runtime_enable(dev);
    pm_runtime_set_autosuspend_delay(dev, MMA8452_AUTO_SUSPEND_DELAY_MS);
    pm_runtime_use_autosuspend(dev);
    ...
}

Dropping the count schedules an immediate asynchronous suspend via the
workqueue. The device could suspend mid-probe, and mma8452_runtime_suspend()
would disable the hardware regulators. Subsequent I2C accesses in the
remainder of probe would hit unpowered hardware, leading to bus errors or
hangs.

If mma8452_probe() subsequently fails, the error path unconditionally calls
regulator_disable():

drivers/iio/accel/mma8452.c:mma8452_probe() {
    ...
disable_regulators:
    regulator_disable(data->vddio_reg);
    ...
}

Could this cause an unbalanced disable WARN? Should probe hold a PM usage
reference via pm_runtime_get_noresume() before enabling runtime PM?

[Severity: High]
This is a pre-existing issue, but does mma8452_remove() safely access I2C
hardware and disable regulators during driver unbind?

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

If the device was runtime suspended (which happens automatically after 2
seconds of inactivity), the hardware is unpowered and regulators are already
disabled. mma8452_standby() performs I2C accesses on unpowered hardware,
which will fail or hang the bus. The subsequent regulator_disable() calls
drop the enable count below zero, triggering a kernel WARN. Should
mma8452_remove() wake the device via pm_runtime_get_sync() before performing
hardware cleanup?

[Severity: High]
This isn't a bug introduced by this patch, but does mma8452_read() leak a
runtime PM reference on the I2C error path?

drivers/iio/accel/mma8452.c:mma8452_read() {
    ...
    ret =3D mma8452_set_runtime_pm_state(data->client, true);
    if (ret)
        return ret;

    ret =3D i2c_smbus_read_i2c_block_data(data->client, MMA8452_OUT_X,
                        3 * sizeof(__be16), (u8 *)buf);
    if (ret < 0)
        return ret;
    ...
}

If i2c_smbus_read_i2c_block_data() fails, it returns the error immediately
without calling mma8452_set_runtime_pm_state(..., false). This leaves the PM
usage count unbalanced, preventing the device from entering runtime suspend
and causing a permanent power drain.

[Severity: High]
This isn't a bug introduced by this patch, but there appear to be similar PM
reference leaks in mma8452_write_event_config() and
mma8452_data_rdy_trigger_set_state() on I2C error paths:

drivers/iio/accel/mma8452.c:mma8452_write_event_config() {
    ...
        val =3D i2c_smbus_read_byte_data(data->client, ev_regs->ev_cfg);
        if (val < 0)
            return val;
    ...
}

drivers/iio/accel/mma8452.c:mma8452_data_rdy_trigger_set_state() {
    ...
    reg =3D i2c_smbus_read_byte_data(data->client, MMA8452_CTRL_REG4);
    if (reg < 0)
        return reg;
    ...
}

Both functions acquire a PM reference. If the subsequent hardware
configuration via I2C read fails, they return the error immediately without
rolling back the PM state, permanently breaking power management for the
device.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831-mma8452-op=
en-drain-v7-0-22946812c928@geanix.com?part=3D7
