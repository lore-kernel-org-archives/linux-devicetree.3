Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F113890F1
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 08:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787128080; cv=none; b=r6HtNKOjVfvqWjS2uQuR2wN9UEX5Jaxxw7xM8kXQ9nMFywOTUYKVg/kvb7yz8N2HLFPLASs8pbohCVvKKZkEubBobVjEWuzKb5XqtOLW/x0AwdNjL294G6We5xGf1Gg3+Ov5pzMxgp/g2KfzlV5jzZDtWpN1RoCkXmCCrXlbP0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787128080; c=relaxed/simple;
	bh=gQbiITtceTrDVTqSrjF5cfgze2Ea2KEBoVzfycoMQyg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XdpjHq1h9l1R3oQ6o5zZu0ss6PKtafle21WU3ehw0QYgV7Dm7/dazpHOKaQb1lVroUXkUDQu4SbsLGA3DDgFLpap0lX93Rs7tKhd/zAxrfL4Fc9R9coDIKg67qmHQK3VsFHvq3rFVxJuzi3nWGfsdd7j6kn4so8EJPwSV/07Q4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KklepRI6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KklepRI6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83ABB1F000E9;
	Wed, 19 Aug 2026 08:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787128078;
	bh=7aPGWRKQsnFbBlR0YRyN6O4tdmneHclaTGkQSs8Lbco=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KklepRI6CIuZTzs8H1RTSCdRTVKeAaE8DPVR5QUFr1acaZPVzZ8E2pxXIy4lBmAiH
	 Y04XDOsyBwbGalSsSQyk2upm6TiUorCnjTKVPtwO8Jxsngyane2G3YLr5GRzogY2qm
	 bsh2jnHO6TUigsOBtqhuteOPsM0s/eh8PV1DrtnlRIe4IxxMRMl28yOFDH7wT0ZZyu
	 O+0DKoos+mXxVeGC1W2qppZJ9qbfY9HFjcNDIQ59kT0jdTAhhGNcsXmgKzZGcVgS1G
	 4H9S7CaSmpQYN/9Rx479ZyqXJCmHxicnaUdft5mXID3hMbK2uUdBNa7mo6+6PyzsCW
	 XI0JG+yzAg2lg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v5 2/6] iio: accel: mma8452: Optimize struct
 mma8452_data member orders
Reply-To: sashiko-reviews@lists.linux.dev
To: "Esben Haabendal" <esben@geanix.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260819-mma8452-open-drain-v5-2-d8aa590d7c36@geanix.com>
References: <20260819-mma8452-open-drain-v5-0-d8aa590d7c36@geanix.com>
 <20260819-mma8452-open-drain-v5-2-d8aa590d7c36@geanix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Aug 2026 08:27:58 +0000
Message-Id: <20260819082758.83ABB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The mma8452_probe function fails to disable PM runtime on error pa=
ths, causing a Use-After-Free.
- [High] mma8452_remove() performs I2C accesses and disables regulators wit=
hout first resuming the device, leading to timeouts and unbalanced regulato=
r counts.
- [High] `mma8452_runtime_resume` does not hold `data->lock`, causing sever=
e race conditions with `mma8452_change_config`.
- [High] I2C registers are accessed before the device is resumed from PM ru=
ntime suspend, leading to systematic I/O errors when regulators are off.
- [High] Kernel stack memory can be leaked to userspace due to unhandled sh=
ort reads from the I2C bus.
- [Medium] Integer overflow in `val * USEC_PER_SEC` allows bypassing bounds=
 checks when configuring the event period.
--

--- Patch [2]: [PATCH RESEND v5 2/6] iio: accel: mma8452: Optimize struct m=
ma8452_data member orders ---
commit ad9de8da12adc66a058b85d96e7d8e823d6389d4
Author: Esben Haabendal <esben@geanix.com>

iio: accel: mma8452: Optimize struct mma8452_data member orders

This commit reorders the members of struct mma8452_data to eliminate padding
holes. It groups the sleep_val, ctrl_reg1, and data_cfg members at the end
of the structure.

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

[Severity: High]
This is a pre-existing issue, but does mma8452_probe() fail to disable PM
runtime on error paths?

If a step like iio_device_register() fails after PM runtime is enabled via
pm_runtime_enable() and pm_runtime_use_autosuspend(), the code jumps to the
error labels:

