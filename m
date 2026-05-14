Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFFED3A9DB5
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 08:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778746127; cv=none; b=P3EkMV1M/WIIY+S1ft2JmdLWe1ORCLkyq0TaYKtn8vt0ExLTIGffDI4X1rer52LylJnIzeXjWUrR0CY6LK7UXWsjbibAP1TnMUEoG7ivg/gNAp94xr6OnyJmFjJQOEJDJ5ibEZbsahIqN6Y59L0D8plEj7Ud3/bJL6oPmUZSTeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778746127; c=relaxed/simple;
	bh=g7xguqCZtgnyzD9l8m0Kciaz7ozwOJwTX+xmdeVlJtw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OwGvuaFYDxk0IuV72gzOdygXqIQGzSKy9MpPVvf5rbBJooOfjHGDhR3NTlXfMvaIw4G70oAHm2GUU65czkKthTOwicuAama7YBkzSgwm39b3SWEceWsTuCrxvhOnMjZlE4gGEcoMEr5qNvHA4NVTynxVAvazwnCIjI7m+IJftOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Phes9eDo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Phes9eDo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4194DC2BCB7;
	Thu, 14 May 2026 08:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778746127;
	bh=g7xguqCZtgnyzD9l8m0Kciaz7ozwOJwTX+xmdeVlJtw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Phes9eDoMYgHXcbWtvN+IZkPa7v68daxOucktA5he1M/oADTpzZvEnVFWVuKSu1ax
	 uQPqglAp9Nz0YzmDc+Lb4oPCDJbJ0qtia05SutymtR8fXbz04E+77lZg2uhOpfas8d
	 XCSuK0OVFpahDfssFy8rAplhbeNw7bD1ue7smi9wU+Y6MLy7OMUy+1yxw39ltOmfxw
	 rqiYKEztVg7Yb8nqh7TlYXfKyn6MLUazC2bc8zJtwXwkXCaAGOUwglxFdi9fakB0hz
	 MLnTfl54CxLyYiGOoa/+yA3EBv1OJf8dOfD3FCNJLUQIqQWrn6Ls9C6PhQbpnAVCdM
	 e3mNHqKn/JV5w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/4] iio: light: veml6030: fix channel type when
 pushing events
Reply-To: sashiko-reviews@lists.linux.dev
To: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260513-veml6031x00-v2-2-4703ca661a1d@gmail.com>
References: <20260513-veml6031x00-v2-2-4703ca661a1d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 08:08:46 +0000
Message-Id: <20260514080847.4194DC2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Returning IRQ_HANDLED on I2C read failure in the interrupt handler=
 causes an interrupt storm.
--

commit 198c71e09b48e4ebbfc54cfa1edf78cced994d05
Author: Javier Carrasco <javier.carrasco.cruz@gmail.com>

iio: light: veml6030: fix channel type when pushing events

The events are registered for IIO_LIGHT and not for IIO_INTENSITY.
Use the correct channel type.

> diff --git a/drivers/iio/light/veml6030.c b/drivers/iio/light/veml6030.c
> index 745cf3ad7092e..855f052b60c2c 100644
> --- a/drivers/iio/light/veml6030.c
> +++ b/drivers/iio/light/veml6030.c
> @@ -871,9 +871,11 @@ static irqreturn_t veml6030_event_handler(int irq, v=
oid *private)

This isn't a bug introduced by this commit, but looking at the beginning of
veml6030_event_handler():

	ret =3D regmap_read(data->regmap, VEML6030_REG_ALS_INT, &reg);
	if (ret) {
		dev_err(&data->client->dev,
				"can't read als interrupt register %d\n", ret);
		return IRQ_HANDLED;
	}

Could returning IRQ_HANDLED on I2C read failure cause an interrupt storm?

The VEML6030 device uses a level-triggered interrupt which is cleared by the
hardware only when the VEML6030_REG_ALS_INT register is successfully read.
If regmap_read() fails, the device continues to assert the interrupt line.

Because the line is still asserted and IRQ_HANDLED signals the interrupt was
serviced, the core IRQ subsystem unmasks the line, which fires immediately =
and
wakes the threaded handler again.

Would it be better to return IRQ_NONE instead, so the IRQ core's spurious
interrupt detector can track the unhandled threaded interrupt and eventually
disable the misbehaving line?

>  	else
>  		evtdir =3D IIO_EV_DIR_FALLING;
> =20
> -	iio_push_event(indio_dev, IIO_UNMOD_EVENT_CODE(IIO_INTENSITY,
> -					0, IIO_EV_TYPE_THRESH, evtdir),
> -					iio_get_time_ns(indio_dev));
> +	iio_push_event(indio_dev, IIO_UNMOD_EVENT_CODE(IIO_LIGHT,
> +						       0,
> +						       IIO_EV_TYPE_THRESH,
> +						       evtdir),
> +			iio_get_time_ns(indio_dev));
> =20
>  	return IRQ_HANDLED;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513-veml6031x0=
0-v2-0-4703ca661a1d@gmail.com?part=3D2
