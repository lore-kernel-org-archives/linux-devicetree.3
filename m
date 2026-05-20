Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF52369991
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 08:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779264302; cv=none; b=oU5OhHB5rkIa9iYVspYNTj+cFZUY72FLjbl60JhL2yh7I3ukEH94T/xASn/5XiLqjxK84cvn5n4YTPj3RKbJkS9dQBqZKeT/gWWvPguMq/Sgejj6MktFjvdt6JvtgPHL5EvxAMaxgtINDjYQbZvk9zcJi0l4QeqF/QzwBpgiRmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779264302; c=relaxed/simple;
	bh=pYTYioudBGExctRwF/V3dkoYE3VaoyFmIa41xrtRhJk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Eii9OCQmmyBlJxHzEmDc6taGmr8YOQK2QJ+vyHIjrN4LRfYV+2BNT4VRzjfLekLS5QoIjZX2bnkrU1BMKtFQ9ArHNCI6L+hBFoC2hvuMaF41vih0nk1C6cIwfI2PEnq3Z+jxxECDHZl0fpj5qFxClyVufRoWJsKLSU9XsRuzOXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jQnQKVqt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jQnQKVqt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67DAC1F000E9;
	Wed, 20 May 2026 08:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779264298;
	bh=xik6hRdlJk1nrClYl3lVDWbej39mUJ/CG0ZWCVTp7vk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jQnQKVqtVW+cdUobuqK4UkC7+kGrCIVG/y57DupUOYC3tzl5bwkCtHrgEBLtBADGO
	 4HLiekFtBBaZcKSn2rgTpPv2LWXxHcvUkJi+/uBH2xGXR9KHgecsPn2sgbkHjXl5fs
	 lBvHQIXCq4gX5Ob8pN63LCEikgMBiGSohT57xja7QivSATvsHeBEHoHWp7Hps4z2ee
	 uGGJdEWWIRJ9FeGXq1cSklfKq05SeLy58kEd/qOsTmcPcGZ4ZVO+eT+tE5UC7xhlrr
	 XdKrEfF4FKjw2r7C89o09XzViV6REAx3jK773Lh0WBYM0LariNDpVfpC0zQrcsQOt3
	 G70ndQRar03zA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 2/3] iio: osf: add Open Sensor Fusion UART IIO
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jinseob Kim" <kimjinseob88@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260520072843.3593-3-kimjinseob88@gmail.com>
References: <20260520072843.3593-3-kimjinseob88@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 May 2026 08:04:58 +0000
Message-Id: <20260520080458.67DAC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] The IIO channels are declared as little-endian (IIO_LE), but the d=
river pushes CPU-native endian data to the IIO kfifo buffer.
- [High] The driver pushes unpacked channel data into the IIO buffer but fa=
ils to set `available_scan_masks`, causing incorrect data demuxing and time=
stamp overwriting when a subset of channels is active.
- [Medium] Unbounded memory leak via `devm_` allocations in the error path =
of dynamic IIO device registration, triggered by repeated capability report=
s.
- [Medium] The driver hardcodes `ktime_get_ns()` for sample timestamps, bre=
aking the IIO subsystem's clock selection mechanism.
--

commit 07b7754f2b44c1840fd85c5de6bb124482d998fd
Author: Jinseob Kim <kimjinseob88@gmail.com>

iio: osf: add Open Sensor Fusion UART IIO driver

Add the initial Open Sensor Fusion UART IIO driver. This includes the
protocol v0 parser, OSF0 stream assembler, core capability/sample cache,
serdev UART transport, IIO read_raw path, and software kfifo buffer support.

> diff --git a/drivers/iio/opensensorfusion/osf_core.c b/drivers/iio/opense=
nsorfusion/osf_core.c
> new file mode 100644
> index 0000000000000..fd2eccefc47d6
> --- /dev/null
> +++ b/drivers/iio/opensensorfusion/osf_core.c
> @@ -0,0 +1,334 @@

[ ... ]

