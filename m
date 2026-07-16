Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021B3442FD4
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 17:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784223982; cv=none; b=VmyQQeXYRmB6w+eRpmhfBIbWLcOwsp/RCRIWCHY+lkOofdAeviFBIuAoHavtWit2TnsKKgZ3uDnzcjfviwMUuBrQEcYd/kjRmkifN+xHO7g88JuPXDVEJ4+ArK4l54h+B0rGL+oB7imz4mgJAeRi4QmldnK8j1d1ILhBEL/MsZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784223982; c=relaxed/simple;
	bh=FkdldepMYcaLjVHu9t7aLAheTCUlfS4B8cEJ5BnoP+c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=t61g0V/5s3o8Y2zkGrTs0fBx+WLB3tQIwZz0FD3CNMuPo8O85rcJ5+ISXJMU0F+/iQew3PR3IeisHJuRt4eJ5IZWJ4oc4yR0jniBf1/6dzeXloymi2hPLvtkL3VU293lAjs5smJg7UxKH98pKPqb8wot2uspalz7UNP1qeaYOHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V3/BRHwH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V3/BRHwH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56F941F000E9;
	Thu, 16 Jul 2026 17:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784223980;
	bh=BmdheK/2dFdiYP/fk4IDMY43kNhTydX9o7+nlog5JXI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=V3/BRHwHEdSi7593yO8Y9ceLwEOQt4HWmzhOyVY5iIVICdhpDBIbgyrLDE3SIZV9G
	 sSqZmxzSE9Ckg3zJ4qZa7CLWPM9z0JnH7axva1ccHHr1rfKXxr+bDNt1WGNPq5/vxp
	 o5N2obu90vPsMAUWCJqLYsAMxPoWaYr5jeYiaWMioNtlyWq2tuYSy1y00vM9HeItsn
	 jpoeAI8m0Es2Y0h4hb4NE+MwpXTSZAD7y37PgnxN5w/aO/Z3Vzcea0WnaMvcsMNDgj
	 dUF+ApnY6/COpuHyXva/1JFw2nrzFAD+li+U1vOeBAWSerfWNVjsiUmBx9QbveSFte
	 zrx9sH+V9MBkw==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 3/3] iio: proximity: srf04: Add Cytron HC-SR04
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGF3ZcWCIFdpxZtuaWV3c2tp?= <pawel.wis.me@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <3fedc827a2581d61bef9ea639ed77cf90e80047a.1784221074.git.pawel.wis.me@gmail.com>
References: <cover.1784221074.git.pawel.wis.me@gmail.com>
 <3fedc827a2581d61bef9ea639ed77cf90e80047a.1784221074.git.pawel.wis.me@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 17:46:19 +0000
Message-Id: <20260716174620.56F941F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Unchecked return value from `device_get_match_data()` can cause a =
NULL pointer dereference.
- [High] Interrupt handler may miss the rising edge of the echo pulse due t=
o interrupt latency.
--

--- Patch [3]: [RFC PATCH 3/3] iio: proximity: srf04: Add Cytron HC-SR04 su=
pport ---
commit e27499a683a294e308b2d89b6fa06d4fd87a1cef
Author: Pawe=C5=82 Wi=C5=9Bniewski <pawel.wis.me@gmail.com>

iio: proximity: srf04: Add Cytron HC-SR04 support

This commit adds support for the Cytron HC-SR04 sensor to the srf04 driver.
It introduces the new compatible string "cytron,hc-sr04" and updates the
Kconfig to list the supported device.

> diff --git a/drivers/iio/proximity/srf04.c b/drivers/iio/proximity/srf04.c
> index 7be50bdebfcbc..f5ee7d6572b5b 100644
> --- a/drivers/iio/proximity/srf04.c
> +++ b/drivers/iio/proximity/srf04.c

[ ... ]

> @@ -231,6 +231,7 @@ static const struct iio_chan_spec srf04_chan_spec[] =
=3D {
>  };
> =20
>  static const struct of_device_id of_srf04_match[] =3D {
> +	{ .compatible =3D "cytron,hc-sr04", .data =3D &srf04_cfg },

[Severity: High]
This is a pre-existing issue, and was not introduced by the patch under
review, but could the unchecked return value from device_get_match_data()
cause a NULL pointer dereference?

In drivers/iio/proximity/srf04.c:srf04_probe(), the return value is assigned
without validation:

    data->cfg =3D device_get_match_data(dev);

If the driver is instantiated via legacy platform device registration,
device_get_match_data() will return NULL. Later, in srf04_read(), this could
be dereferenced:

    udelay(data->cfg->trigger_pulse_us);

Can this result in a kernel panic when a user reads from the IIO device?


[Severity: High]
This is a pre-existing issue, and was not introduced by the patch under
review, but could the interrupt handler miss the rising edge of the echo
pulse due to interrupt latency?

In drivers/iio/proximity/srf04.c:srf04_handle_irq(), the handler relies on
the live GPIO state:

    if (gpiod_get_value(data->gpiod_echo)) {

If an object is close, the echo pulse is very short. If the system's
interrupt latency exceeds this duration, the GPIO will already have
transitioned back to low by the time the handler executes for the rising
edge. The handler will read low, complete the falling completion, and
ignore the rising edge.

This would cause the read operation to time out and fail in srf04_read():

    ret =3D wait_for_completion_killable_timeout(&data->rising, HZ/50);

Could this cause the sensor to consistently fail to measure short distances
and return -ETIMEDOUT to userspace?

>  	{ .compatible =3D "devantech,srf04", .data =3D &srf04_cfg },
>  	{ .compatible =3D "maxbotix,mb1000", .data =3D &mb_lv_cfg },

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1784221074.gi=
t.pawel.wis.me@gmail.com?part=3D3
