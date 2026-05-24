Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5239274B39
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 10:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779620249; cv=none; b=KPQR4covL+rpEMPzE74jamZ7PH/Ntm1/tFOa+kDHBMi5OQ0g8LhQU1Wr4mj0hU457KX/2W8Vgf/AgEUUWLLAqrAmUI5/qW84AOONmn0yAbLFthdWRhqirP9nFWWD3Q6wDjP0jYfZHxosB7nQ7elI0f5V2EA6erIak/h8SGDhrk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779620249; c=relaxed/simple;
	bh=qpwEfo8YjgB6oLSca0Cquih6PbsuhW8NRMvrwgO28CA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=j3Mjtyc9oDb0qi+72Zm4h01xF1/m/k8BlXnsJ3yqsdoo9NPX7FYvgesKbzrmHkRRtopgKqJvcIhY3t80uIN/1CVqrhw18YQcEuXt5gQfVYC4j5+dkPFsgkG8glGkseXqDMNqE15Mx+/CogoNuSfe7lVQmcvdpyD49eXsZXBQkm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mti/O02L; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mti/O02L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51FA81F000E9;
	Sun, 24 May 2026 10:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779620247;
	bh=VdYDIOjuP/nz5LyFa8skv3Hs4axtbRYZWDIap7zRFZ8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Mti/O02LNrKW7JdWFLjm99mqkS46xdHRGIPhqZ3UrluU9SplrWMDiB9H7kPl4Q5Lj
	 BCHh33HBhI1fGMzITrlomb6XkUnd/UI0s8aW3/f09Vs2y0u7PtCbMroUBoHUESAywn
	 N3krlVjGButiGaxp/svb57xfbSAEdgUZna8mowSIBGKFrHp/TBMIWl7COqcEVODbaV
	 eorj8kx344t/vwOBXaJ39nYAjP1ynXvDueJHqHIJdTKkVO0NE0V9ZFyAvJ0qlmREw9
	 3N3Ja8H6wo8I0QFG1HKWStnDW34g0NZCwxJ5DI1xMnYa5loKu9eCdVtG1hBBtN/sO5
	 Uxq4sddXQfQtw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v2 6/7] iio: osf: register IIO devices from
 capabilities
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jinseob Kim" <kimjinseob88@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260524085312.15369-7-kimjinseob88@gmail.com>
References: <20260524085312.15369-7-kimjinseob88@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 24 May 2026 10:57:26 +0000
Message-Id: <20260524105727.51FA81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The OPEN_SENSOR_FUSION Kconfig entry selects IIO_KFIFO_BUF without=
 satisfying its IIO_BUFFER dependency.
- [High] Uninitialized kernel heap memory is leaked to userspace via the II=
O buffer due to an unvalidated channel count.
- [High] Concurrent access to the shared `latest_samples` array without loc=
king or memory barriers.
--

commit 699c891149ed43c06353cf9d1622dbd226109bd7
Author: Jinseob Kim <kimjinseob88@gmail.com>

iio: osf: register IIO devices from capabilities

Register supported IIO devices from the first valid capability report.

> diff --git a/drivers/iio/opensensorfusion/Kconfig b/drivers/iio/opensenso=
rfusion/Kconfig
> index 360f25b4fe60b..004d2aa8ae10b 100644
> --- a/drivers/iio/opensensorfusion/Kconfig
> +++ b/drivers/iio/opensensorfusion/Kconfig
> @@ -5,11 +5,11 @@ config OPEN_SENSOR_FUSION
>  	depends on IIO
>  	depends on SERIAL_DEV_BUS
>  	select CRC32
> +	select IIO_KFIFO_BUF

[Severity: High]
Does this config also need to select or depend on IIO_BUFFER?

Since IIO_KFIFO_BUF is defined within an 'if IIO_BUFFER' block in the Kconf=
ig
hierarchy, selecting it without having IIO_BUFFER enabled can cause unmet
direct dependency warnings and build failures if core IIO buffer support is
disabled.

>  	help
> -	  Build the Open Sensor Fusion UART receive path.
[ ... ]
> diff --git a/drivers/iio/opensensorfusion/osf_core.c b/drivers/iio/opense=
nsorfusion/osf_core.c
> index c867b315865d2..a1e20ede9b149 100644
> --- a/drivers/iio/opensensorfusion/osf_core.c
> +++ b/drivers/iio/opensensorfusion/osf_core.c
[ ... ]
> +static int osf_core_handle_sensor_sample(struct osf_device *osf,
> +					 const struct osf_frame *frame)
>  {
> +	struct osf_latest_sample *latest;
[ ... ]
> +	latest->sensor_type =3D sample.sensor_type;
> +	latest->sensor_index =3D sample.sensor_index;
> +	latest->channel_count =3D sample.channel_count;
> +	latest->sample_format =3D sample.sample_format;
> +	latest->scale_nano =3D sample.scale_nano;
> +	latest->sequence =3D frame->sequence;
> +	latest->timestamp_us =3D frame->timestamp_us;
> +	latest->valid =3D true;

[Severity: High]
Can this array update cause data corruption for concurrent readers?

osf_core_handle_sensor_sample() updates the latest_samples array from the
serdev receive context, while osf_core_read_latest_sample() reads these
values from process context when userspace accesses sysfs attributes.

Since there is no synchronization like a mutex or seqlock protecting the
array, is it possible for readers to experience torn reads, partially
updated states, or see valid =3D=3D true before the payload data is fully
committed?

> +	osf->last_sequence =3D frame->sequence;
> +
> +	indio_dev =3D osf_core_find_iio_dev(osf, sample.sensor_type,
> +					  sample.sensor_index);
> +	if (indio_dev) {
> +		ret =3D osf_iio_push_sample(indio_dev, latest->values,
> +					  latest->channel_count);

[Severity: High]
Could this leak uninitialized kernel heap memory to userspace?

The channel_count is assigned directly from the incoming network frame. If a
frame arrives with a smaller channel_count than the sensor's expected
num_channels, calling osf_iio_push_sample() ->
iio_push_to_buffers_with_ts_unaligned() allocates a bounce buffer using
devm_krealloc(..., GFP_KERNEL) which does not zero memory.

It then copies only channel_count * sizeof(s32) bytes into it. The remaining
space in the bounce buffer would be left uninitialized before being pushed =
to
the kfifo, potentially exposing kernel heap memory to userspace readers.

> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260524085312.1536=
9-1-kimjinseob88@gmail.com?part=3D6
