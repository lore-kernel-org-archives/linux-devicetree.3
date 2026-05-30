Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E24219E8
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 04:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780115012; cv=none; b=o5QPBqXz0soIJ9mL2zZEG5Fp9gm0OaMPS8POAnaRrQ/3Usq3hrjGAbMWqw1XLvVEwqnUSVjaNVSh3W3aO8iPYq+O5ZT3ZhSdxYSrP/rYuFEQkdG2+454mgKxLjA8qVtSuIvpqsBAcBE5KVShg30lro7ZdmJGgw2nRYnTMu11sA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780115012; c=relaxed/simple;
	bh=58bmcrbrwxFjRpLBIFLqAODxXmWKkNj8lKb7C9c8FvA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lNUI879iygaN5Q+dB5R0UZPF7laFv7SoZ4OOIS+GTbxT0iCS5eSBWUNyPtXvQJzclwvSp7QOBwIjqBTFV5L6nSEqFtI9j24VAJJcbu63PPy4O6dozicMakGPBESuxmAEezkceH4jUTPHNrVfIEJEMDvCy0DjmRcje3NqwoYqY2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dHLEVI+0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dHLEVI+0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A0691F00893;
	Sat, 30 May 2026 04:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780115011;
	bh=WL5WPhhiI7/cJRP3NhTLlQbfiEehBWPKaUj86adtgVc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dHLEVI+07M2CSxHcCOT134d0Vq2chxn/Ti0YgAIeVjG3kQGIr4lRP5TPJgtP1HmZS
	 i39Y2s89YClotRk7GE7xeo4gPc8vIgGqTpPs/uLeYvtIkTrB1kuW8ya/iw3Ea8wveZ
	 UH+HZwk0oi7gGq6LMGbPx+A7IQOXZQ/987KkrDIaNVPp4Fh4MBQnRLhqTvLx20s1PM
	 f/K+ju1OIq4AgrQLNbNB6oEzzMKLl+kt0a0xH8iQ6jpXAdWDSTU7CkzyMw/sAaBMUl
	 ENQOJajOEoBIhJN4mGBQgxt0lKpitrOGATA3Ma1JIDTT0koq8mdyznc/aE/50CsK3c
	 5vsmh6nVXmo6g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V9 09/11] iio: imu: inv_icm42607: Add IRQ for icm42607
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260530031739.109063-10-macroalpha82@gmail.com>
References: <20260530031739.109063-10-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 04:23:30 +0000
Message-Id: <20260530042331.1A0691F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Double unlock of `st->lock` on the error path in `inv_icm42607_irq=
_handler()`.
- [High] The threaded interrupt handler will deadlock on the success path d=
ue to recursive locking of `st->lock`.
- [High] The shared `st->fifo` state is accessed and modified without adequ=
ate lock protection across the read-and-parse transaction.
- [Medium] Premature exposure of the IIO device to userspace before IRQ ini=
tialization is complete.
--

commit a6721434d04928fac24f103459562cfa31a2c977
Author: Chris Morgan <macromorgan@hotmail.com>

iio: imu: inv_icm42607: Add IRQ for icm42607
   =20
Add IRQ support for the icm42607 driver.

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c b/drivers/i=
io/imu/inv_icm42607/inv_icm42607_core.c
> index 6b623fb679f34..3c91623dffb29 100644
> --- a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c
[ ... ]
> @@ -331,6 +331,91 @@ static int inv_icm42607_setup(struct inv_icm42607_st=
ate *st,
[ ... ]
> +static irqreturn_t inv_icm42607_irq_handler(int irq, void *_data)
> +{
> +	struct inv_icm42607_state *st =3D _data;
> +	struct device *dev =3D regmap_get_device(st->map);
> +	unsigned int status;
> +	int ret;
> +
> +	mutex_lock(&st->lock);
> +
> +	ret =3D regmap_read(st->map, INV_ICM42607_REG_INT_STATUS, &status);
> +	if (ret) {
> +		dev_err(dev, "Interrut status read error %d\n", ret);
> +		goto out_unlock;
> +	}
> +
> +	if (status & INV_ICM42607_INT_STATUS_FIFO_FULL)
> +		dev_warn(dev, "FIFO full data lost!\n");
> +
> +	if (status & INV_ICM42607_INT_STATUS_FIFO_THS) {
> +		mutex_unlock(&st->lock);
> +		ret =3D inv_icm42607_buffer_fifo_read(st, 0);
> +		if (ret) {
> +			dev_err(dev, "FIFO read error %d\n", ret);
> +			goto out_unlock;

[Severity: High]
If inv_icm42607_buffer_fifo_read() fails here, the code jumps to out_unlock
while st->lock is already unlocked. Will this cause a double unlock of the
mutex at the out_unlock label?

> +		}
> +
> +		mutex_lock(&st->lock);

[Severity: High]
Will dropping the lock between the read and parse operations expose a race
window?

If a concurrent call to inv_icm42607_buffer_hwfifo_flush() interleaves duri=
ng
this unlocked window, it could issue another read and overwrite the contents
of st->fifo.data and the sample counts. When the interrupt handler regains
the lock and calls inv_icm42607_buffer_fifo_parse(), it might parse the
overwritten data instead of the data it originally read.

> +		ret =3D inv_icm42607_buffer_fifo_parse(st);

[Severity: High]
Can this cause a deadlock on the success path?

inv_icm42607_buffer_fifo_parse() eventually delegates to
inv_icm42607_accel_parse_fifo(), which uses guard(mutex)(&st->lock) to
acquire the exact same lock. Since the lock is already acquired here, won't
this result in recursive locking?

> +		if (ret)
> +			dev_err(dev, "FIFO parsing error %d\n", ret);
> +	}
> +
> +out_unlock:
> +	mutex_unlock(&st->lock);

[Severity: High]
As mentioned above, if we jump here after failing
inv_icm42607_buffer_fifo_read(), the lock is already unlocked, causing a
double unlock error.

> +	return IRQ_HANDLED;
> +}
[ ... ]
> @@ -433,6 +523,11 @@ int inv_icm42607_core_probe(struct regmap *regmap,
>  	if (IS_ERR(st->indio_accel))
>  		return PTR_ERR(st->indio_accel);
> =20
> +	/* Initialize interrupt handling */
> +	ret =3D inv_icm42607_irq_init(st, irq, irq_type, open_drain);

[Severity: Medium]
Is it safe to initialize the interrupt handling after registering the IIO
device?

inv_icm42607_accel_init() registers the device, exposing it to userspace. If
userspace opens the device and attempts to interact with it before the
interrupt is configured, or if inv_icm42607_irq_init() fails causing devres
cleanup, could this lead to issues with an actively exposed device?

> +	if (ret)
> +		return ret;
> +
>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260530031739.1090=
63-1-macroalpha82@gmail.com?part=3D9
