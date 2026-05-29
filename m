Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38BB22472AF
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 14:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780065394; cv=none; b=steCzgp+JhRHCB7kzCm5KDtUdATnHW7FURRWc7jgj5iVb4td5IIkrbl5cxnsnjSHjDBk7YWTo6G2fih9eELENE3QnuxCiBRXgvQid2oT4d4ZIobfgw+icUO6Fj5SE0D2X1iOmaeeLH2c4ttxhO7NZfz0l4PC+cAX+/VstEOiqag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780065394; c=relaxed/simple;
	bh=z74N0pFagtP6RQ6H4YaH8/GA6tRexv6havmalby5zJo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pIoDNAGwobRQFBXrKPOM6MWTXTAU4HVrsVNtPow140JhlhxiCTzJe/cuqM/erKvjxdm6TvRX4LIL5BI0WQuwyThU1FNetZ9RD31nSO0F81TEtt9BnAEcHeM51r4D/Uuj8IH1aNiD17d5P0cVYdPEfnOKSJBK23KigYhqx1wmCfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IKSlYlyq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IKSlYlyq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA5671F00893;
	Fri, 29 May 2026 14:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780065392;
	bh=hblTrsrfduhGMwYJES2rGelYn5tVRJG/WVfXM6ll7MA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IKSlYlyqkV1D2Ek5IlR+C/0fWyDxzQVLb8VRef/M7ecx2j7bF0U4QkhoQ0KbJUptj
	 cafL0WCwQSXPb91qTzINodgTEcKMePNw7KK3Dj62fiH9AxkM3T5JGSa3mALPxoHXBb
	 5L+eaupm/rJ+5/NfZWPfmm3EuUyd6QIYosaMZ5rY4dRQlwxwSEPeq0skZQVacL5/bX
	 QWBo+hkrNkzRAvamH3om601ygPFesOnmV1ne74ynZV1MM0fq9Tv4owW6UQPYhJTt2L
	 R4Y0rKOS8p57yL860/RTgY3VvZc3RYW1uHfIotRcRo2ZR4BsM0tap0ZyVsGyTRnzR6
	 p1uPm7SHXXAug==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v3 6/6] iio: osf: register IIO devices from
 capabilities
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jinseob Kim" <kimjinseob88@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260529121005.1470-7-kimjinseob88@gmail.com>
References: <20260529121005.1470-7-kimjinseob88@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 14:36:32 +0000
Message-Id: <20260529143632.AA5671F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Uninitialized kernel heap memory is leaked to userspace through II=
O buffer padding.
--

commit 9319c55b6b77ef9ce1f7e526e5ce9463c217bc27
Author: Jinseob Kim <kimjinseob88@gmail.com>

iio: osf: register IIO devices from capabilities
   =20
This commit updates the Open Sensor Fusion (OSF) driver to parse the first
capability report and create corresponding IIO devices. It also adds logic
to cache the latest samples and push enabled buffers directly to userspace.

> diff --git a/drivers/iio/opensensorfusion/osf_iio.c b/drivers/iio/opensen=
sorfusion/osf_iio.c
> new file mode 100644
> index 0000000000000..5e509987876d7
> --- /dev/null
> +++ b/drivers/iio/opensensorfusion/osf_iio.c
[ ... ]
> +int osf_iio_push_sample(struct iio_dev *indio_dev, const s32 *values,
> +			unsigned int channel_count)
> +{
> +	struct osf_iio_state *state =3D iio_priv(indio_dev);
> +	s32 scan[OSF_MAX_SAMPLE_CHANNELS] =3D { };
> +	s64 timestamp;
> +
> +	if (channel_count !=3D state->spec->channel_count)
> +		return -EPROTO;
> +
> +	memcpy(scan, values, channel_count * sizeof(*values));
> +
> +	/* Buffer state can change here; IIO rechecks it during the push path. =
*/
> +	if (!iio_buffer_enabled(indio_dev))
> +		return 0;
> +
> +	timestamp =3D iio_get_time_ns(indio_dev);
> +
> +	return iio_push_to_buffers_with_ts_unaligned(indio_dev, scan,
> +						     channel_count * sizeof(*scan),
> +						     timestamp);

[Severity: High]
Does this leak uninitialized kernel heap memory to userspace?

The driver passes channel_count * sizeof(*scan) as the data_sz, which
is 12 bytes for a 3-axis sensor or 4 bytes for temperature.

However, the IIO core calculates the buffer's scan_bytes to include padding
to 8-byte align the 64-bit timestamp. This results in a scan size of 24
bytes for a 3-axis sensor, or 16 bytes for temperature.

Looking at iio_push_to_buffers_with_ts_unaligned(), the bounce buffer is
allocated without zeroing the memory:

drivers/iio/industrialio-buffer.c:iio_push_to_buffers_with_ts_unaligned() {
	...
	if (iio_dev_opaque->bounce_buffer_size !=3D  indio_dev->scan_bytes) {
		void *bb;

		bb =3D devm_krealloc(&indio_dev->dev,
				   iio_dev_opaque->bounce_buffer,
				   indio_dev->scan_bytes, GFP_KERNEL);
		...
	}
	memcpy(iio_dev_opaque->bounce_buffer, data, data_sz);
	return iio_push_to_buffers_with_timestamp(indio_dev, ...);
}

It only copies data_sz bytes into the bounce buffer and then appends the
8-byte timestamp, leaving the intermediate padding bytes uninitialized.
When this buffer is pushed to the kfifo, the uninitialized kernel memory is
exposed to userspace.

Could we pass a correctly padded and zero-initialized structure, or provide
the exact size including padding up to the timestamp, to avoid leaking
these bytes?

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529121005.1470=
-1-kimjinseob88@gmail.com?part=3D6
