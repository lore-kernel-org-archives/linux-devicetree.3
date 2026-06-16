Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04AC83FE65F
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 07:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781595533; cv=none; b=V7OgnhQjkZ5Ue0qa6imuSzQgrayS7lY7XqENwiCaUMHWeVYx2uGyaS9AB7IeSturbuYIhq46C/s5wVmKN1IVbM0a6ACjLTCvDhOgqr/3vpl/r5X6Lrjo+HQIdmGmcOwLGaNVI9QWVFt4AyIbuwWk1YRf6mVlSLXS2oIJfn+3uUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781595533; c=relaxed/simple;
	bh=LuMdnQMHhj1haeud7J07Z0F2RlF254gF6Rq9xIwhmfQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oGRjpihdqKippMWrJwtkB85d++ddvD4E0aPsf3jIEQHLo2Hs1Hx+5Z4uARxPfLnsIcU2aIJs7iRpNLUOSxPLCj1fa4O/Z/Dp2MHjkWaYJLf7sOeqCMmKHF5X5o31ltGaVPoLA0en2+2V5uLxQlqmxXApiBgXitZAZVxg3sD5FOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aYDt6Sk5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aYDt6Sk5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DAA91F00A3A;
	Tue, 16 Jun 2026 07:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781595531;
	bh=Cp/nlC+2RuS25I0AvyfOXm0M72FCHhNxFdLx9FTdqGc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aYDt6Sk5h3rxy7YOWPvIYip3cR1uy1WBK64ndZxqWvKXHYMriMSZTRfLqHKh4JiEn
	 aKA8IEsfJtJQ0zyuLVYzHyLuOdp2wJE9hyhyOgmaFKCc6TpRI3DKP6cXlNvc0qzs/W
	 Nn98CbJSoisPlHXlPR8B/upAZv1C8HVNxZIGZyeG5iclqojF0L22rYbpf8UabzkF8B
	 7tgz4Dab3A59PXKPPqGwhQcZc00MPCYnh70+0IUuHU1psfE81pPl9PjValjaNW7B7A
	 ZDnNK7E1Uqgw/oi6EldXf4C8waV30gPk43S64494cVa3GDw+PLYgIzKvv3dUhpC318
	 2M14Fnnq9T2Gg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v5 6/6] iio: osf: register IIO devices from
 capabilities
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jinseob Kim" <kimjinseob88@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260616072242.3942-7-kimjinseob88@gmail.com>
References: <20260616072242.3942-7-kimjinseob88@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2026 07:38:50 +0000
Message-Id: <20260616073851.5DAA91F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Missing synchronization between asynchronous IIO buffer push and b=
uffer enable/disable operations, leading to list corruption.
- [High] Uninitialized padding bytes in the IIO bounce buffer leak kernel h=
eap memory to user-space.
--

commit e42cf74aa62314d9b92e389435a75cfcd58b0820
Author: Jinseob Kim <kimjinseob88@gmail.com>

iio: osf: register IIO devices from capabilities

Register IIO devices for supported Open Sensor Fusion capability entries
and push received samples into IIO buffers when enabled.

> diff --git a/drivers/iio/opensensorfusion/osf_iio.c b/drivers/iio/opensen=
sorfusion/osf_iio.c
> new file mode 100644
> index 0000000000000..862a797f4fb84
> --- /dev/null
> +++ b/drivers/iio/opensensorfusion/osf_iio.c

[ ... ]

> +int osf_iio_push_sample(struct iio_dev *indio_dev, const s32 *values,
> +			unsigned int channel_count)
> +{
> +	struct osf_iio_state *state =3D iio_priv(indio_dev);
> +	s64 timestamp;
> +
> +	if (channel_count !=3D state->spec->channel_count)
> +		return -EPROTO;
> +
> +	/* This is only a fast path; IIO rechecks buffer state while pushing. */
> +	if (!iio_buffer_enabled(indio_dev))

[Severity: High]
Is there a race condition between this asynchronous IIO buffer push and
buffer enable/disable operations?

The IIO core's iio_push_to_buffers() function iterates over the buffer_list
without locks, expecting the driver to guarantee no pushes occur concurrent=
ly
with buffer state changes.=20

Since this driver doesn't implement IIO setup_ops (like predisable) to stop
incoming frames, or use a software lock, could a concurrent write to the
sysfs enable attribute invoke iio_disable_buffers() and modify the
buffer_list while the UART RX path is traversing it, causing list corruptio=
n?

> +		return 0;
> +
> +	timestamp =3D iio_get_time_ns(indio_dev);
> +
> +	return iio_push_to_buffers_with_ts_unaligned(indio_dev, values,
> +						     channel_count * sizeof(*values),
> +						     timestamp);

[Severity: High]
Does this leak uninitialized kernel heap memory to user-space through the
bounce buffer padding?

The data payload size passed here is exactly the size of the channels
without padding. The IIO core computes scan_bytes to include padding for the
64-bit timestamp to ensure alignment, and allocates the internal bounce
buffer using devm_krealloc() without the __GFP_ZERO flag.

Because the IIO core only copies the exact data payload size and inserts the
timestamp at the aligned offset, it leaves the intermediate padding bytes
completely uninitialized. When this bounce buffer is pushed into the KFIFO,
will it leak uninitialized memory with every sample?

Would it be safer to assemble the sample in a zero-initialized padded struct
on the stack and use iio_push_to_buffers_with_timestamp() instead?

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260616072242.3942=
-1-kimjinseob88@gmail.com?part=3D6
