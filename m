Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B58C400DFC
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 12:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788179577; cv=none; b=h4FpQHcJMxjAHyyXNTKuHRtNmh7Y+N1oecKzkX1/frpwP/41YpEmiRl1J7ytvxxMsjxYHSkgSY/pRr+sqeyKeA3qYOVX3ISc1OTET7ICgh1ME7n1FNxhH4MlwK4lLHglzF2/oV1EvumeAjk/U0XhL5GEiYmkY/Svehev1U0dNsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788179577; c=relaxed/simple;
	bh=aXv24ltUcC0v30f3D2h/y7dL3/8lTsQNc/Zn290DhrM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PeN5+AIIOFVGtdoP600iBHUghF1hbaTo3QXAAgvjDDmzqQ1pzpG/vvFZ4yUHhGO/a0jk8HmaaY2u+eWyFEZYRcqWyjpso/HjYid1X8UAgDC4/f3GSO+8HrclO8X0hW7456FC5iUjv8EwgH6mU4vvJAuDTgKqR/tALg87QarhvTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=liLwqSAp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="liLwqSAp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A3A51F000E9;
	Mon, 31 Aug 2026 12:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788179576;
	bh=zch1NDBJEmk8+tARZ2aT45zdtrb2dyIbpqNN8jB1IHk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=liLwqSApAEm1/CWzlNHww3cZpA1PTp+G/i5etl4rKVuTbjIBX5vxzwZp6nO43mx5k
	 ApxydRa3oH+qGHapUezktM6jHYE5SlzOxHsd0aP3cXM7hoMv2xfHVLwJI4ntDj/OaW
	 Mv+o21Zae8Vvq3dlQu+QaV+TpShDvxAd6xPPg8r6lKrg+sKwEnGSrZatpPCFHTiknx
	 C4W2CMTUF3GLVSMapdnv3+/ERJtSK3lQjUUxU4FvPsjj70kShVmUB3n+49TNjiWoWA
	 cDm1DQoNio2G3IqRjkytfUhltWEq+bLazZIQ4aXTZv0u06VZaYvgZ0n0yDVk3Z0ppf
	 VbEz5UnStcJdg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 5/8] iio: accel: mma8452: Allow open drain interrupt
 pin configuration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Esben Haabendal" <esben@geanix.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260831-mma8452-open-drain-v7-5-22946812c928@geanix.com>
References: <20260831-mma8452-open-drain-v7-0-22946812c928@geanix.com>
 <20260831-mma8452-open-drain-v7-5-22946812c928@geanix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 12:32:55 +0000
Message-Id: <20260831123256.1A3A51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The MMA8452 driver permanently loses volatile hardware configurati=
on upon runtime PM resume because it fails to restore registers wiped by th=
e regulator power-down.
- [High] Sysfs read and write handlers execute hardware I2C operations with=
out runtime PM protection, causing transactions to fail against an unpowere=
d chip.
--

commit 3785b0b6d22b638ef18d797d66c6f15f51fc0132
Author: Esben Haabendal <esben@geanix.com>

iio: accel: mma8452: Allow open drain interrupt pin configuration
   =20
When designing systems sharing the interrupt for mma8452 chips, it is
helpful to be able to configure the irq pin in open-drain mode (default is
push-pull).
   =20
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Esben Haabendal <esben@geanix.com>

> diff --git a/drivers/iio/accel/mma8452.c b/drivers/iio/accel/mma8452.c
> index 936eeb2efb2dd..2ba6e2c44cb9e 100644
> --- a/drivers/iio/accel/mma8452.c
> +++ b/drivers/iio/accel/mma8452.c

[ ... ]

> @@ -1830,6 +1854,10 @@ static int mma8452_runtime_resume(struct device *d=
ev)
> =20
>  	WRITE_ONCE(data->suspended, false);
> =20
> +	ret =3D mma8452_set_interrupt_pin_mode(data);
> +	if (ret)
> +		goto runtime_resume_failed;
> +
>  	ret =3D mma8452_active(data);
>  	if (ret < 0)
>  		goto runtime_resume_failed;

[Severity: High]
This isn't a bug introduced by this patch, but does mma8452_runtime_resume()
fail to restore the full device configuration?

Disabling the VDD and VDDIO regulators in mma8452_runtime_suspend() causes =
the
chip to lose power and reset to defaults. However, mma8452_runtime_resume()
only restores CTRL_REG1 and CTRL_REG3.

It seems to omit restoring operational parameters established during probe =
or
via sysfs, such as DATA_CFG (scale) and event thresholds. Does this lead to
silent data corruption, where the software-cached state (like data->data_cfg
representing an 8g scale) becomes desynchronized from the hardware (which
resets to 2g), causing subsequent sensor readings to be misinterpreted by
userspace?

[Severity: High]
This is a pre-existing issue, but do the sysfs read and write handlers exec=
ute
hardware I2C operations without runtime PM protection?

The driver implements pm_runtime_autosuspend to disable regulators after 2
seconds of inactivity. However, mma8452_read() calls mma8452_drdy(), which
executes an I2C read on MMA8452_STATUS before invoking
mma8452_set_runtime_pm_state(..., true) to wake the device:

static int mma8452_read(struct mma8452_data *data, __be16 buf[3])
{
	int ret =3D mma8452_drdy(data);

	if (ret < 0)
		return ret;

	ret =3D mma8452_set_runtime_pm_state(data->client, true);
        ...

Similarly, mma8452_write_raw() and mma8452_write_event_value() execute I2C
transactions without calling pm_runtime_resume_and_get().

Since the chip is unpowered during autosuspend, will these sysfs operations
routinely timeout or NACK when the device is suspended, rendering the
interface unusable for polling?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831-mma8452-op=
en-drain-v7-0-22946812c928@geanix.com?part=3D5
