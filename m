Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A014B515E
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 14:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791212192; cv=none; b=t8yChkgOloj75GkuH3C6qAOZJGYJBoARVr7wLP+n3Dm8x2eZEb9c+b53jnLS/vH4qM5+L4pkhJTjLhciG71iq5WaI2zeKp1/ukcJQJdOp3jmDLA6OdYv7QWGYRwAVQ9VjicDGGtoMmb44XDdf24AFnUYVvlJnGweSAVQFoOpOIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791212192; c=relaxed/simple;
	bh=q2iEFRY8ywXqTw2tATFTfvAi/DztIfAbWNeGh8PRD6Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LQWNr1POdVb9if4ghQgK2dQm6s6FrQfGzsDgweoFzYrbtE5pOAym662uXwCQ8xvoMU47U2SP7EOz8aTbh1P3cqVqAkanai+8vi2f4tA5iGYY5gc6rSY7r2iAYBXeCOTTeaAtdcbTPums4T3VHJMQwgo8ZxN3zGM8o3Ac6qw83L8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y2r5XMLa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y2r5XMLa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35DFB1F000FF;
	Mon,  5 Oct 2026 14:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791212188;
	bh=EcWo3X1pqXWPLL+/+W3jRdRPUvM3hoiuEeygsqmbgeI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Y2r5XMLaatJjBRh0HUPIlVp/XZIwHud07vr1efVSPwO+7dpsLc+oBZTX1X1l4GmZ+
	 wZE8Po4j+lrUqhhTzPWj/mTgStkI2DlEIMcfuinP9Evdgv4cussU9Pp47+povg36va
	 QhwQpVy1lzYtLNo7Ky1IraIrlcPHJHzoK/K1pbOUNlE5wgaGHJhZFQFzv6LbTk6Mqy
	 gn0WG11o1X8SlAY7otb0zvyJPJsLelkPCW7fm4HC0TB7B00uxUE7RKiQnydOXrg5Qh
	 zpry0LPm4N7lfiGOv2VCg5cbNQ41VLpbzwGvFunxFbbhXRbKDi2ENLpBS68+eIq+5c
	 OXiCalU2ZeB5A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] iio: temperature: tmp117: add support for HIGH and
 LOW alerts
Reply-To: sashiko-reviews@lists.linux.dev
To: "Thomas Bonnefille" <thomas.bonnefille@bootlin.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261005-add-tmp117-notif-v1-2-c6cef6fad64c@bootlin.com>
References: <20261005-add-tmp117-notif-v1-0-c6cef6fad64c@bootlin.com>
 <20261005-add-tmp117-notif-v1-2-c6cef6fad64c@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 05 Oct 2026 14:56:27 +0000
Message-Id: <20261005145628.35DFB1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] tmp117: use-after-free of IIO event interface on probe error path
- [Low] tmp117: build failure on 32-bit platforms due to 64-bit division
--

commit 986d5decf91950670647d2b2db83a43e9c93c02f
Author: Thomas Bonnefille <thomas.bonnefille@bootlin.com>

iio: temperature: tmp117: add support for HIGH and LOW alerts

This commit adds support for setting high and low temperature alert limits =
on
TMP11x chips. It configures an interrupt handler to generate IIO events when
these limits are crossed.

> diff --git a/drivers/iio/temperature/tmp117.c b/drivers/iio/temperature/t=
mp117.c
> index 74cb8d62bef3c..d2924e9a7f97b 100644
> --- a/drivers/iio/temperature/tmp117.c
> +++ b/drivers/iio/temperature/tmp117.c
[ ... ]
> @@ -52,6 +62,112 @@ struct tmp11x_info {
[ ... ]
> +static int tmp117_write_thresh(struct iio_dev *indio_dev,
> +			       const struct iio_chan_spec *chan,
> +			       enum iio_event_type type,
> +			       enum iio_event_direction dir,
> +			       enum iio_event_info info,
> +			       int val, int val2)
> +{
[ ... ]
> +	tmp =3D (val < 0) ? (s64)val * 1000000 - val2
> +			: (s64)val * 1000000 + val2;
> +	tmp =3D DIV_ROUND_CLOSEST(tmp * TMP117_LIMIT_LSB_DEN,
> +				(s64)TMP117_LIMIT_LSB_NUM * 1000000);

[Severity: Low]
Does this macro expansion cause a build failure on 32-bit platforms?

DIV_ROUND_CLOSEST natively invokes the / operator. Passing two 64-bit integ=
ers
here causes a 64-bit division, which generates an undefined reference to
__divdi3 on 32-bit builds.

> +	tmp =3D clamp_t(s64, tmp, S16_MIN, S16_MAX);
> +
> +	return i2c_smbus_write_word_swapped(data->client,
> +					    reg, tmp);
> +}
[ ... ]
> @@ -208,6 +343,16 @@ static int tmp117_probe(struct i2c_client *client)
[ ... ]
> +	if (client->irq) {
> +		ret =3D devm_request_threaded_irq(&client->dev, client->irq,
> +						NULL, tmp117_interrupt_handler,
> +						IRQF_ONESHOT, match_data->name,
> +						indio_dev);
> +		if (ret) {
> +			dev_err_probe(&client->dev, ret, "irq request error\n");
> +			return ret;
> +		}
> +	}
> =20
>  	return devm_iio_device_register(&client->dev, indio_dev);
>  }

[Severity: High]
Can this sequence lead to a use-after-free of the IIO event interface?

If devm_iio_device_register() fails, its error path frees the IIO event
interface. However, because the interrupt was already enabled by
devm_request_threaded_irq(), it remains active until devres tears it down.

If an interrupt triggers during this window, tmp117_interrupt_handler()
executes:

tmp117_interrupt_handler()
    iio_push_event(indio_dev, ...)

Will iio_push_event() dereference the already freed event interface structu=
re?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261005-add-tmp117=
-notif-v1-0-c6cef6fad64c@bootlin.com?part=3D2
