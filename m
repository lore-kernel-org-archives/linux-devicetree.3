Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C3736B92C
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 01:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788224694; cv=none; b=uyD0pEItvnwLQXzOB25IWVH/osatveRkvro0TNeUGXJL1IkUWiida8xRtUwBdTzGaDeoH7UTpYZH5D0aqd3c6KZ2wuBePDIZqsufpTvUp5auW1hdH5VZ90ZWOoNA2cuRYcvGB/xxztVjD46X4sjwvy04TyZ65PoKzEFw8C3XYA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788224694; c=relaxed/simple;
	bh=h3vboYjgVCcZOEHtEFnkBrmbyvBCW3ajj2TruJhDL3c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qH+KeSLwC0KAaBTcwA10C8We0FRm3hTS06fvMVEnq+U46CeaINTdbdRsXm6Kth+42bfgVQIaqiCU5JftRTaYhb3AaJHP7kyogquzHhS7fvuV5mP0VLzTdEW+saMv+5DNhM6KEFbSVN92PMFstQgOP8MvdvAQe86oaCeslHCnTz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ui5uat2z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ui5uat2z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2FDE1F000E9;
	Tue,  1 Sep 2026 01:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788224693;
	bh=Gs7j8v2l/ygBYHR9NFr/kRjD/YCIUAoOXhEKbLln8so=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ui5uat2zsrq+Fge0yXum2an4vVKXRHvgZw/stay8RYWIi8dSL5jWvES2lPZfRz+tL
	 PAIGXPNi+cx7XyH+HI5LueEtC6sIW3PWmKdtSomjTPxPDDuERhZQgwUKvS9b/B3YOk
	 Eyh4lxXubcUYpcMqgBTq+zcEvoJE0Ad1xSA7yhS9ZUl+7vqMQbq56RlMxYjeGTxTt8
	 VN5k9bzuZ8tauoFgLFh3dX5ZDSuWBSVv2lAdAqREIBtJoMC/CuOiI2iiS2VFWTgccY
	 1kbT47lDe7myVkC/rbBzT0eA7BzW2b6jB5U8yHpmWb3Y11YC2PtGiYlGtskCcSWisz
	 1GsGKFNK0mw4w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 5/5] iio: light: stk3310: support the Sensortek
 STK36C61
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jorijn van der Graaf" <jorijnvdgraaf@catcrafts.net>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260901005114.203062-6-jorijnvdgraaf@catcrafts.net>
References: <20260901005114.203062-1-jorijnvdgraaf@catcrafts.net>
 <20260901005114.203062-6-jorijnvdgraaf@catcrafts.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 01:04:52 +0000
Message-Id: <20260901010452.C2FDE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Possible Use-After-Free of IIO event interface (ev_int) during pro=
be failure due to asymmetric IRQ lifecycle.
--

commit b4e1397431b4f12cb9a540f222673e8512090f40
Author: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
Subject: iio: light: stk3310: support the Sensortek STK36C61

The Sensortek STK36C61 is a 3-in-1 ambient light / proximity / RGB
colour sensor. This patch adds its chip ID to the known-ID list and
device table entries, exposing the colour channels alongside ALS and
proximity.

> diff --git a/drivers/iio/light/stk3310.c b/drivers/iio/light/stk3310.c
> index f5782a1e19bbc..0a16e326e9390 100644
> --- a/drivers/iio/light/stk3310.c
> +++ b/drivers/iio/light/stk3310.c
[ ... ]
> @@ -866,6 +866,7 @@ static const struct i2c_device_id stk3310_i2c_id[] =
=3D {
>  	{ .name =3D "stk3310", .driver_data =3D (kernel_ulong_t)&stk3310_chip_i=
nfo },
>  	{ .name =3D "stk3311", .driver_data =3D (kernel_ulong_t)&stk3310_chip_i=
nfo },
>  	{ .name =3D "stk3335", .driver_data =3D (kernel_ulong_t)&stk3310_chip_i=
nfo },
> +	{ .name =3D "stk36c61", .driver_data =3D (kernel_ulong_t)&stk36c61_chip=
_info },

[Severity: High]
This isn't a bug introduced by this patch, but is it possible for the
pre-existing IRQ setup in stk3310_probe() (drivers/iio/light/stk3310.c,
around line 766) to trigger a use-after-free if probe fails?

Looking at stk3310_probe(), the IRQ handler is registered before the IIO
device:

	if (client->irq > 0) {
		ret =3D devm_request_threaded_irq(&client->dev, client->irq,
						stk3310_irq_handler,
						stk3310_irq_event_handler,
						IRQF_TRIGGER_FALLING |
						IRQF_ONESHOT,
						"stk3310_event", indio_dev);
		if (ret)
			goto err_standby;
	}

	ret =3D iio_device_register(indio_dev);
	if (ret < 0) {
		dev_err(&client->dev, "device_register failed\n");
		goto err_standby;
	}

If iio_device_register() fails late in its execution, it cleans up its
partial state and frees the ev_int structure via kfree(). Because the IRQ
is managed by devres, it remains active until stk3310_probe() returns and
the devres unwinding phase disables it.

If a hardware interrupt fires during this window, stk3310_irq_event_handler=
()
(around line 714) will execute:

	event =3D IIO_UNMOD_EVENT_CODE(IIO_PROXIMITY, 1,
				     IIO_EV_TYPE_THRESH,
				     (dir ? IIO_EV_DIR_FALLING :
					    IIO_EV_DIR_RISING));
	iio_push_event(indio_dev, event, data->timestamp);

Can iio_push_event() dereference the freed ev_int structure here since there
is no synchronization with the iio_device_unregister_eventset() cleanup?

>  	{ }
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901005114.2030=
62-1-jorijnvdgraaf@catcrafts.net?part=3D5
