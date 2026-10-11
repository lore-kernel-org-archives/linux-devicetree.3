Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1353369981
	for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 17:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791741589; cv=none; b=q5NzGH4saI/su2zecJaiEyhCX7sZvAtTlLkU+Ib1vqqWxgBoh5EMf3dKO48Je/dOKat2iKnTjR8y2rPYqZMO3dC9wBKmiGGy2qBWn88ptxtWZKL1W3wLfN4V7M8Ah6PyDiH0KcQNVz4ey1s2TIluI9L2IByvdFQDKGKtIcI25ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791741589; c=relaxed/simple;
	bh=dNcMBwwmpQPohXrvwHfb62Vujqbw+cBUxVYKOtw8iBg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=k67ecboVxFS03sATxRjIIzT8SoNfSjulr4PkE/vHJFEhcrLxzwMSxg9OjlqJ8Ii0AFVLSK6qScp5No8G8byKiGdWuw7qUlL9db9Fgjqyvg3BTQq1KAEZU1VVfAVlvemEdO/SILOjw99LruGPGomRRWThukXNEZtmXiX1AiVn1E0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EaBPUOz2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EaBPUOz2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A17A1F0089C;
	Sun, 11 Oct 2026 17:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791741588;
	bh=+APF5+QHbnulQAXZS9adXjTfqtDuXhtStYg36krrAGU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EaBPUOz2aqmLPZb4faHiCzCydTj1OHQiHFdAeiW584NknlqyGaZOCKRnxeraDscZ0
	 6kcW1Z6daLTyMtAFezkdgZqoMoMlo9YslGRcX4PJQ1T2aj5Fug81xYgCFic9AqH/g/
	 o3JJHEBFujnxs6M6VEVRj1dTl2OW2KpKddkc88ypR0YWJCeRMHIoPq2hC8IgQvLCPa
	 1/ZlXJScOmIdpRhqKe58ElsHUEnXGhDhBgFVa/Q42e+xVDJ08H7PFGSLeSP27QxZcV
	 MQvIULNKwnSgTNXrGV9UOpu/ENRU6GhvWEun25BpRETT2+xLP6H7d6xXUlG5mmoy7l
	 8vR8wQi4d1PCQ==
Message-ID: <sashiko-outbox-167366@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/3] platform: arm64: dell-xps-ec: new driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aleksandrs Vinarskis" <alex@vinarskis.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20261011-dell-xps-9345-ec-v6-2-2a66a364fe70@vinarskis.com>
References: <20261011-dell-xps-9345-ec-v6-0-2a66a364fe70@vinarskis.com>
 <20261011-dell-xps-9345-ec-v6-2-2a66a364fe70@vinarskis.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 11 Oct 2026 17:59:47 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] platform/arm64: dell-xps-ec: interrupt storm due to un-cleared lev=
el IRQ
- [Medium] pm: early return in resume on I2C failure permanently disables t=
hermal polling
- [Medium] platform: off-by-one mismatch between thermistor profile IDs and=
 update IDs
--

commit bd6f1bc93a902f49663602dd218ea3f2d7526203
Author: Aleksandrs Vinarskis <alex@vinarskis.com>

platform: arm64: dell-xps-ec: new driver

Introduce EC driver for Dell XPS 13 9345 (codename 'tributo') which may
partially of fully compatible with Snapdragon-based Dell Latitude,
Inspiron ('thena'). Primary function of this driver is unblock EC's
thermal management, specifically to provide it with necessary
information to control device fans, peripherals power.

> diff --git a/drivers/platform/arm64/dell-xps-ec.c b/drivers/platform/arm6=
4/dell-xps-ec.c
> new file mode 100644
> index 0000000000000..cf2dd41b1aa68
> --- /dev/null
> +++ b/drivers/platform/arm64/dell-xps-ec.c
> @@ -0,0 +1,308 @@
[ ... ]
> +/*
> + * Format:
> + * - header/unknown (2 bytes)
> + * - per-thermistor entries (3 bytes): thermistor_id, param1, param2
> + */
> +static const u8 dell_xps13_9345_thermistor_profile[] =3D {
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
> +static const struct dell_xps_ec_therm dell_xps13_9345_therms[] =3D {
> +	/* TODO: 0x01 is sent only occasionally, likely TZ98 or TZ4. */
> +	{ "sys_therm0", 0x02 },
> +	{ "sys_therm1", 0x03 },
> +	{ "sys_therm2", 0x04 },
> +	{ "sys_therm3", 0x05 },
> +	{ "sys_therm4", 0x06 },
> +	{ "sys_therm5", 0x07 },
> +	{ "sys_therm6", 0x08 },
> +};

[Severity: Medium]
Does this thermistor ID mapping mismatch the profile?

The dell_xps13_9345_thermistor_profile array configures 7 thermistor IDs fr=
om
0x01 through 0x07 (with comments sys_therm0 through sys_therm6). However, t=
he
dell_xps13_9345_therms array maps sys_therm0 through sys_therm6 to command
bytes 0x02 through 0x08.

This misalignment means that the thermal polling loop sends temperature upd=
ates
to ID 0x08 (which is completely unconfigured in the EC profile) and fails to
send updates to ID 0x01 (which is explicitly configured in the profile). Wi=
ll
this configuration mismatch result in incorrect or missing thermal data bei=
ng
fed to the EC?

[ ... ]
> +static irqreturn_t dell_xps_ec_irq_handler(int irq, void *data)
> +{
> +	struct dell_xps_ec *ec =3D data;
> +
> +	/*
> +	 * TODO: IRQ is fired on lid-close. Follow Windows example to read out
> +	 *       the thermistor thresholds and potentially fan speeds.
> +	 */
> +	dev_dbg(ec->dev, "IRQ triggered (irq=3D%d)\n", irq);
> +
> +	return IRQ_HANDLED;
> +}

[Severity: High]
Will this dummy IRQ handler cause an interrupt storm?

The driver requests an EC interrupt which is defined as IRQ_TYPE_LEVEL_LOW =
in
the device tree (commit 8c751badf45b). The threaded IRQ handler simply logs=
 a
debug message and unconditionally returns IRQ_HANDLED without issuing any I=
2C
commands to acknowledge or clear the event on the EC hardware.

Because the interrupt is requested with IRQF_ONESHOT in dell_xps_ec_probe(),
the interrupt is unmasked after the threaded handler returns. Since the
level-triggered interrupt is never cleared on the EC, it will remain assert=
ed
and immediately fire again, potentially causing an infinite interrupt storm
that can consume 100% of a CPU core.

[ ... ]
> +static int dell_xps_ec_resume(struct device *dev)
> +{
> +	struct dell_xps_ec *ec =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret =3D dell_xps_ec_suspend_cmd(ec, false);
> +	if (ret)
> +		return ret;

[Severity: Medium]
Does this early return permanently disable thermal polling if the EC is slow
to wake?

During system resume, if dell_xps_ec_suspend_cmd() fails (e.g., due to a
transient bus error or the EC taking longer to wake up), the function retur=
ns
early without calling schedule_delayed_work().

Because the PM core largely ignores individual device resume errors and
continues bringing the system up, the device will remain in the 'resumed'
state, but the periodic temperature polling workqueue will be permanently
stopped. Will this starve the EC of the thermal updates required to spin the
fans, potentially leading to SoC overheating?

> +
> +	schedule_delayed_work(&ec->temp_work, DELL_XPS_EC_TEMP_POLL_JIFFIES);
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261011-dell-xps-9=
345-ec-v6-0-2a66a364fe70@vinarskis.com?part=3D2