> +static int osf_core_handle_sensor_sample(struct osf_device *osf,
> +					 const struct osf_frame *frame)
> +{

[ ... ]

> +	event.sensor_type =3D sample.sensor_type;
> +	event.sensor_index =3D sample.sensor_index;
> +	event.channel_count =3D sample.channel_count;
> +	event.sample_format =3D sample.sample_format;
> +	event.scale_nano =3D sample.scale_nano;
> +	event.sequence =3D frame->sequence;
> +	event.timestamp_us =3D frame->timestamp_us;
> +	event.host_timestamp_ns =3D ktime_get_ns();

[Severity: Medium]
Does this hardcode the timestamp clock to CLOCK_MONOTONIC?=20

The IIO subsystem supports user-configurable clocks via the
current_timestamp_clock sysfs attribute. Should this use iio_get_time_ns()
instead to honor the user's clock selection?

> +	for (i =3D 0; i < sample.channel_count; i++)
> +		event.values[i] =3D values[i];

[ ... ]

> diff --git a/drivers/iio/opensensorfusion/osf_iio.c b/drivers/iio/opensen=
sorfusion/osf_iio.c
> new file mode 100644
> index 0000000000000..3d2674e43fbb0
> --- /dev/null
> +++ b/drivers/iio/opensensorfusion/osf_iio.c
> @@ -0,0 +1,268 @@

[ ... ]

> +#define OSF_SCAN_TYPE_S32						\
> +	{								\
> +		.sign =3D 's',						\
> +		.realbits =3D 32,					\
> +		.storagebits =3D 32,					\
> +		.endianness =3D IIO_LE,					\
> +	}

[ ... ]

> +int osf_iio_push_sample(struct iio_dev *indio_dev,
> +			const struct osf_sample_event *event)
> +{
> +	struct osf_iio_state *state;
> +	u8 scan[OSF_IIO_SCAN_BYTES] __aligned(8) =3D { };
> +	s32 *scan_values =3D (s32 *)scan;
> +	unsigned int i;

[ ... ]

> +	for (i =3D 0; i < event->channel_count; i++)
> +		scan_values[i] =3D event->values[i];
> +
> +	return iio_push_to_buffers_with_timestamp(indio_dev, scan,
> +						  event->host_timestamp_ns);

[Severity: High]
Does this code push CPU-native endian data to the IIO buffer?

The channels are declared as IIO_LE, so userspace on big-endian architectur=
es
will byte-swap this data again. Should the values be converted back using
cpu_to_le32(), or should the channel be declared as IIO_CPU?

> +}
> +
> +int osf_iio_register_sensor(struct device *dev,
> +			    const struct osf_capability_entry *entry,
> +			    void *driver_data, struct iio_dev **indio_dev)
> +{

[ ... ]

> +	iio_dev->name =3D spec->name;
> +	iio_dev->info =3D &osf_iio_info;
> +	iio_dev->modes =3D INDIO_DIRECT_MODE | INDIO_BUFFER_SOFTWARE;
> +	iio_dev->channels =3D spec->channels;
> +	iio_dev->num_channels =3D spec->num_channels;

[Severity: High]
Does this code omit setting available_scan_masks while pushing unpacked data
into the buffer?

If userspace enables only a subset of channels, the IIO core will expect the
data to be tightly packed. The dynamic timestamp placement by
iio_push_to_buffers_with_timestamp() could then overwrite active channel
data. Providing available_scan_masks would enable the software demuxing
fallback to correct the data alignment.

> +
> +	ret =3D devm_iio_kfifo_buffer_setup(dev, iio_dev, NULL);

[ ... ]

> diff --git a/drivers/iio/opensensorfusion/osf_serdev.c b/drivers/iio/open=
sensorfusion/osf_serdev.c
> new file mode 100644
> index 0000000000000..1827760c27f24
> --- /dev/null
> +++ b/drivers/iio/opensensorfusion/osf_serdev.c
> @@ -0,0 +1,354 @@

[ ... ]

> +static int osf_serdev_register_iio(struct osf_serdev *osf_uart,
> +				   const struct osf_capability_entry *entry)
> +{
> +	struct device *dev =3D &osf_uart->serdev->dev;
> +	struct iio_dev *indio_dev;
> +	int ret;

[ ... ]

> +	ret =3D osf_iio_register_sensor(dev, entry, &osf_uart->osf, &indio_dev);
> +	if (ret)
> +		return ret;

[Severity: Medium]
Does this error path leak the devm_ allocated resources if device
registration fails?

Since the sensor isn't added to the iio array on failure, a new capability
report with a different sequence number will trigger registration again. Th=
is
could potentially lead to an unbounded memory leak until out-of-memory.

Should this explicitly free the devm_ resources on failure?

> +
> +	osf_uart->iio[osf_uart->iio_count].sensor_type =3D entry->sensor_type;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260520072843.3593=
-1-kimjinseob88@gmail.com?part=3D2
