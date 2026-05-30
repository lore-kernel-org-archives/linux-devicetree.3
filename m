Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C76212542
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 04:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780113940; cv=none; b=lIdVxZSIqbJXWg6xQuOiIYYYRDWMyDLl/Mgfe48SwyiHQ/6DpHGO4t5ViJAZNERLlDTsscXAjRyHz0gR0ozMC/zB/zbUkvPlGbj/s10EEynMj4IFLlSSCc/Ue18Ph9gR6OqDDzeyVFohq3gra4t7vfuS1TGZnwH485vrFbtILqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780113940; c=relaxed/simple;
	bh=l3eWpuTodesnOxTabPAuXDQR6CGm0qQhTDqLw4MGpb4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aZp1S4cda94PajSA3PtD5xycMW3RLlcsroAAdHhu0waBGpelqcMb1+j4ck73gGkKqq/P9Y+daFo2xjmeRJ0QKBhbt9c3y3Knn860dOXiB4QH/ITH5f80Q4DooX7bDjCEkCB9fZmwcvwcSXYGicYp/llogJyAl6vCjcgX4HAj58E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nR7vzLDE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nR7vzLDE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DAF41F00893;
	Sat, 30 May 2026 04:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780113938;
	bh=fmtXra1maHTVJCj0/pzJGTBsG40vMRK6F4SeMxeeq3k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nR7vzLDEwjmCeAapEii4f8KCGabHqW3Rq6jIBNYIjt9YpL7RvjqSzj715yujE+L90
	 VGnXTTbmSoYBUZTuwBSIsUdfOHdZs6BfhtjI6cP5+//VUUgYqe0Lx+TQaGsUt/7Vgb
	 gN475czJnW/Dk9vXSuHzM8V53TE6MpEvrFb2FW6g5HOqSbBDyNZue8QZ0UhIygfMsn
	 XCExDz9CT1Y3Vr92WFPNF2PspwaRwX904tgsx5F6mfnpuP6u7kU3Xlgnmj9BTCz6d/
	 FIIlSJztX/DdVIaWRo4JzV5ZmjeD4lcIwWRA18663CsQmYcZqMMD207hiew3aR67wY
	 WHUMzI1OplZDw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V9 06/11] iio: imu: inv_icm42607: Add Buffer support for
 icm42607
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260530031739.109063-7-macroalpha82@gmail.com>
References: <20260530031739.109063-7-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 04:05:38 +0000
Message-Id: <20260530040538.6DAF41F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [High] Regmap write is executed after the hardware power has already been=
 disabled, causing bus timeouts or crashes.
- [High] Missing `__packed` attribute on `struct inv_icm42607_fifo_sensor_d=
ata` causes an unaligned memory access fault on strict architectures.
- [High] `st->fifo.count` read from the hardware is not rounded down to a m=
ultiple of `packet_size` before reading from the hardware FIFO, permanently=
 desynchronizing the FIFO stream if a partial packet is present.
- [Medium] `get_unaligned(&packet)` is misused to cast a pointer, failing t=
o perform an unaligned read of the actual struct fields.

Pre-existing issues:
- [Critical] System suspend and resume callbacks inherently deadlock agains=
t their runtime PM equivalents due to recursive locking of the same non-rec=
ursive mutex.
--

commit b02d906e23fd74f9655bad46fd7b83ee46cc34c9
Author: Chris Morgan <macromorgan@hotmail.com>

iio: imu: inv_icm42607: Add Buffer support for icm42607

Add all FIFO parsing and reading functions to support inv_icm42607 hardware.

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_buffer.h b/drivers=
/iio/imu/inv_icm42607/inv_icm42607_buffer.h
> new file mode 100644
> --- /dev/null
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_buffer.h

[ ... ]

> +/* FIFO data packet */
> +struct inv_icm42607_fifo_sensor_data {
> +	__be16 x;
> +	__be16 y;
> +	__be16 z;
> +};

[Severity: High]
Does this struct need a __packed attribute?

Because this struct is embedded inside the __packed packets at odd byte off=
sets
(like inv_icm42607_fifo_1sensor_packet), leaving it unpacked means the comp=
iler
assumes normal 2-byte alignment for its fields.=20

When these fields are later accessed in inv_icm42607_fifo_is_data_valid()
via be16_to_cpu(), could this trigger a fatal alignment fault on architectu=
res
lacking hardware support for unaligned accesses?

