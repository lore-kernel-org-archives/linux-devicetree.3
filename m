Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7E737B007
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 10:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779705928; cv=none; b=mGjoMh7Lk8T3OW5nkUPROTIXbOLs71vHiNPLKIExUBKgORGAfVD1aVLRKVutbjqGyjmBGHXeDZUp2whR5Ke8DVC6uIkyFHfDw1cIxga8CBBeHxOktgf1LYiDGnvp0Uqoqm9J4qM2rJqm/xlR/vMDLxJJg7EkPuzJm+r5fGT709c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779705928; c=relaxed/simple;
	bh=Hu8rSWQsXEWFuan1OJLIO4Yk7s6zOViOKjlFTSiVBvQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PemLfX9pXqBKnYX1zyQPH861wrxC3aCIMeRd80l4mlllg4oyadtnN9wIbOM+gi3QFD4uWlJ4zufkiYTzJjnVUG8i5yTFseK+GtSeaExoayozHObawDWA4c5RKBFomttbnWTCVMosgEycD0GdCbB55VUc1A58prpbec+JyfzU1o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i9//dtoO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i9//dtoO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A4841F000E9;
	Mon, 25 May 2026 10:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779705927;
	bh=+/7tE9gV6iYSB5VZb4r/ZYI02isQn45grl8+ZM3I50M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=i9//dtoOqrsGr7cy7vveIV7kyJ8GM7wWlazJseohhCKM62H6ZGbewfntR4bWQGqrs
	 pXVO+atExFxKbXAI0yVCTf5DHHoGRtpmtDwUwuvHhfHIImeszBEt/a2ewg8EMkzyqK
	 RL7+DzDngqZIphbvWqgLePVHIKoMh8rauzpHj2XSkALR/s1j3Yw25gdS92mMGNXLD0
	 2MsTvdb3rBHGRBXUMYDOVym0bom68CG5q81wYQbdnUVmfGxJmbu526hz9W5pdY1jdH
	 kT3iNCm6vCYTsvT4Q3cAPyzLCEBvA/cqb5siEOuPheBUUhVoF1qKLxuY95ydVL85vi
	 Lcrl59v3X/dCQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 2/6] iio: adc: ad4691: add initial driver for AD4691
 family
Reply-To: sashiko-reviews@lists.linux.dev
To: "Radu Sabau via B4 Relay" <devnull+radu.sabau.analog.com@kernel.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260525-ad4692-multichannel-sar-adc-driver-v13-2-1b7626d3b35c@analog.com>
References: <20260525-ad4692-multichannel-sar-adc-driver-v13-2-1b7626d3b35c@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 10:45:26 +0000
Message-Id: <20260525104527.2A4841F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] Meaningful code and commit message mismatch regarding reset sequ=
ence.
- [Medium] Regmap cache is not updated for the lower bytes of 16-bit regist=
ers written via SPI auto-decrement, leading to stale cache reads.
- [Medium] AD4691_STATE_RESET_REG is a self-clearing command register but i=
s not marked as volatile, causing it to be incorrectly cached.
--

commit 5d0c7a2b74dca7a38834216ccda12567a51d63dd
Author: Radu Sabau <radu.sabau@analog.com>

iio: adc: ad4691: add initial driver for AD4691 family

This commit adds initial driver support for the Analog Devices AD4691
family of multichannel SAR ADCs.

>     Three voltage supply domains are managed: avdd (required), vio, and a
>     reference supply on either the REF pin (ref-supply, external buffer)
>     or the REFIN pin (refin-supply, uses the on-chip reference buffer;
>     REFBUF_EN is set accordingly). Hardware reset is performed by asserti=
ng
>     the reset-gpios GPIO line for at least 300 =C2=B5s then deasserting i=
t;

[Severity: Medium]
The commit message states that the hardware reset is performed by asserting
the reset line for at least 300 =C2=B5s before deasserting it, but the code=
 in
ad4691_reset() asserts, immediately deasserts, and then waits 300 =C2=B5s. =
Is
this description accurate?

> diff --git a/drivers/iio/adc/ad4691.c b/drivers/iio/adc/ad4691.c
> new file mode 100644
> index 0000000000000..cc1e2ef6bfd8b
> --- /dev/null
> +++ b/drivers/iio/adc/ad4691.c

[ ... ]

> +static bool ad4691_volatile_reg(struct device *dev, unsigned int reg)
> +{
> +	switch (reg) {
> +	case AD4691_STATUS_REG:
> +	case AD4691_CLAMP_STATUS1_REG:
> +	case AD4691_CLAMP_STATUS2_REG:
> +	case AD4691_GPIO_READ:
> +	case AD4691_ACC_STATUS_FULL1_REG ... AD4691_ACC_STATUS_SAT2_REG:
> +	case AD4691_ACC_SAT_OVR_REG(0) ... AD4691_ACC_SAT_OVR_REG(15):
> +		return true;

[Severity: Medium]
Does AD4691_STATE_RESET_REG need to be marked as volatile here?

It is used as a self-clearing command register in ad4691_single_shot_read(),
so caching it might return a stale '1' on reads and potentially trigger
spurious resets if the cache is ever synced.

[ ... ]

> +static int ad4691_single_shot_read(struct iio_dev *indio_dev,
> +				   struct iio_chan_spec const *chan, int *val)
> +{
[ ... ]
> +	ret =3D regmap_write(st->regmap, AD4691_STD_SEQ_CONFIG,
> +			   BIT(chan->channel));
> +	if (ret)
> +		return ret;
> +
> +	ret =3D regmap_write(st->regmap, AD4691_ACC_MASK_REG,
> +			   ~BIT(chan->channel) & GENMASK(15, 0));

[Severity: Medium]
Since AD4691_ACC_MASK_REG and AD4691_STD_SEQ_CONFIG use an ADDR_DESCENDING
SPI write where the hardware auto-decrements the address for the second byt=
e,
will the regmap cache for the lower address (e.g., 0x184 for the mask) rema=
in
stale because regmap_write() only updates the cache for the base address?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260525-ad4692-mul=
tichannel-sar-adc-driver-v13-0-1b7626d3b35c@analog.com?part=3D2
