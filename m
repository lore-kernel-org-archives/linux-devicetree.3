Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67F31DA0E1
	for <devicetree@vger.kernel.org>; Sat,  1 Aug 2026 18:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785609283; cv=none; b=ZaVFZG5tREc2Vk4jzrY6GtYdkAYGWkx8tiP+Ck7+q/zlYS5T6Ss7LvJwGhCUqBOsxGvbTReimFzs2u8oZGyEps+VAnz9iOi+YLAVbGZveeC4N6+Ej+JSQSUQHMAG202p1NNr71KcEaqbgMz3teaDmMjW7jIZENch12z9DMMH3W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785609283; c=relaxed/simple;
	bh=dcAvhwTiyZgXnU4z1HvFXztgld0fMNEpUtCKg9giaI8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ILIqzmKNb5Ww3P0IsHx97iRUB4+YG5kjJz1WCrr46fOqg1uvQv/ya6vWGoEJ3DAPz9iQ9ij1OBMGMQ+cBv6hP04d/TYIk0+CiBwRmikK4xLa/U62mM3Xp/vHq/vdiEVokB/XL83xkcvgQANJCiJRqOqwsIxvKeegh+aC0x1x1dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lCxPOPH5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lCxPOPH5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 427F91F00ACA;
	Sat,  1 Aug 2026 18:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785609281;
	bh=VfHcvLLC7e4+Xqap3j3henGSLsRuekcspMy4GMCtge8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lCxPOPH5Rze055KqeZcWjiquOAloPPOGjo97S9IISzujS6n8uaKWDdlQwxHA1yryZ
	 xqag9uVii1qXfK4P1CYd7xtlo942bpXdvb69yYrzJRkYSQD3a/qhaIQuk6cGjrAvZV
	 sPtldm59zlDdWZzpEDjekFVut+CAfD5U44mSNYdFTk6U1T9xps2GbqyMKq5yvk7BPK
	 RWdeGKZOMWpGEuh2DYF06vZHW6gRmKvvr/NvA1uIAnMOICq7WnhMNJcWAmj7cd46OG
	 Jjr2nZm8YIaBjGrc+ILHjDVdK5ZcalmhU8FCzaTojKWfljqBwD83rMlKJDwTJt3ogW
	 Y0H9Rldna60qw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] platform: arm64: dell-xps-ec: new driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aleksandrs Vinarskis" <alex@vinarskis.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260801-dell-xps-9345-ec-v3-2-9f4bdb5a5dad@vinarskis.com>
References: <20260801-dell-xps-9345-ec-v3-0-9f4bdb5a5dad@vinarskis.com>
 <20260801-dell-xps-9345-ec-v3-2-9f4bdb5a5dad@vinarskis.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 01 Aug 2026 18:34:40 +0000
Message-Id: <20260801183441.427F91F00ACA@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] System suspend and resume error paths permanently disable the ther=
mal management polling loop.
- [High] Unacknowledged interrupt in dummy IRQ handler causes an interrupt =
storm.
- [Medium] Mismatch between thermistor profile initialization array and run=
time temperature reporting commands.
- [Low] The `i2c_device_id` array uses a positional initializer instead of =
a named initializer.
--

--- Patch [2]: [PATCH v3 2/3] platform: arm64: dell-xps-ec: new driver ---
commit 552ca6978cc04ce4176db63b786af0637fffc44e
Author: Aleksandrs Vinarskis <alex@vinarskis.com>

platform: arm64: dell-xps-ec: new driver
   =20
Introduce EC driver for Dell XPS 13 9345 (codename 'tributo'). The driver
provides thermal management information to control fans and peripheral powe=
r.

> diff --git a/drivers/platform/arm64/dell-xps-ec.c b/drivers/platform/arm6=
4/dell-xps-ec.c
> new file mode 100644
> index 0000000000000..7758f5dd93421
> --- /dev/null
> +++ b/drivers/platform/arm64/dell-xps-ec.c

[ ... ]

