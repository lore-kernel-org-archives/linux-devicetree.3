Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B16363C63
	for <devicetree@vger.kernel.org>; Sun,  6 Sep 2026 20:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788725820; cv=none; b=NAh+70v0pfVFFLKC12scekZykWXOdfD7X+YVbwd9AIQlvxXhg1VeD3Nh0L2gQ+BmTtUvsAEOAG+A1ndfu4THsEJtFtfj4r8bho/qoFhk76/Jj26ptwYvGBkUlUN9wH00qipks97Gv9V1A6lg6MUW7pfvswNkJALcLmWW54QmkM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788725820; c=relaxed/simple;
	bh=EgiEc88wDMuwQI8RaErS8IZLrV1n34S1ystE/a9qaK0=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:Mime-Version:
	 References:In-Reply-To; b=Rz+U7ZcRY23GcM4gJMRki066i1wxucVute3bXVyZ+bUIbbYoQzpnoFqCS35QwAJFWnX2LMxbyuNgzmyFxTTJ4ySxHpxw9zjn+hZcLSZ6Gk1b2s1QqeosJCUWXLTKnZTIzueq+M6K9QnFtLQFYhpcOm8E1AY7r8bOGGfs7JRJREo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dvHcKiAS; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dvHcKiAS"
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5c79c9f7b54so1456389e0c.3
        for <devicetree@vger.kernel.org>; Sun, 06 Sep 2026 13:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788725817; x=1789330617; darn=vger.kernel.org;
        h=in-reply-to:references:content-transfer-encoding:mime-version:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=peVlo5midIsHLppkaegcNy/jZCMNrNbiCq0SLwEov68=;
        b=dvHcKiASRysz0+LRrkUqwExzst2OcZWgLT8Mv/aX2tuAsy+P6nLPGM4qiA7nYzYgK3
         PoCHqJqY7wTxeirGgWlt7e6t785lzS1Thru0n0/Zh/BFFfEAmlB5TWXlHxuCF7GeJ6dv
         A12o71A1pzsgeENIU+KK0058vfi+H7rE8c6r9xRyMdiKlHPeInVtIUQHz2bgtMpSr5TM
         qmhIWFzkHpeICFtpgE8flsr8vHHVpcUhGOxD+al9OAK174aYkFbY8bY0he234bevSpV+
         D+7BaYfk1tX/MPvKgSOTn0l0c8qJH5pVRbiNmz7rv2JnkeD1NEiHs54CcDxkZvO4UmDI
         ZFXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788725817; x=1789330617;
        h=in-reply-to:references:content-transfer-encoding:mime-version:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=peVlo5midIsHLppkaegcNy/jZCMNrNbiCq0SLwEov68=;
        b=pmcynLvpVDo5Y3uSk0qWmfCmsF1tzZp7wlipcLTj9dLc52R7iFpM9thCbLGRieJR4d
         LkTwDNAxKT5V8tPY/5yd7a0EG4GJ82IfkiDCHsoKYAkLsbBz+32TOTSPQ9TUNFu11u6H
         BNksGsA+um16jHARuE1B27zIyPaJ2aBjBAYZ/+KrW5EpzrkO+k/Fi+9gcnxCzgPN7J/V
         +3mREHE7sfzjNRVJskMJfYHHQaHBFUi5zfBujEJ/2yT/YwzZxirKeCVTj9o45D1fOwuB
         NX1wp+gnrzlwmTpvn5piC8rIoSBhXDZBUHPf1bX7KMZ54tCIsL7wROFtWgiXU2EAoLQx
         LYWg==
X-Forwarded-Encrypted: i=1; AKwUvBzzdFJPa0EyIQVh0c6PGsQK0of/1ddpv1QlAXCcyNqKXCuv7ptaQXmMCLYT8z98y9j5hPkW6lNihlTZ@vger.kernel.org
X-Gm-Message-State: AFuF++lTHuHFv5w1jpI6FIgDwQ1db+WShn9VS35is8CW5ATKp6HwOcc3
	iXTVxzNSzt/FYXP9aIc/4T48VDi2/HJWA9l4kYzqfMVh5YRyUkWdHRur
X-Gm-Gg: AYBFou1C8CRJSTDCrfsPjAOKt5xr49pa3nXgvyTadsvTMpLobKZE/AoIdGP7i69W+jf
	2bUmjtOLt/6UCz6LKAqTsmyvce6qG5/vLGwvMUWjG6V6UfXvu+h4FllCqKZmegAhHvmGOdXNoGF
	XZLuEHCj1QcIOce1Ou7jYi17Z53sFye4Kf4eQn94vblCBzkN9txpJq/igMYiLrHSgS4BxiLZfTy
	BBFMTJfGnpxoXLvQGRf8O+qehlukkCoBhwUhzVdz233lk0c1c2JM98cmFboC94WoIeACK0L2bsZ
	Q3eS3XOsuyosKCAk6egDHmq14O9K+mAwWhanj19Eh93SYbBdlja2YT6PURcsf1mWtY+OW+TBp1N
	GK3jbkU251toVRRiVCQoWHokcA3dRc3y8xzObGVHCD8QgZMLKJKSk57VLMDDbVc2EbiUenQEICd
	ELk8GAGkEAUuxs+3Twxqq+6VuJ6GJooy3s1Ab9HpaJ3garf6Mm7Q==