drivers/iio/accel/mma8452.c:mma8452_probe() {
...
free_irq:
	if (client->irq)
		free_irq(client->irq, indio_dev);
...

Since it misses calling pm_runtime_disable(&client->dev), a pending PM
autosuspend timer can still fire after the devres-managed data and indio_dev
are freed.

When mma8452_runtime_suspend() runs, it attempts to lock data->lock and
access regulators within the freed structure. Can this lead to a
use-after-free?


[Severity: High]
This isn't a bug introduced by this patch, but does mma8452_remove() tear
down resources without waking the device first?

If the device is in autosuspend, its regulators are disabled. During module
removal, mma8452_remove() prevents future state changes but does not wake up
the device:

drivers/iio/accel/mma8452.c:mma8452_remove() {
...
	pm_runtime_disable(&client->dev);
	pm_runtime_set_suspended(&client->dev);
...

It then calls mma8452_standby() which initiates an I2C transaction on the
powered-off chip, causing an I2C timeout.

It also calls regulator_disable() on the already disabled regulators,
triggering a WARN for unbalanced disables. Should there be a
pm_runtime_get_sync() at the beginning of the remove function?


[Severity: High]
This is a pre-existing issue, but does mma8452_runtime_resume() modify the
device active state without holding the data->lock?

The runtime resume handler performs an unprotected I2C write to
MMA8452_CTRL_REG1:

drivers/iio/accel/mma8452.c:mma8452_runtime_resume() {
...
	ret =3D mma8452_active(data);
	if (ret < 0)
		goto runtime_resume_failed;
...

If PM core resumes the device concurrently with a sysfs attribute write
(which relies on exclusive lock protection to keep the device in STANDBY),
their writes can interleave:

drivers/iio/accel/mma8452.c:mma8452_change_config() {
...
	/* config can only be changed when in standby */
	if (is_active > 0) {
		ret =3D mma8452_standby(data);
		if (ret < 0)
			goto fail;
	}
...

A concurrent unprotected mma8452_active() from the resume path will
prematurely switch the device to ACTIVE, violating the chip's requirement
that configurations only change during STANDBY. Can this cause sysfs
writes to be silently ignored?


[Severity: High]
This isn't a bug introduced by this patch, but does the driver attempt I2C
operations before the device is resumed from PM runtime suspend?

The driver supports PM autosuspend, which turns off power to the hardware
via the regulators. When reading data, data ready polling is performed befo=
re
setting the PM runtime state to active:

drivers/iio/accel/mma8452.c:mma8452_read() {
...
	int ret =3D mma8452_drdy(data);

	if (ret < 0)
		return ret;

	ret =3D mma8452_set_runtime_pm_state(data->client, true);
...

If the device is suspended and unpowered, the I2C read in mma8452_drdy()
fails with -EIO, aborting the read before the device is woken up.

Similarly, sysfs writes via __mma8452_write_raw() perform I2C operations
without requesting a PM resume at all:

drivers/iio/accel/mma8452.c:__mma8452_write_raw() {
...
return mma8452_change_config(data, MMA8452_CTRL_REG1,
					     data->ctrl_reg1);
...

Does this lead to systematic I/O errors when the regulators are off?


[Severity: High]
This is a pre-existing issue, but does mma8452_read_raw() leak kernel stack
memory due to unhandled short reads?

When mma8452_read() performs the I2C block read, it overwrites the positive
return value (bytes read) with 0:

drivers/iio/accel/mma8452.c:mma8452_read() {
...
	ret =3D i2c_smbus_read_i2c_block_data(data->client, MMA8452_OUT_X,
					    3 * sizeof(__be16), (u8 *)buf);
	if (ret < 0)
		return ret;

	ret =3D mma8452_set_runtime_pm_state(data->client, false);

	return ret;
...

Because it erases the knowledge of a short read, mma8452_read_raw() blindly
accesses its local uninitialized array:

drivers/iio/accel/mma8452.c:mma8452_read_raw() {
...
		*val =3D sign_extend32(be16_to_cpu(
			buffer[chan->scan_index]) >> chan->scan_type.shift,
			chan->scan_type.realbits - 1);
...

If the block read returns fewer bytes than requested, could accessing the
unpopulated trailing portion of the array leak uninitialized stack memory to
userspace?


[Severity: Medium]
This isn't a bug introduced by this patch, but does the event period
configuration suffer from an integer overflow?

In mma8452_write_event_value(), a 32-bit multiplication is performed before
deriving and validating the hardware configuration steps:

drivers/iio/accel/mma8452.c:mma8452_write_event_value() {
...
		steps =3D (val * USEC_PER_SEC + val2) /
				mma8452_time_step_us[ret][
					mma8452_get_odr_index(data)];

		if (steps < 0 || steps > 0xff)
			return -EINVAL;
...

On 32-bit systems, USEC_PER_SEC is a 32-bit long. Since val is derived from
user input as a signed 32-bit integer, providing a large positive value
(e.g., 4300) can cause val * 1000000 to overflow and wrap around to a small
positive integer.

Because the wrapped value will then seamlessly pass the bounds check, does
this allow userspace to bypass validation and program an incorrect period
into the hardware?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260819-mma8452-op=
en-drain-v5-0-d8aa590d7c36@geanix.com?part=3D2
