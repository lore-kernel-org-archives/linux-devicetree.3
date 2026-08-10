Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1397B370AD4
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 07:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786346600; cv=none; b=ZvKkAlFMYgmKV8rejw1WQsXvjtsJplwwUzEPkotm/MUOiLU4i2N1qkbN2yArU6rL1hIr+N8RAmrqILgjfTKE92DXUVJl0n8tl02Moa11QE+Iw6lUG6Qi00YAkns6qDOeC1hE7L8rmGVE5ewZHGPEdK71/y1zcRNhMCeZByMoKQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786346600; c=relaxed/simple;
	bh=lJXk6uX4vQofVrcWKhe83XCw1UFhmYxz7eoIBvtlcLY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bRmDw+TjLYWmcgSJjne4oPMdwCan3j3o6xOlkdPJ66uFDOSRS7DxfjqP4Sh9WThbig+LoiTZpmmzNxwsNuUYFz+3BBdqbLstPHl/VTXh+LP77GfzfpE7cAOUdzzxLwyZTja9VMQcI+Vkpkepk8p+QQQGkSx4yS2foF7VVV1ELpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sxa3cZRI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sxa3cZRI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E14B1F000E9;
	Mon, 10 Aug 2026 07:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786346598;
	bh=S3OblhMAqiiyDBQ66277WOQb2hW85CZJuW43Kqoy7Fc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Sxa3cZRIHXsdspGBvNUnxL1Boadyuom9c6+dhr26W/z7+mdpt8mgTKA37BrRlf+Ia
	 MlXp/KxiFW8iF1vBtFJ9RFOvmi9/YdYZNofmzFyW/e9DYZvii242qjmTIE0S/qn5At
	 O5OlkeoBcznsa4j6YfS/LQffaC7EzzE190VadRYrESCH7GYM44Qp6NxN/oWcTklInZ
	 7xvRd5tsVpB9Ejai8BpqRMBDZFvUI1Aw+Dvx/c0p38RyuqU1/sK1KmOXcWwqss55/G
	 1cpDRrZMnGahCLx5CNVb4soe3XaTnVu7eN4QzHjx+kuAnw0V5XzVPvfhkawK3O+Dh8
	 Hld1uHOEFJsgA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/7] iio: light: ltr501: Power down chip if request
 irq fails
Reply-To: sashiko-reviews@lists.linux.dev
To: "Esben Haabendal" <esben@geanix.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260810-liteon-ltr329-v4-4-8bd3dfd15280@geanix.com>
References: <20260810-liteon-ltr329-v4-0-8bd3dfd15280@geanix.com>
 <20260810-liteon-ltr329-v4-4-8bd3dfd15280@geanix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 07:23:17 +0000
Message-Id: <20260810072318.6E14B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Race condition leading to a Use-After-Free in the IRQ handler if `=
iio_device_register()` fails during probe.
- [High] Incorrect integer sizes passed to `regmap_bulk_read` and `regmap_b=
ulk_write` cause uninitialized memory reads and incorrect hardware writes o=
n big-endian architectures.
- [Medium] If `ltr501_init()` fails partially while writing the control reg=
isters, the ALS sensor is left powered on when probe fails.
--

--- Patch [4]: [PATCH v4 4/7] iio: light: ltr501: Power down chip if reques=
t irq fails ---
commit a19bda31a7e1d7988ac494947d945670f4024b2a
Author: Esben Haabendal <esben@geanix.com>

iio: light: ltr501: Power down chip if request irq fails

In case devm_request_threaded_irq() failed, we were leaving the chip
powered instead of powering it down again. Power down the chip switching
ALS and PS modes to standby.

> diff --git a/drivers/iio/light/ltr501.c b/drivers/iio/light/ltr501.c
> index 7d045be78c6df..7746d374688fa 100644
> --- a/drivers/iio/light/ltr501.c
> +++ b/drivers/iio/light/ltr501.c
> @@ -1540,7 +1540,7 @@ static int ltr501_probe(struct i2c_client *client)

[Severity: Medium]
This is a pre-existing issue, but does ltr501_probe() leak power if
ltr501_init() fails partially?

If the first I2C write in ltr501_init()->ltr501_write_contr() succeeds but
the second fails, ltr501_init() returns an error with the ALS sensor
powered on:

drivers/iio/light/ltr501.c:ltr501_probe() {
	...
	ret =3D ltr501_init(data);
	if (ret < 0)
		return ret;
	...
}

This returns directly instead of taking the powerdown_on_error path,
leaving the ALS sensor active.

[Severity: High]
This is also a pre-existing issue, but does using
devm_request_threaded_irq() here create a race condition if
iio_device_register() fails later in probe?

Since the IRQ is managed by devres, it remains active until ltr501_probe()
returns and devres cleans it up.

If iio_device_register() fails, its error path calls
iio_device_unregister_eventset(), which frees the event interface:

drivers/iio/industrialio-event.c:iio_device_unregister_eventset() {
	...
	kfree(ev_int);
	iio_dev_opaque->event_interface =3D NULL;
	...
}

If a concurrent hardware interrupt fires before devres disables the IRQ,
ltr501_interrupt_handler() will call iio_push_event(), which dereferences
the freed pointer:

drivers/iio/industrialio-event.c:iio_push_event() {
	struct iio_event_interface *ev_int =3D iio_dev_opaque->event_interface;

	if (!ev_int)
		return 0;
	...
}

>  		if (ret) {
>  			dev_err(&client->dev, "request irq (%d) failed\n",
>  				client->irq);
> -			return ret;
> +			goto powerdown_on_error;
>  		}
>  	} else {
>  		indio_dev->info =3D data->chip_info->info_no_irq;

[Severity: High]
This is another pre-existing issue, but do the regmap_bulk_read() and
regmap_bulk_write() calls in this driver handle endianness correctly?

In functions like ltr501_read_thresh(), ltr501_trigger_handler(), and
ltr501_write_thresh(), 32-bit integer variables are passed by reference
with a 2-byte length:

drivers/iio/light/ltr501.c:ltr501_read_thresh() {
	...
	int thresh_data;
	...
			ret =3D regmap_bulk_read(data->regmap,
					       LTR501_ALS_THRESH_UP,
					       &thresh_data, 2);
	...
}

On big-endian architectures, this targets the most significant bytes,
leaving the lower bytes uninitialized.

When masked and returned, it yields stack garbage.

During writes, the upper bytes (which are 0) are sent to the sensor,
meaning 0x0000 is always written.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810-liteon-ltr=
329-v4-0-8bd3dfd15280@geanix.com?part=3D4