X-Received: by 2002:a05:6122:1785:b0:5bd:c27a:dafd with SMTP id 71dfb90a1353d-5c7ed3b1b2cmr7897263e0c.3.1788725817587;
        Sun, 06 Sep 2026 13:16:57 -0700 (PDT)
Received: from localhost ([2800:40:44:f1f5:f400:4c49:91c1:9905])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec1097f4sm6699138e0c.1.2026.09.06.13.16.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Sep 2026 13:16:57 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Sun, 06 Sep 2026 17:16:54 -0300
Message-Id: <DL8IDQUWAFJL.5RNMP0YKWW9@gmail.com>
Cc: "Kurt Borja" <kuurtb@gmail.com>, <conor+dt@kernel.org>,
 <robh@kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH v4 03/10] iio: adc: add the ti-ads1262 driver
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Jonathan Cameron" <jic23@kernel.org>, <sashiko-reviews@lists.linux.dev>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260828-ads126x-v4-0-1dc27e9c0260@gmail.com>
 <20260828-ads126x-v4-3-1dc27e9c0260@gmail.com>
 <20260828065211.C05B11F00A3F@smtp.kernel.org>
 <178805537532.2788519.12150005140246669583.b4-reply@b4>
In-Reply-To: <178805537532.2788519.12150005140246669583.b4-reply@b4>

On Sat Aug 29, 2026 at 11:02 PM -03, Jonathan Cameron wrote:
>> commit 6093db1ff45e9e897720bc6b278550ffbef67e85
>> Author: Kurt Borja <kuurtb@gmail.com>
>>=20
>> iio: adc: add the ti-ads1262 driver
>>=20
>> Add the ti-ads1262 driver with initial support for the primary ADC (ADC1=
).
>> Various features such as accurate timeout delays, per-channel reference
>> sources, scale, offset, and diagnostics are intentionally left out for
>> future support.
>
> One particularly interesting point from sashiko about regmap debugfs.
>
>>=20
>> > diff --git a/drivers/iio/adc/ti-ads1262.c b/drivers/iio/adc/ti-ads1262=
.c
>> > new file mode 100644
>> > --- /dev/null
>> > +++ b/drivers/iio/adc/ti-ads1262.c
>>=20
>
>> > +static int ads1262_channel_read(struct iio_dev *indio_dev,
>> > +				const struct iio_chan_spec *spec, __be32 *val)
>> > +{
>> > +	struct ads1262 *st =3D iio_priv(indio_dev);
>> > +	int ret;
>> > +
>> > +	IIO_DEV_ACQUIRE_DIRECT_MODE(indio_dev, claim);
>> > +	if (IIO_DEV_ACQUIRE_FAILED(claim))
>> > +		return -EBUSY;
>> > +
>> > +	ret =3D ads1262_set_runmode(st, ADS1262_RUNMODE_PULSE);
>> > +	if (ret)
>> > +		return ret;
>> > +
>> > +	ret =3D ads1262_channel_enable(st, spec);
>> > +	if (ret)
>> > +		return ret;
>> > +
>> > +	reinit_completion(&st->drdy);
>> > +
>> > +	ret =3D ads1262_dev_start_one(st);
>> > +	if (ret)
>> > +		return ret;
>> > +
>> > +	ret =3D ads1262_wait_for_conversion(st);
>> > +	if (ret)
>> > +		return ret;
>>=20
>> [Severity: Medium]
>> Does this error path leave the hardware running if the wait is interrupt=
ed?
>>=20
>> If ads1262_wait_for_conversion() returns an error (like -ERESTARTSYS fro=
m
>> a signal), the driver exits immediately without stopping the hardware. I=
f a
>> subsequent read calls reinit_completion(&st->drdy), but the abandoned
>> hardware conversion finishes and asserts the DRDY interrupt right after,
>> could the new read prematurely fetch stale data from the old conversion?
>>=20
>> Should this path ensure the hardware is stopped and synchronized with th=
e
>> interrupt handler on timeout or interrupt?
>
> For me this is obscure enough I'm not sure we care about stale data.

Interesting issue... Hmmm, yeah I say we leave it like that too. Stale
data would not be the end of the world here.

>> > +static int ads1262_regmap_read(void *context, const void *reg_buf,
>> > +			       size_t reg_size, void *val_buf, size_t val_size)
>> > +{
>> > +	struct ads1262 *st =3D context;
>> > +	u8 tx[2];
>> > +
>> > +	lockdep_assert_held(&st->xfer_lock);
>>=20
>> [Severity: Medium]
>> Will this lockdep assertion fail if the register is read via debugfs?
>>=20
>> Because ads1262_regmap_config does not set disable_locking =3D true and =
does
>> not provide custom lock/unlock callbacks, regmap uses its own internal
>> mutex. When regmap's debugfs interface is read, the regmap core acquires
>> its internal mutex and calls the driver's ads1262_regmap_read() callback
>> without holding st->xfer_lock.
>>=20
>> Could this bypass the xfer_lock, triggering the lockdep splat and allowi=
ng
>> debugfs SPI operations to interleave with driver-initiated SPI transacti=
ons?
>
> This is a corner I'd not thought about in adding lockdep markings to thes=
e
> functions.  Up to you how you want to fix it.

The way to fix this would be to either bring the xfer_lock back into the
regmap callbacks or allocate the regmap_config dynamically and give it
the xfer_lock so the core can deal with it.

For me I'd prefer to do the first but David raised a concern about the
xfer_lock being in the callback. Maybe David can give us his opinion
here?

--=20
Thanks,
 ~ Kurt
