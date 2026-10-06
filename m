Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 823C83B71B3
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 18:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791311537; cv=none; b=hEoZFUKohyKq73f9zBkmNIMozmTaytYgr9mzXNUHKRcxc2IWCjyadicnkpkZduzVLso6p7dyB7/HmukDUN8NoMDihPW7mRAlm9NpW1KY7JUogj2Qc/iyPZZ0UtiWJ7YHnZ9D4erGELPvntY8LeRvlJQaS1k00ss+R3gO2XoH070=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791311537; c=relaxed/simple;
	bh=8u0mYzXm0X4b2+qY76JPr29CiW2GO6I9N+cl1wViLlI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=au5CmYSOYS0vfAZ+tf5wWMZc80f46lx3JM9rzNDZgzH06PKq5JLkKqWYFX5RAD1tVyOI2tOr8JSIqIhQhNfBHOQgEe9Hj6TRSRey8NnIzg+scwgT6nqblZOublu3OsP57pgV6chdeRNzw6dluksjfKO02f7xuSxvbGJBaJzuXTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oJufd4zG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oJufd4zG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFD0F1F0089B;
	Tue,  6 Oct 2026 18:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791311536;
	bh=eVD3ENqbmGpnULCK0JeOdYoMvzMkoRn4BndBymV/vEw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oJufd4zGDt+6GXPQjbEdb4JC9zfw7YCdA5ceWRCzvq3JfKj4qXwlyLzSk8HsSGu0O
	 n2/BTc4drzx6GJY1FoAuQ2x1f608C6MzuGKa+MMJFrMfQ9SjRfn9NtQV2ICIk+TcvZ
	 StbqNKDYN7anZ8y3jHsHDTaj/Dhx66eRSzC0G5i5J9hZoZw8ur9yoaNjaZGBmrVt16
	 HJEYhhq/PJoezo62FGeFLHSurBe9jBasQ9GXN7u/PQZ3e5wK/RXN68ItnxwcHoXdH7
	 l5sCJ8uo5FpAbaFOo4gvHyU9MKCJf+7WPkQasnV7A4WeAJT+v8OT2tg8hWl/rbnSq2
	 qJ8hdRnD+wKGw==
Message-ID: <sashiko-outbox-162347@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 09/13] dt-bindings: iio: adc: adi,ad4134: Document
 external multiplexer usage
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marcelo Schmitt" <marcelo.schmitt@analog.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <14fe942a44bb0dd67eb9e25e533572e5cbe32b87.1791309733.git.marcelo.schmitt@analog.com>
References: <cover.1791309733.git.marcelo.schmitt@analog.com>
 <14fe942a44bb0dd67eb9e25e533572e5cbe32b87.1791309733.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 06 Oct 2026 18:32:15 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] iio: redundant use of sync_lock mutex
--

commit c725b04fb026c820b0d14c82b9c9ef92e634640f
Author: Marcelo Schmitt <marcelo.schmitt@analog.com>

iio: adc: ad4134: Support buffered data read

Enable users to run buffered data captures triggered by IIO trigger device.
Add an IIO timestamp channel so each data scan is provided with measurement
time information. Require single-read operations to be in IIO device direct
access mode to prevent buffered and single-shot data captures to disrupt
each other.

> diff --git a/drivers/iio/adc/ad4134.c b/drivers/iio/adc/ad4134.c
> index 3048e61a3cb13..b5207f16054e4 100644
> --- a/drivers/iio/adc/ad4134.c
> +++ b/drivers/iio/adc/ad4134.c

[ ... ]

> @@ -342,6 +391,10 @@ static int ad4134_read_raw(struct iio_dev *indio_dev,
> =20
>  	switch (info) {
>  	case IIO_CHAN_INFO_RAW: {
> +		IIO_DEV_ACQUIRE_DIRECT_MODE(indio_dev, claim);
> +		if (IIO_DEV_ACQUIRE_FAILED(claim))
> +			return -EBUSY;
> +
>  		guard(mutex)(&st->sync_lock);

[Severity: Low]
Is the st->sync_lock mutex still needed here?

Because the IIO direct mode macro inherently acquires the global
indio_dev->mlock, it already serializes callbacks like ad4134_read_raw(),
ad4134_write_raw(), and ad4134_set_filter_type() against each other, and
prevents execution while the buffer is active.

Since st->sync_lock is always acquired immediately after successfully calli=
ng
IIO_DEV_ACQUIRE_DIRECT_MODE(indio_dev, claim) in these locations, it doesn't
seem to provide any additional synchronization.

Could st->sync_lock be removed to reduce locking overhead and complexity?

> =20
>  		gpiod_set_value_cansleep(st->odr_gpio, 1);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1791309733.gi=
t.marcelo.schmitt@analog.com?part=3D9