> +
> +#define INV_ICM42607_FIFO_DATA_INVALID		-32768

[ ... ]

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_buffer.c b/drivers=
/iio/imu/inv_icm42607/inv_icm42607_buffer.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_buffer.c

[ ... ]

> +ssize_t inv_icm42607_fifo_decode_packet(const void *packet, const void *=
*accel,
> +					const void **gyro, const int8_t **temp,
> +					const void **timestamp)
> +{
> +	const struct inv_icm42607_fifo_1sensor_packet *pack1 =3D get_unaligned(=
&packet);
> +	const struct inv_icm42607_fifo_2sensors_packet *pack2 =3D get_unaligned=
(&packet);

[Severity: Medium]
Are these get_unaligned() calls working as intended?

By taking the address of the pointer argument (&packet), get_unaligned() si=
mply
reads the pointer value off the stack itself. It does not mark the resulting
pointer for safe unaligned access of the actual struct fields in the data
buffer.=20

Is there a better way to safely cast these pointers?

> +	u8 header =3D *((const u8 *)packet);

[ ... ]

> +	/* check and clamp FIFO count value */
> +	if (st->fifo.count =3D=3D 0)
> +		return 0;
> +
> +	st->fifo.count =3D min(st->fifo.count, max_count);
> +
> +	/* read all FIFO data in internal buffer */
> +	ret =3D regmap_noinc_read(st->map, INV_ICM42607_REG_FIFO_DATA,
> +				st->fifo.data, st->fifo.count);

[Severity: High]
Does st->fifo.count need to be rounded down to a multiple of the packet size
before reading from the hardware FIFO?

If a read races with the hardware writing a new packet, the reported count
might include a partial packet. If this unrounded count is passed directly =
to
regmap_noinc_read(), those partial bytes are permanently popped from the
hardware FIFO.

While the decode loop will safely exit when returning -EIO and discarding t=
he
partial bytes, won't the next interrupt resume reading from the halfway poi=
nt
of that packet?=20

Could this permanently desynchronize the stream by causing the decode funct=
ion
to interpret random data bytes as headers?

> +	if (ret)
> +		return ret;

[ ... ]

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c b/drivers/i=
io/imu/inv_icm42607/inv_icm42607_core.c
> --- a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c

[ ... ]

> @@ ... @@
>  static int inv_icm42607_suspend(struct device *dev)
>  {
>  	struct inv_icm42607_state *st =3D dev_get_drvdata(dev);
>  	int ret;
> =20
>  	guard(mutex)(&st->lock);
> =20
>  	if (pm_runtime_suspended(dev))
>  		return 0;
> =20
>  	ret =3D pm_runtime_force_suspend(dev);

[Severity: Critical]
This is a pre-existing issue, but can this system suspend callback deadlock
against its runtime PM equivalent?

In inv_icm42607_suspend(), the driver locks the main state mutex via
guard(mutex)(&st->lock). While holding this lock, it calls
pm_runtime_force_suspend(dev).

If the device is not already suspended, the PM core synchronously executes =
the
device's runtime suspend callback, inv_icm42607_runtime_suspend(), which
immediately attempts to acquire the exact same st->lock via its own
guard(mutex)(&st->lock).=20

Because Linux kernel mutexes are not recursive, does this result in a
guaranteed deadlock on every system suspend transition where the device was
active?

>  	if (ret)
>  		return ret;
> =20
> +	if (st->fifo.on) {
> +		ret =3D regmap_write(st->map, INV_ICM42607_REG_FIFO_CONFIG1,
> +				   INV_ICM42607_FIFO_CONFIG1_BYPASS);

[Severity: High]
Can this regmap_write() timeout or crash the bus by accessing a powered-off
device?

The pm_runtime_force_suspend() call immediately preceding this block delega=
tes
to the driver's runtime suspend callback, which actively powers down the de=
vice
by turning off pwr_mgmt0 and disabling the vddio regulator.=20

When this new regmap_write() executes, the I/O power to the chip has already
been severed.

> +		if (ret)
> +			return ret;
> +	}
> +
>  	ret =3D inv_icm42607_set_pwr_mgmt0(st, INV_ICM42607_SENSOR_MODE_OFF,
>  					 INV_ICM42607_SENSOR_MODE_OFF,
>  					 false, NULL);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260530031739.1090=
63-1-macroalpha82@gmail.com?part=3D6