> +static const u8 dell_xps_ec_thermistor_profile[] =3D {
> +	0xff, 0x54,
> +	0x01, 0x00, 0x2b,	/* sys_therm0 */
> +	0x02, 0x44, 0x2a,	/* sys_therm1 */
> +	0x03, 0x44, 0x2b,	/* sys_therm2 */
> +	0x04, 0x44, 0x28,	/* sys_therm3 */
> +	0x05, 0x55, 0x2a,	/* sys_therm4 */
> +	0x06, 0x44, 0x26,	/* sys_therm5 */
> +	0x07, 0x44, 0x2b,	/* sys_therm6 */
> +};
> +
> +/*
> + * Mapping from IIO channel name to EC command byte
> + */
> +static const struct {
> +	const char *name;
> +	u8 cmd;
> +} dell_xps_ec_therms[] =3D {
> +	/* TODO: 0x01 is sent only occasionally, likely TZ98 or TZ4 */
> +	{ "sys_therm0", 0x02 },
> +	{ "sys_therm1", 0x03 },
> +	{ "sys_therm2", 0x04 },
> +	{ "sys_therm3", 0x05 },
> +	{ "sys_therm4", 0x06 },
> +	{ "sys_therm5", 0x07 },
> +	{ "sys_therm6", 0x08 },
> +};

[Severity: Medium]
Is there a mismatch between the thermistor profile initialization array and
the runtime commands?

The profile array configures thermistor IDs 0x01 through 0x07, but the
runtime temperature polling uses commands 0x02 through 0x08 for sys_therm0
through sys_therm6.

This leaves thermistor ID 0x08 uninitialized and seems to misalign the rest
of the IDs. Will this break the EC's cooling logic?

[ ... ]

> +static irqreturn_t dell_xps_ec_irq_handler(int irq, void *data)
> +{
> +	struct dell_xps_ec *ec =3D data;
> +
> +	/*
> +	 * TODO: IRQ is fired on lid-close. Follow Windows example to read out
> +	 *       the thermistor thresholds and potentially fan speeds.
> +	 */
> +	dev_info_ratelimited(ec->dev, "IRQ triggered! (irq=3D%d)\n", irq);
> +
> +	return IRQ_HANDLED;
> +}

[Severity: High]
Could this cause an interrupt storm on level-triggered lines?

The handler returns IRQ_HANDLED without touching the hardware to clear the
interrupt source.

For level-triggered interrupts, returning IRQ_HANDLED unmasks the interrupt
line at the controller, which can cause it to immediately fire again and ha=
ng
the CPU in softirq/IRQ handling context.

[ ... ]

> +static int dell_xps_ec_suspend(struct device *dev)
> +{
> +	struct dell_xps_ec *ec =3D dev_get_drvdata(dev);
> +
> +	cancel_delayed_work_sync(&ec->temp_work);
> +
> +	return dell_xps_ec_suspend_cmd(ec, true);
> +}

[Severity: High]
If dell_xps_ec_suspend_cmd() fails and aborts the system suspend, does this
permanently disable the thermal management polling loop?

The temp_work is cancelled but is not rescheduled on the error path. This
could lead to missing temperature updates to the EC, potentially causing
severe thermal throttling or overheating.

> +
> +/*
> + * Notify EC of resume
> + *
> + * This will undo the suspend actions
> + * Without the resume signal, device would wake up but be forced back in=
to
> + * suspend by EC within seconds
> + */
> +static int dell_xps_ec_resume(struct device *dev)
> +{
> +	struct dell_xps_ec *ec =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret =3D dell_xps_ec_suspend_cmd(ec, false);
> +	if (ret)
> +		return ret;
> +
> +	schedule_delayed_work(&ec->temp_work, DELL_XPS_EC_TEMP_POLL_JIFFIES);
> +	return 0;
> +}

[Severity: High]
Similarly, on resume, if dell_xps_ec_suspend_cmd() returns an error, the
function returns early and skips rescheduling the critical polling work.

Can this leave the device without thermal management after a transient
I2C error during power state transitions?

[ ... ]

> +static const struct i2c_device_id dell_xps_ec_i2c_id[] =3D {
> +	{ "dell-xps-ec" },
> +	{}
> +};

[Severity: Low]
Should this use a named initializer?

The I2C subsystem guidelines require that initialized arrays of type
struct i2c_device_id must use named initializers rather than positional one=
s.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260801-dell-xps-9=
345-ec-v3-0-9f4bdb5a5dad@vinarskis.com?part=3D2
