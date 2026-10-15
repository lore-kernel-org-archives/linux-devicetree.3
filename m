Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9063C3F4F
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 16:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792083552; cv=none; b=cRhhZWCy2QEP8gtcw+0ReDR26lVPazy1bOQZkSxH+Ldvni2g2Vzgs5htEqpY+7itbESHRCubIC6cFmnjDBXWzjSFSF61lQEgfN1LiFGJJowFaMoSJlxYea6xr0D1jKphRPPWGLnVgyZ0kqO/Kei2ZVoSfQWfQ4EZ6W+tuNQTONU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792083552; c=relaxed/simple;
	bh=OfffZxNZpXRFpx0bVxeMx1AQTgjC6I0D8sMZu3w8PYM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=L+InmRLVvoyKd9YbIxIvUlF9lkSSP3AhVTvpGkEYnFShSH7x9ok0m9D0ppAxncQ3wV3krAuPnOpM7iRJdfSzvx99e0kvQJeLWP2VxvVP0oU2B0qaqtZRfARIqGydZlHhtkNfpMjs5C6BaQ1g0Wo0QBc+RMoPvU1keyC2M130FVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nhae/4MA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nhae/4MA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD19E1F000C4;
	Thu, 15 Oct 2026 16:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792083532;
	bh=OyvN349HqJGOcRViTaF641IpWGDu7iRZwtVQ1PJrqp0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Nhae/4MAxM/wkr84Ua/Vw3nuQeS59779/gNdvrMJqL6V3WowSFCMTEHsaCRyy1uN8
	 kUlURZJ3PD4oIxeH8SjXfQPajUPla/q1qtwcvtiQ0SfPo6ue2xFo51he8MqtAXFCWk
	 Ark22EwpGqLDwXRYfDlCKoy9CBIR6DGGqdUOtVpxJNd8f6hvPlijDnSnMt+vKnnWwT
	 TDrAf7GvBtkWOvivFqyTtHrUohYeAr9EhuP2D5LDB/fwARbPahsQBl4OhwJg4DZ9cw
	 ut62lqOLfszJAn8qMV2DLg68yJFZ1WKocPHEvdAxYf7E4uK1Kp3UIXBW4eI8po76VB
	 /+if5eIUQg5HQ==
Message-ID: <sashiko-outbox-173217@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 07/10] iio: frequency: ad9910: support drctl control
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rodrigo Alencar" <rodrigo.alencar@analog.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261015-ad9910-backend-support-v1-7-3c21648c8e26@analog.com>
References: <20261015-ad9910-backend-support-v1-0-3c21648c8e26@analog.com>
 <20261015-ad9910-backend-support-v1-7-3c21648c8e26@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 16:58:51 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] iio: ad9910: missing error rollback for integration_time on hard=
ware failure
- [Medium] iio: ad9910: integration_time write fails if PWM lacks hardware =
readback
- [Medium] iio: ad9910: missing PWM disable on driver unbind causing resour=
ce leak
--

commit 3bdef9985085248f9ab75c013e273ef9d7e62a3f
Author: Rodrigo Alencar <rodrigo.alencar@analog.com>

iio: frequency: ad9910: support drctl control

This commit adds support for controlling the AD9910 digital ramp generator
slope direction using a PWM signal applied to the DRCTL pin. It exposes
integration_time attributes to set the time intervals for ramp up and ramp
down sweeps.

> diff --git a/drivers/iio/frequency/ad9910.c b/drivers/iio/frequency/ad991=
0.c
> index dc13986dff3db..3d517879dee39 100644
> --- a/drivers/iio/frequency/ad9910.c
> +++ b/drivers/iio/frequency/ad9910.c
[ ... ]
> @@ -609,6 +614,66 @@ static int ad9910_sw_powerdown_set(struct ad9910_sta=
te *st, bool enable)
[ ... ]
> +static int ad9910_drctl_sync(struct ad9910_state *st)
> +{
[ ... ]
> +	state.enabled =3D true;
> +	ret =3D pwm_apply_might_sleep(st->drctl_pwm, &state);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D pwm_get_state_hw(st->drctl_pwm, &state);
> +	if (ret)
> +		return ret;

[Severity: Medium]
Will this cause spurious write failures on systems where the PWM driver
lacks hardware state readback support? If the underlying PWM driver does
not implement .get_state or .read_waveform, pwm_get_state_hw() returns
-EOPNOTSUPP. This forces ad9910_drctl_sync() to abort and return an
error, despite the PWM configuration having been successfully applied
via pwm_apply_might_sleep() right before this.

[ ... ]
> @@ -1637,6 +1726,26 @@ static int ad9910_write_raw(struct iio_dev *indio_=
dev,
[ ... ]
> +	case IIO_CHAN_INFO_INT_TIME: {
> +		s64 val64 =3D iio_val_s64_compose(val, val2);
> +
> +		if (!st->drctl_pwm)
> +			return -EOPNOTSUPP;
> +		if (val64 < 0)
> +			return -EINVAL;
> +
> +		switch (chan->channel) {
> +		case AD9910_CHANNEL_DRG_RAMP_UP:
> +			st->ramp_up_time_ns =3D val64;
> +			break;
> +		case AD9910_CHANNEL_DRG_RAMP_DOWN:
> +			st->ramp_down_time_ns =3D val64;
> +			break;
> +		default:
> +			return -EINVAL;
> +		}
> +		return ad9910_drctl_sync(st);
> +	}

[Severity: Medium]
Is there a risk of state corruption here if the hardware sync fails? The
driver updates the cached software state (ramp_up_time_ns or
ramp_down_time_ns) immediately with the user-provided value before applying
it to the hardware via ad9910_drctl_sync().

If the underlying PWM provider rejects the configuration or lacks state
readback, ad9910_drctl_sync() returns an error. This error is propagated
to userspace, but the old integration time value is never restored in the
software cache.

[ ... ]
> @@ -2249,6 +2360,15 @@ static int ad9910_probe(struct spi_device *spi)
[ ... ]
> =20
> +	st->drctl_pwm =3D devm_pwm_get(dev, "drctl");
> +	if (IS_ERR(st->drctl_pwm)) {
> +		ret =3D PTR_ERR(st->drctl_pwm);
> +		if (ret !=3D -ENOENT && ret !=3D -ENODEV)
> +			return dev_err_probe(dev, PTR_ERR(st->drctl_pwm),
> +					     "failed to get drctl pwm\n");
> +		st->drctl_pwm =3D NULL;
> +	}
> +

[Severity: Medium]
Does this leak the active PWM hardware state on driver unbind? The PWM is
acquired here using devm_pwm_get(), and enabled during integration_time
writes via pwm_apply_might_sleep() inside ad9910_drctl_sync().

However, there doesn't appear to be any corresponding devm_add_action()
registered, or a .remove callback, to ensure pwm_disable() is called.
When the driver unbinds, devres will automatically release the PWM reference
via pwm_put(), but pwm_put() does not disable active PWM hardware. This
might leave the PWM signal toggling indefinitely after the AD9910 is
powered down.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015-ad9910-bac=
kend-support-v1-0-3c21648c8e26@analog.com?part=3D7
